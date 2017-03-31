package com.example.hussienalrubaye.sender;

import android.content.Intent;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import org.w3c.dom.Text;

public class MainActivity extends AppCompatActivity {

    // Define Comment edit Text
  EditText etComment;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Define send button
        Button buSend=(Button)findViewById(R.id.buSend);
        //// init Comment edit Text
        final EditText etComment=(EditText)findViewById(R.id.etComment);
        //button listen to click event
        buSend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // set the package that we want to run
                Intent intent=getPackageManager().getLaunchIntentForPackage("com.example.hussienalrubaye.receiver");
                // put the data that we want to send over intent
                intent.putExtra("Comment", etComment.getText().toString() );
                // start another app
           startActivity(intent);

            }
        });
    }

    // cipher encryption add shift for key
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
