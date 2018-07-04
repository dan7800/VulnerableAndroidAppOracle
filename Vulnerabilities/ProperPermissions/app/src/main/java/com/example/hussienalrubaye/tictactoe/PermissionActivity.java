package com.example.hussienalrubaye.tictactoe;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.TextView;

public class PermissionActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_permission);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        TextView phoneTextView = (TextView) findViewById(R.id.phoneTextView);
        TextView contactsTextView = (TextView) findViewById(R.id.contactsTextView);
        TextView cameraTextView = (TextView) findViewById(R.id.cameraTextView);
        TextView audioTextView = (TextView) findViewById(R.id.audioTextView);
        TextView locationTextView = (TextView) findViewById(R.id.locationTextView);
        if(checkSelfPermission(Manifest.permission.READ_PHONE_STATE)== PackageManager.PERMISSION_GRANTED){

            phoneTextView.setText("Phone permission GRANTED!");
        }
        else{
            phoneTextView.setText("Phone permission DENIED!");
        }
        if(checkSelfPermission(Manifest.permission.GET_ACCOUNTS)== PackageManager.PERMISSION_GRANTED){

            contactsTextView.setText("Contacts permission GRANTED!");
        }
        else{
            contactsTextView.setText("Contacts permission DENIED!");
        }

        if(checkSelfPermission(Manifest.permission.CAMERA)== PackageManager.PERMISSION_GRANTED){

            cameraTextView.setText("Camera permission GRANTED!");
        }
        else{
            cameraTextView.setText("Camera permission DENIED!");
        }
        if(checkSelfPermission(Manifest.permission.RECORD_AUDIO)== PackageManager.PERMISSION_GRANTED){

            audioTextView.setText("Audio permission GRANTED!");
        }
        else{
            audioTextView.setText("Audio permission DENIED!");
        }
        if(checkSelfPermission(Manifest.permission.LOCATION_HARDWARE) == PackageManager.PERMISSION_GRANTED || checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED || checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED){

            locationTextView.setText("Location permission GRANTED!");
        }
        else{
            locationTextView.setText("Location permission DENIED!");
        }
    }

}
