package com.example.hussienalrubaye.hackerapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // init the textView to dipslay data
        TextView txtDisplay=(TextView)findViewById(R.id.txtDisplay);
        String DataBundel="";
         // get app the data sent on bundle
        Bundle bundle=getIntent().getExtras();
        //lopp through all keys in the bundle
        for (String key : bundle.keySet()) {
            // get object by key( we define object became it may be text or image or whatever
            Object value = bundle.get(key);
            //get all keys
            DataBundel+= String.format("%s %s (%s)", key, value.toString(), value.getClass().getName());
        }
        txtDisplay.setText(DataBundel);
    }
}
