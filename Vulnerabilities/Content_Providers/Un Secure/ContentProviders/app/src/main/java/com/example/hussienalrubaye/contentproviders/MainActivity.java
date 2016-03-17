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
                // add new record
               Add();
            }
        });
        FloatingActionButton fbQuery = (FloatingActionButton) findViewById(R.id.fbQuery);
        fbQuery.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //load all records
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
((EditText)findViewById(R.id.editText2)).getText().toString());

        values.put(StudentsProvider.Age,
                ((EditText)findViewById(R.id.editText3)).getText().toString());
// define the play to insert the values in
        Uri uri = getContentResolver().insert(
                StudentsProvider.CONTENT_URI, values);
// display messages
        Toast.makeText(getBaseContext(),
                uri.toString(), Toast.LENGTH_LONG).show();
    }

    public void QueryGet() {

 // define content provider url to read from
        Uri students = Uri.parse(URL);
// get data ordered by name
        Cursor c = getContentResolver().query(students, null, null, null, "name");
// move through all items
        if (c.moveToFirst()) {
            do{
                // load the record name and age and id
                Toast.makeText(this,
                        c.getString(c.getColumnIndex(StudentsProvider._ID)) +
                                ", " +  c.getString(c.getColumnIndex( StudentsProvider.NAME)) +
                                ", " + c.getString(c.getColumnIndex( StudentsProvider.Age)),
                        Toast.LENGTH_SHORT).show();
            } while (c.moveToNext());
        }
    }
}
