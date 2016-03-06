package com.example.hussienalrubaye.androidbroadcast;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // check if the services is already runs in background
        if(ServiceNotification.ServiceIsRun==false ) {
            ServiceNotification.ServiceIsRun  = true;
            //register the services to run in background
            Intent intent = new Intent(this, ServiceNotification.class);
            // start the services
            startService(intent);

        }
    }
}
