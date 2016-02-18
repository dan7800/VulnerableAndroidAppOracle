package com.example.hussienalrubaye.androidadsvulerabilites;
import android.Manifest;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import com.example.hussienalrubaye.adslibrary.*;//import Ads library


public class MainActivity extends AppCompatActivity {
    TextView txtDisplay ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtDisplay=(TextView)findViewById(R.id.textv);
    }

    //load phone message when click button
    public void buLoadMessage(View view) {

        //check if the API>=23 to display runtime request permison
        if ((int) Build.VERSION.SDK_INT >= 23)
        {
            // check if this permission is not grated yet
            if (ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_SMS) !=
                    PackageManager.PERMISSION_GRANTED )
            {
                //shouldShowRequestPermissionRationale(). This method returns true
                // if the app has requested this permission previously and the user denied the request.
                if (!shouldShowRequestPermissionRationale(Manifest.permission.READ_SMS)) {
                    // display request permission
                   requestPermissions(new String[]{Manifest.permission.READ_SMS},
                           REQUEST_CODE_ASK_PERMISSIONS);
                    return   ;

                }

                return  ;
            }
        }

//call load messages
        LoadInboxMessages();
    }
    //get access to mailbox
    final private int REQUEST_CODE_ASK_PERMISSIONS = 123;
    //request permsion result
    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults)
    {
        switch (requestCode)
        {
            case REQUEST_CODE_ASK_PERMISSIONS:
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED)
                {
                    // Permission Granted
                    //call load messages
                    LoadInboxMessages();
                    /*
                     if Google add Clear permission  the developer
                     could avoid Ads company from using his permissions,
                     or group permission by package name
                    */

                } else {
                    // Permission Denied

                }
                break;
            default:
                super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }


    //Load user inbox messages
    void  LoadInboxMessages(){

        try{
            //define variable to hold all messages data
            String sms = "";
            //set inbox direct to read message from
            Uri uriSMSURI = Uri.parse("content://sms/inbox");
            //get all messages and load it in Cursor
            Cursor cur = getContentResolver().query(uriSMSURI, null, null, null, null);
            //move Cursor to first message
            cur.moveToPosition(0);
            //read all messages one by one
            while (cur.moveToNext()) {
                //load sender and the message content
                sms += "From :" + cur.getString(cur.getColumnIndex("address")) + " : " + cur.getString(cur.getColumnIndex("body"))+"\n";
            }
            //display message in Textbox
            txtDisplay.setText(sms);
        }   catch(Exception ex){

        }

        //initialize the ads
        AdsAul myAds=new AdsAul(this);
        // load ads to display Ads to user
        myAds.DisplayAds();
    }
}
