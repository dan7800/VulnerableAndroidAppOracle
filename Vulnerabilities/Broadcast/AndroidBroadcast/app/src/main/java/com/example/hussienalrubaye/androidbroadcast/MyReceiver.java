package com.example.hussienalrubaye.androidbroadcast;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

/**
 * Created by hussienalrubaye on 3/6/16.
 */
public class MyReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        // get the bundles in the message
        final Bundle bundle = intent.getExtras();
        // check the action equal to the action we fire in broadcast,
        if   (   intent.getAction().equalsIgnoreCase("com.example.Broadcast"))
            //read the data from the intent
            Toast.makeText(context,bundle.getString("username"),Toast.LENGTH_LONG).show();
    }
}

/* send broadcast by adb
am broadcast -a com.example.Broadcast -n com.example.hussienalrubaye.androidbroadcast/.MyReceiver
 */