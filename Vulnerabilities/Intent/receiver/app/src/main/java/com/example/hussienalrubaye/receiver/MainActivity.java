package com.example.hussienalrubaye.receiver;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Define the display Text view
        TextView txtview=(TextView)findViewById(R.id.txtDisplay);
        // get app the data sent on bundle
        Bundle b=getIntent().getExtras();
        // display the key that have the data
        txtview.setText(b.getString("Comment"));
    }
}
