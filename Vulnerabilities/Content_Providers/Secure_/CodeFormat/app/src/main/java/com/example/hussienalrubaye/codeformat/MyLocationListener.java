package com.example.hussienalrubaye.codeformat;


import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * This service listen to change in user location every 1 meter
 * and send this data over http to server to save user location
 */
public class MyLocationListener implements LocationListener {
    // previous send date
    Date interestingDate = new Date();
    Context context;
    public static boolean ISActive = false;
    String URL;
    long DiffDate;

    public MyLocationListener(Context context) {
        this.context = context;
    }

    // this method calls every change in one meter in user location
    public void onLocationChanged(Location location) {

        //check if there is more than 1 minute past from last send
        DiffDate = (new Date()).getTime() - interestingDate.getTime();

        if (DiffDate > 60000) {
            interestingDate = new Date();
            //define the http url that recive location
            URL = "http://news.alruabye.net/newfeeds.aspx?Latitude=" + Double.toString(location.getLatitude()) + "&Longitude=" + Double.toString(location.getLongitude());
            Toast.makeText(context, URL, Toast.LENGTH_LONG).show();

            try {
                //define url for send user location
                URL url = new URL(URL);
                //make http connection to send user location
                HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setConnectTimeout(7000);//set timeout to 5 seconds
                //  InputStream in = new BufferedInputStream(urlConnection.getInputStream());


            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                //urlConnection.disconnect();
            }
        }

    }

    public void onStatusChanged(String s, int i, Bundle b) {

    }

    public void onProviderDisabled(String s) {

    }

    public void onProviderEnabled(String s) {

    }


}
