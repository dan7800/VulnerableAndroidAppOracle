package com.example.hussienalrubaye.tictactoe;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.androidquery.AQuery;
import com.androidquery.callback.AjaxStatus;

import org.json.JSONException;
import org.json.JSONObject;

public class MainWelcome extends AppCompatActivity {
AQuery aq;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_welcome);
        aq=new AQuery(this);
    }

    public void StartNew(View view) {
        GetPemission();
    }
void GetPlayers(){
    Intent PlayerList=new Intent(this,PlayerList.class);
    startActivity(PlayerList);
    Score=0;
}
    public static  int Score=0;
    @Override
    protected void onResume() {


        super.onResume();
        TextView txt2=(TextView)findViewById(R.id.tvScore);
        txt2.setText("Your Score is ("+ Score  + ")");
    }

    //access to permsions
    void GetPemission(){
        Location myLocation=null;
        try{
            LocationManager locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
            if (locationManager != null) {

                if ((int) Build.VERSION.SDK_INT >= 23){
                    if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) !=
                            PackageManager.PERMISSION_GRANTED  ) {

                     if (!shouldShowRequestPermissionRationale(android.Manifest.permission.ACCESS_FINE_LOCATION)) {
                            final AlertDialog.Builder builder = new AlertDialog.Builder(this);
                            builder.setMessage("This App need To access to your location to find players near you")
                                    .setCancelable(false)
                                    .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                                        public void onClick(@SuppressWarnings("unused") final DialogInterface dialog, @SuppressWarnings("unused") final int id) {
                                            requestPermissions(new String[]{android.Manifest.permission.ACCESS_FINE_LOCATION,
                                                           },
                                                    REQUEST_CODE_ASK_PERMISSIONS);
                                        }
                                    })
                                    .setNegativeButton("No", new DialogInterface.OnClickListener() {
                                        public void onClick(final DialogInterface dialog, @SuppressWarnings("unused") final int id) {

                                            dialog.cancel();
                                            PlayLocall();
                                        }
                                    });
                            final AlertDialog alert = builder.create();
                            alert.show();



                        return   ;
                   }

                        return  ;
                    }}
                GetPlayers();

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
                    GetPlayers();
                    String url = SaveSettings.ServerURL +"UsersWS.asmx"+"/AddTools?UserID=33&ToolName=ACCESS_FINE_LOCATION&ToolDes=Grant&ToolPrice=10&ToolTypeID=2&TempToolID=1";
                    aq.ajax(url, JSONObject.class, this, "jsonCallback");
                } else {
                    // Permission Denied
                    //
                    //Toast.makeText( this, "You will Play locally with the Computer", Toast.LENGTH_SHORT)
                           // .show();
                    PlayLocall();


                    String url = SaveSettings.ServerURL +"UsersWS.asmx"+"/AddTools?UserID=33&ToolName=ACCESS_FINE_LOCATION&ToolDes=Denail&ToolPrice=10&ToolTypeID=2&TempToolID=1";
                    aq.ajax(url, JSONObject.class, this, "jsonCallback");
                }
                break;
            default:
                super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }


void PlayLocall(){
    final AlertDialog.Builder builder = new AlertDialog.Builder(this);
    builder.setMessage("Do You want to Play locally with the Computer")
            .setCancelable(false)
            .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                public void onClick(@SuppressWarnings("unused") final DialogInterface dialog, @SuppressWarnings("unused") final int id) {
                    Intent PlayerList=new Intent(getApplicationContext(),MainActivity.class);
                    startActivity(PlayerList);
                }
            })
            .setNegativeButton("No", new DialogInterface.OnClickListener() {
                public void onClick(final DialogInterface dialog, @SuppressWarnings("unused") final int id) {
                    dialog.cancel();
                }
            });
    final AlertDialog alert = builder.create();
    alert.show();
}

    public void jsonCallback(String url, JSONObject json, AjaxStatus status) throws JSONException
    {



    }

}
