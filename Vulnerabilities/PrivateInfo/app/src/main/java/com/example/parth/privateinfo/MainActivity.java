package com.example.parth.privateinfo;

import android.os.AsyncTask;
import android.security.NetworkSecurityPolicy;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;
import java.util.UUID;

public class MainActivity extends AppCompatActivity {

    Button saveButton;
    EditText nameText,colorText,petName;
    String url = "http://vm-007.casci.rit.edu:3000";
    URL urlObject;
    String uniqueID = UUID.randomUUID().toString();
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        saveButton = findViewById(R.id.button);
        nameText = findViewById(R.id.editText);
        colorText = findViewById(R.id.editText2);
        petName = findViewById(R.id.editText3);
        textView = findViewById(R.id.textView2);

        saveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(!nameText.getText().equals("") && !colorText.getText().equals("") && !petName.getText().equals("")) {

                    JSONObject infoObject = new JSONObject();
                    try {
                        infoObject.put("uniqueIdKey",uniqueID);
                        infoObject.put("name", nameText.getText());
                        infoObject.put("color", colorText.getText());
                        infoObject.put("petName", petName.getText());
                        AsyncPostTask task = new AsyncPostTask();
                        task.execute(infoObject);
                        textView.setText("Link: "+"http://vm-007.casci.rit.edu:3000/?id="+uniqueID);
                    } catch (JSONException exception) {
                        exception.printStackTrace();
                    }

                }
                else{
                    Toast.makeText(getBaseContext(),"Please enter form completely!",Toast.LENGTH_LONG).show();
                }
            }
        });


    }

        class AsyncPostTask extends AsyncTask<JSONObject,Void,Void>{
        @Override
        protected Void doInBackground(JSONObject... jsonObjects) {

            for (JSONObject object:jsonObjects) {
                Log.i("AsyncPostTask","Sending data to server... Psst");
                try {
                    urlObject = new URL(url);
                    HttpURLConnection connection = (HttpURLConnection) urlObject.openConnection();
                    connection.setDoOutput(true);
                    connection.setDoInput(true);
                    connection.setRequestProperty("Content-Type","application/json");
                    connection.setRequestProperty("Accept","application/json");
                    connection.setRequestMethod("POST");

                    OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
                    writer.write(object.toString());
                    writer.flush();

                    //See sent output here
                    StringBuilder builder = new StringBuilder();
                    int httpResponseCode = connection.getResponseCode();
                    if(httpResponseCode == HttpURLConnection.HTTP_OK){
                        Scanner scanner = new Scanner(new InputStreamReader(connection.getInputStream()));
                        while(scanner.hasNext()){
                            builder.append(scanner.nextLine()+"\n");
                        }
                    }
                    System.out.println(builder.toString());
                }
                catch (IOException e) {
                    e.printStackTrace();
                }

            }
            return null;
        }
    }
}
