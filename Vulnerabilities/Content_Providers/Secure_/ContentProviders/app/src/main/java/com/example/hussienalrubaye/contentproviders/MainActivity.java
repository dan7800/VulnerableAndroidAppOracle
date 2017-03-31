package com.example.hussienalrubaye.contentproviders;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fabAdd = (FloatingActionButton) findViewById(R.id.fbSave);
        fabAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Add();
            }
        });
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

    public void Add() {
        // Add a new student record
        ContentValues values = new ContentValues();
// insert value
        values.put(StudentsProvider.NAME,
                cipher(((EditText) findViewById(R.id.editText2)).getText().toString(), 10));

        values.put(StudentsProvider.Age,
                cipher(((EditText) findViewById(R.id.editText3)).getText().toString(), 10));
// define the play to insert the values in
        Uri uri = getContentResolver().insert(
                StudentsProvider.CONTENT_URI, values);
// display messages
        Toast.makeText(getBaseContext(),
                uri.toString(), Toast.LENGTH_LONG).show();
    }

    public void QueryGet() {


        Uri students = Uri.parse(URL);

        Cursor c = getContentResolver().query(students, null, null, null, "name");

        if (c.moveToFirst()) {
            do {
                Toast.makeText(this,
                         c.getString(c.getColumnIndex(StudentsProvider._ID))+
                                ", " + cipher(c.getString(c.getColumnIndex(StudentsProvider.NAME)),-10)
                                 +
                                ", " +cipher( c.getString(c.getColumnIndex(StudentsProvider.Age)),-10) ,
                        Toast.LENGTH_SHORT).show();
            } while (c.moveToNext());
        }
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
