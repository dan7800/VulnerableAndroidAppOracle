package com.example.hussienalrubaye.androidbroadcast;

import android.app.IntentService;
import android.content.Intent;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by hussienalrubaye on 3/6/16.
 * this services send  broadcast messages every 50000ms
 */
public class ServiceNotification extends IntentService {
   public static boolean ServiceIsRun=false;

    public ServiceNotification() {
        super("MyWebRequestService");
    }
    protected void onHandleIntent(Intent workIntent) {

        // continue sending the messages
        while ( ServiceIsRun) {
             // creat new intent
            Intent intent = new Intent();
            //set the action that will receive our broadcast
            intent.setAction("com.example.Broadcast");
            // add data to the bundle
            intent.putExtra("username", "alxs1aa");
            // send the data to broadcast
            sendBroadcast(intent);
            //delay for 50000ms
            try{
                Thread.sleep(50000);
            }catch (Exception ex){}


        }
    }


}
