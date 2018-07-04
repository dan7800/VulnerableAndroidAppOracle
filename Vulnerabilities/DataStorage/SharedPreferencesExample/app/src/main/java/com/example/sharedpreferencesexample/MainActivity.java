package com.example.sharedpreferencesexample;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    public static final String MY_PREFERENCES = "MyPrefLogin" ;
    public static final String USERNAME = "UsernameKey" ;
    public static final String USER_PASSWORD = "PasswordKey" ;
    SharedPreferences mSharedPreferences;
    EditText mUsernameEditText, mPasswordEditText;
    Button mStoreButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // initialize  the username EditText  instance
        mUsernameEditText = (EditText)findViewById(R.id.usernameEditText);

        // initialize  the password  EditText instance
        mPasswordEditText = (EditText)findViewById(R.id.passwordEditText);

        // initialize  the Button instance
        mStoreButton = (Button) findViewById(R.id.storeButton);

        // initialize SharedPreferences
        mSharedPreferences = getSharedPreferences(MY_PREFERENCES, Context.MODE_PRIVATE);

        // setting  on click listener for the button
        mStoreButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Store data
                // enable start editing file
                SharedPreferences.Editor editor = mSharedPreferences.edit();
                // add user name
                editor.putString(USERNAME, cipher(mUsernameEditText.getText().toString(),10));
                // add password
                editor.putString(USER_PASSWORD,cipher( mPasswordEditText.getText().toString(),10));
                // store the update data
                editor.commit();
                //display message to inform the user that the stored
                Toast.makeText(MainActivity.this, "Your data has stored successfully!", Toast.LENGTH_LONG).show();
            }
        });
    }

    // Cipher Method. Cipher encryption add shift for key
    String cipher(String msg, int shift){
        String s = "";
        int len = msg.length(); // get string length
        for(int x = 0; x < len; x++){
            char c = (char)(msg.charAt(x) + shift);  // shift every character
            s += c; // append the characters
        }
        return s;
    }
}