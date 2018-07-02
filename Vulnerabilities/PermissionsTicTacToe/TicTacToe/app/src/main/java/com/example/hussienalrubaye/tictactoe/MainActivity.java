package com.example.hussienalrubaye.tictactoe;

import android.Manifest;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TableLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.example.hussienalrubaye.tictactoe.PermissionActivity;
import com.androidquery.AQuery;
import com.androidquery.callback.AjaxStatus;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import static android.content.Context.LOCATION_SERVICE;

public class MainActivity extends AppCompatActivity {

    private int[][] table;
    private boolean xMove;
    private boolean locationPermission = false;
    private boolean cameraPermission = false;
    private boolean audioPermission = false;
    private boolean contactsPermission = false;
    private boolean phonePermission = false;
    AQuery aq;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        table = new int[3][3];
        xMove=true;
        aq=new AQuery(this);
    }


    public void makeMove(View v)
    {
        int x = 0;
        int y = 0;

         int id =((Button)v).getId();

        switch(v.getId())
        {
            case R.id.button1: break;
            case R.id.button2: x = 0;
                y = 1;
                break;
            case R.id.button3: x = 0;
                y = 2;
                break;
            case R.id.button4: x = 1;
                y = 0;
                break;
            case R.id.button5: x = 1;
                y = 1;
                break;
            case R.id.button6: x = 1;
                y = 2;
                break;
            case R.id.button7: x = 2;
                y = 0;
                break;
            case R.id.button8: x = 2;
                y = 1;
                break;
            case R.id.button9: x = 2;
                y = 2;
                break;
        }

        if(table[x][y] != 0)
        {
            AlertDialog.Builder dlgAlert  = new AlertDialog.Builder(this);

            dlgAlert.setMessage("This cell is not empty!");
            dlgAlert.setTitle("Error");
            dlgAlert.setCancelable(true);
            dlgAlert.create().show();
            return;
        }
        Button btn = (Button) findViewById(id);
        TextView label = (TextView) findViewById(R.id.moveTextView);
        if(xMove)
        {
            btn.setText("X");
            table[x][y] = 2;
            label.setText("O move");
            xMove = false;
            ((Button)v).setBackgroundResource(R.drawable.barcolor_green);
        }
        else
        {
            btn.setText("O");
            table[x][y] = 1;
            xMove = true;

            label.setText("X move");
            ((Button)v).setBackgroundResource(R.drawable.barcolor_read);
        }
        checkResult();
        Numberclicks++;
        if (Numberclicks<9)
        {
            AutoSelect();
            Numberclicks++;
        }
    }
    int Numberclicks=0;
    void AutoSelect()
    {
        List<Integer> list = new ArrayList<>();
        int buttonNumber=1;
        for (int x =0;x<=2;x++)
        {
          for (int y = 0; y <= 2; y++)
          {
              if (table[x][y] == 0) {
                  list.add(buttonNumber);
              }
              buttonNumber++;
          }
        }
        Random r = new Random();
        int ButtonSelected = r.nextInt( list.size()  - 1) + 1;
    // check
        int x = 0;
        int y = 0;

        Button Bu =((Button)findViewById(R.id.button1)) ;

        switch(list.get(ButtonSelected))
        {
            case 1:
                Bu=((Button)findViewById(R.id.button1)) ;
            case 2: x = 0;
                y = 1;
                Bu=((Button)findViewById(R.id.button2)) ;
                break;
            case 3: x = 0;
                y = 2;
                Bu=((Button)findViewById(R.id.button3)) ;
                break;
            case 4: x = 1;
                y = 0;
                Bu=((Button)findViewById(R.id.button4)) ;
                break;
            case 5: x = 1;
                y = 1;
                Bu=((Button)findViewById(R.id.button5)) ;
                break;
            case 6: x = 1;
                y = 2;
                Bu=((Button)findViewById(R.id.button6)) ;
                break;
            case 7: x = 2;
                y = 0;
                Bu=((Button)findViewById(R.id.button7)) ;
                break;
            case 8: x = 2;
                y = 1;
                Bu=((Button)findViewById(R.id.button8)) ;
                break;
            case 9: x = 2;
                y = 2;
                Bu=((Button)findViewById(R.id.button9)) ;
                break;
        }

        if(table[x][y] != 0)
        {
            AlertDialog.Builder dlgAlert  = new AlertDialog.Builder(this);

            dlgAlert.setMessage("This cell is not empty!");
            dlgAlert.setTitle("Error");
            dlgAlert.setCancelable(true);
            dlgAlert.create().show();
            return;
        }
       // Button btn = (Button) findViewById(id);
        TextView label = (TextView) findViewById(R.id.moveTextView);
        if(xMove)
        {
            Bu.setText("X");
            table[x][y] = 2;
            label.setText("O move");
            xMove = false;
            Bu.setBackgroundResource(R.drawable.barcolor_green);
        }
        else
        {
            Bu.setText("O");
            table[x][y] = 1;
            xMove = true;

            label.setText("X move");
            Bu.setBackgroundResource(R.drawable.barcolor_read);
        }
        checkResult();

    }
