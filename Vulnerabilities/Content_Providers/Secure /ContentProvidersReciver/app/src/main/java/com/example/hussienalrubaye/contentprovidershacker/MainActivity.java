package com.example.hussienalrubaye.contentprovidershacker;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
TextView textView1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        textView1=(TextView)findViewById(R.id.textView1);

        FloatingActionButton fbQuery = (FloatingActionButton) findViewById(R.id.fbQuery);
        fbQuery.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                QueryGet();
            }
        });
    }

    // Retrieve student records
    String URL = "content://com.example.provider.College/students";
    static final String _ID = "_id";
    static final String NAME = "name";
    static final String GRADE = "age";


    public void QueryGet() {


        Uri students = Uri.parse(URL);
        Cursor c = getContentResolver().query(students, null, null, null, "name");
String data="";
        if (c.moveToFirst()) {
            do{
                data+=(c.getString(c.getColumnIndex( _ID)) +
                                ", " + cipher(c.getString(c.getColumnIndex( NAME)) ,-10)+
                                ", " + cipher(c.getString(c.getColumnIndex( GRADE)),-10));
            } while (c.moveToNext());


        }
        textView1.setText(data);
    }

    // cipher encryption add shift for key
    public   String cipher(String msg, int shift) {
        String s = "";
        int len = msg.length(); // get string length
        for (int x = 0; x < len; x++) {
            char c = (char) (msg.charAt(x) + shift);  // shift every character
            s += c; // append the characters
        }
        return s;
    }
}
