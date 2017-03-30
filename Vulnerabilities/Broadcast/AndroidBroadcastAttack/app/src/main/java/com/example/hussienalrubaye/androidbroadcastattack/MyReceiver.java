package com.example.hussienalrubaye.androidbroadcastattack;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

/**
 * Created by hussienalrubaye on 3/6/16.
 */
public class  MyReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
         String DataBundel="";
        // get app the data sent on bundle
        Bundle bundle= intent.getExtras();
        //lopp through all keys in the bundle
        for (String key : bundle.keySet()) {
            // get object by key( we define object became it may be text or image or whatever
            Object value = bundle.get(key);
            //get all keys
            DataBundel+= String.format("%s %s (%s)", key, value.toString(), value.getClass().getName());
        }
        //display notify message to the user
        NewMessageNotification NotifyMe=new NewMessageNotification();
        NotifyMe.notify(  context, DataBundel, 123);

    }
}