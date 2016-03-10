package com.example.hussienalrubaye.sharedref;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    // key for user name
    public final String UserName = "admin";
    // key for password
    public  final String Password = "admin";
    // shared references instance to access to virtual file
    SharedPreferences sharedpreferences;
    // input text name
    EditText etUserName;
    // input text password
    EditText etPassword;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        // initialize  user name  instance with the real input in xml
        etUserName=(EditText)findViewById(R.id.etUserName);
        // initialize  password  instance with the real input in xml
        etPassword=(EditText)findViewById(R.id.etPassword);
        //  // initialize shared references
        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        // listen to floating button when click
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if(UserName.equals(etUserName.getText().toString()) && Password.equals(etPassword.getText().toString()))
                //display message saved
                {
                    Toast.makeText(MainActivity.this, "Data is Saved", Toast.LENGTH_LONG).show();
                    Intent intent = new Intent(getApplicationContext(), Main2Activity.class);
                   intent.putExtra("key", 3433);
                    startActivity(intent);
                }

            }
        });
    }

}