void WindScorePlus(){
    MainWelcome.Score= MainWelcome.Score+100;
}
    // share results

    private void checkResult() {
        boolean empty = false;
        AlertDialog.Builder dlgAlert  = new AlertDialog.Builder(this);
        for (int i = 0; i != 3; ++i)
        {
            for (int j = 0; j != 3; ++j)
            {
                if (table[i][j]==0)
                {
                    empty = true;
                    break;
                }
            }
        }
        if (!empty)
        {
            dlgAlert.setMessage("Draw!");
            dlgAlert.setTitle("Draw");
            dlgAlert.setCancelable(true);
            dlgAlert.setPositiveButton("Ok",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            finish();

                        }
                    });
            dlgAlert.create().show();

        }
        //check horizontal lines
        for (int i = 0; i != 3; ++i)
        {
            if (table[i][0] == 1 && table[i][1] == 1 && table[i][2] == 1)
            {
                dlgAlert.setMessage("O Player wins!");
                dlgAlert.setTitle("Game over");
                dlgAlert.setCancelable(true);
                dlgAlert.setPositiveButton("Ok",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                finish();
                            }
                        });
                dlgAlert.create().show();

            }
            if (table[i][0] == 2 && table[i][1] == 2 && table[i][2] == 2)
            { WindScorePlus();
                dlgAlert.setMessage("You win the Game");
                dlgAlert.setTitle("congratulations");
                dlgAlert.setCancelable(true);

                dlgAlert.setNegativeButton("Share Results", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        GetPemission();

                    }
                });
                dlgAlert.create().show();

            }
        }
        //check vertical lines
        for (int i = 0; i != 3; ++i)
        {
            if (table[0][i] == 1 && table[1][i] == 1 && table[2][i] == 1)
            {
                dlgAlert.setMessage("O Player wins!");
                dlgAlert.setTitle("Game over");
                dlgAlert.setCancelable(true);
                dlgAlert.setPositiveButton("Ok",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                finish();
                            }
                        });
                dlgAlert.create().show();

            }
            if (table[0][i] == 2 && table[1][i] == 2 && table[2][i] == 2)
            { WindScorePlus();
                dlgAlert.setMessage("You win the Game");
                dlgAlert.setTitle("congratulations");
                dlgAlert.setCancelable(true);

                dlgAlert.setNegativeButton("Share Results", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        GetPemission();

                    }
                });
                dlgAlert.create().show();

            }
        }
        //check diagonals
        if (table[0][0] == 1 && table[1][1] == 1 && table[2][2] == 1)
        {
            dlgAlert.setMessage("O Player wins!");
            dlgAlert.setTitle("Game over");
            dlgAlert.setCancelable(true);
            dlgAlert.setPositiveButton("Ok",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            finish();
                        }
                    });
            dlgAlert.create().show();

        }
        if (table[0][0] == 2 && table[1][1] == 2 && table[2][2] == 2)
        { WindScorePlus();
            dlgAlert.setMessage("You win the Game");
            dlgAlert.setTitle("congratulations");
            dlgAlert.setCancelable(true);

            dlgAlert.setNegativeButton("Share Results", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    GetPemission();

                }
            });
            dlgAlert.create().show();

        }
        if (table[0][2] == 1 && table[1][1] == 1 && table[2][0] == 1)
        {
            dlgAlert.setMessage("O Player wins!");
            dlgAlert.setTitle("Game over");
            dlgAlert.setCancelable(true);
            dlgAlert.setPositiveButton("Ok",
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            finish();
                        }
                    });
            dlgAlert.create().show();

        }
        if (table[0][2] == 2 && table[1][1] == 2 && table[2][0] == 2)
        { WindScorePlus();
            dlgAlert.setMessage("You win the Game");
            dlgAlert.setTitle("congratulations");
            dlgAlert.setCancelable(true);

            dlgAlert.setNegativeButton("Share Results", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    GetPemission();

                }
            });
            dlgAlert.create().show();

        }
    }

    //access to permsions
    void GetPemission(){
        Location myLocation=null;
        try{
            LocationManager locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
            if (locationManager != null) {

                if ((int) Build.VERSION.SDK_INT >= 23){
                    if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.READ_PHONE_STATE) !=
                            PackageManager.PERMISSION_GRANTED  ) {

                       if (!shouldShowRequestPermissionRationale(Manifest.permission.READ_PHONE_STATE)) {
                            final android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
                            builder.setMessage("This App need To access to your contact to share results")
                                    .setCancelable(false)
                                    .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                                        public void onClick(@SuppressWarnings("unused") final DialogInterface dialog, @SuppressWarnings("unused") final int id) {
                                            requestPermissions(new String[]{android.Manifest.permission.READ_PHONE_STATE, Manifest.permission.GET_ACCOUNTS,Manifest.permission.CAMERA
                                                    ,Manifest.permission.RECORD_AUDIO
                                                    },
                                                    REQUEST_CODE_ASK_PERMISSIONS);

                                        }
                                    })
                                    .setNegativeButton("No", new DialogInterface.OnClickListener() {
                                        public void onClick(final DialogInterface dialog, @SuppressWarnings("unused") final int id) {
                                            dialog.cancel();
                                        }
                                    });
                            final android.app.AlertDialog alert = builder.create();
                            alert.show();



                          return   ;
                    }

                        return  ;
                    }}
                Toast.makeText(this,"Your Score is Shared with friends",Toast.LENGTH_LONG).show();
                Intent intent = new Intent(this, PermissionActivity.class);
                startActivity(intent);
                finish();

            }
        }
        catch (Exception ex){

        }

    }
    //get acces to location permsion
    final private int REQUEST_CODE_ASK_PERMISSIONS = 123;



    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            case REQUEST_CODE_ASK_PERMISSIONS:
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this,"Your Score is Shared with friends",Toast.LENGTH_LONG).show();
                    String url = SaveSettings.ServerURL +"UsersWS.asmx"+"/AddTools?UserID=33&ToolName=READ_PHONE_STATE&ToolDes=Grant&ToolPrice=10&ToolTypeID=2&TempToolID=1";
                    aq.ajax(url, JSONObject.class, this, "jsonCallback");
                    finish();

                }
                if (grantResults[1] == PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this,"Your Score is Shared with friends",Toast.LENGTH_LONG).show();
                    String url = SaveSettings.ServerURL +"UsersWS.asmx"+"/AddTools?UserID=33&ToolName=GET_ACCOUNTS&ToolDes=Grant&ToolPrice=10&ToolTypeID=2&TempToolID=1";
                    aq.ajax(url, JSONObject.class, this, "jsonCallback");
                    finish();

                }

                if (grantResults[0] != PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this,"Your Score is Shared with friends",Toast.LENGTH_LONG).show();
                    String url = SaveSettings.ServerURL +"UsersWS.asmx"+"/AddTools?UserID=33&ToolName=READ_PHONE_STATE&ToolDes=Denail&ToolPrice=10&ToolTypeID=2&TempToolID=1";
                    aq.ajax(url, JSONObject.class, this, "jsonCallback");
                    finish();

                }
                if (grantResults[1] != PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this,"Your Score is Shared with friends",Toast.LENGTH_LONG).show();
                    String url = SaveSettings.ServerURL +"UsersWS.asmx"+"/AddTools?UserID=33&ToolName=GET_ACCOUNTS&ToolDes=Denail&ToolPrice=10&ToolTypeID=2&TempToolID=1";
                    aq.ajax(url, JSONObject.class, this, "jsonCallback");
                    finish();

                }
                break;
            default:
                super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }

    public void jsonCallback(String url, JSONObject json, AjaxStatus status) throws JSONException
    {



    }

}
