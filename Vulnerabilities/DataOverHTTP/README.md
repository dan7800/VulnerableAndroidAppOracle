# Secure HTTP Requests
### Background
In Android, we use HTTP (HyperText Transfer Protocol) to exchange data between the client and the server. Sometimes, we send sensitive data, like username and password or user location from client to server over HTTP. Keep in mind that this request will move over the network. When this data is in transit, it is very easy for a hacker to intercept. Many people could interrupt and read this request data, so we must protect it.
We will demonstrate an example of how to send sensitive data between client to server over HTTP. We will then explain how hackers could read this data, along with suggestions of how to protect against this.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image1.png" alt="Image">

### Steps to build the app:
1.	In Android Studio, create a new project, named “HTTPInsecure”. Take note of the package name, as we will be needing this later in the tutorial. Click next.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image2.png" alt="Image">

On the next page, click next. The default API level will suffice for our needs right now.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image3.png" alt="Image">

2.	Select project type “Empty Activity”.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image4.png" alt="Image">

3.	 Our project will look like this when we are finished with the layout.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image5.png" alt="Image">
To do this, we will update activity_main.xml with the code below. The activity_main.xml file can be found under “res/layout” in the folders in the panel to the left.
Click the “Text” tab, found at the bottom of the window next to Design view to see the text view of the XML file. By default, it shows you the Design view first, which is what’s currently visible in the picture above.

```xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <ScrollView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:layout_weight="1">

        <LinearLayout
            android:orientation="vertical"
            android:layout_width="fill_parent"
            android:layout_height="fill_parent"
            android:paddingTop="30dp"
            android:paddingLeft="15dp"
            android:paddingRight="15dp">

            <LinearLayout
                android:orientation="vertical"
                android:layout_width="fill_parent"
                android:layout_height="wrap_content"
                android:id="@+id/LLogin"
                android:layout_marginTop="7dp"
                android:paddingLeft="20dp"
                android:paddingTop="4dp"
                android:paddingRight="20dp">

                <LinearLayout
                    android:orientation="vertical"
                    android:layout_width="fill_parent"
                    android:layout_height="wrap_content"
                    android:touchscreenBlocksFocus="false"
                    android:layout_marginBottom="2dp">

                    <EditText
                        android:gravity="center"
                        android:maxLength="50"
                        android:layout_width="fill_parent"
                        android:layout_height="wrap_content"
                        android:inputType="text"
                        android:ems="10"
                        android:id="@+id/EDTUserName"
                        android:layout_weight="1"
                        android:textColor="#ff1a102c"
                        android:background="@android:drawable/editbox_background"
                        android:textSize="18dp"
                        android:hint="Username"
                        android:paddingBottom="9dp"
                        android:paddingTop="9dp"
                        android:layout_marginBottom="10dp"/>
                </LinearLayout>



                <LinearLayout
                    android:orientation="vertical"
                    android:layout_width="fill_parent"
                    android:layout_height="wrap_content"
                    android:touchscreenBlocksFocus="false"
                    android:layout_marginBottom="2dp">

                    <EditText
                        android:gravity="center"
                        android:maxLength="50"
                        android:layout_width="fill_parent"
                        android:layout_height="wrap_content"
                        android:ems="10"
                        android:id="@+id/EDTpassword"
                        android:layout_weight="1"
                        android:textColor="#ff1a102c"
                        android:background="@android:drawable/editbox_background"
                        android:textSize="18dp"
                        android:hint="Password"
                        android:paddingBottom="9dp"
                        android:paddingTop="9dp"
                        android:layout_marginBottom="10dp"
                        android:inputType="textPassword" />
                </LinearLayout>
            </LinearLayout>

            <LinearLayout
                android:textAlignment="center"
                android:gravity="center"
                android:orientation="vertical"
                android:layout_width="match_parent"
                android:layout_height="match_parent">
                <Button
                    android:layout_width="150dp"
                    android:layout_height="wrap_content"
                    android:text="Login"
                    android:id="@+id/bulogin"
                    android:drawablePadding="4dp"
                    android:layout_marginBottom="10dp"
                    android:textColor="#ff06071c"
                    android:onClick="buloginckic"
                    android:layout_weight="0"
                    android:layout_marginLeft="15dp" />
            </LinearLayout>
        </LinearLayout>
    </ScrollView>
</RelativeLayout>
```

4. Next, update the MainActivity.java file with the code below. The MainActivity.java file can be found under the path “app/java/com.example.httpinsecure”.  (Be sure to update your package name)

```java
package xxxxxx;

import android.support.v7.app.AppCompatActivity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.Toast;
import android.view.View;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MainActivity extends AppCompatActivity {
@Override
protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);
}

    public void buloginckic(View view) {
        //get user name and password
        EditText UserName=(EditText)findViewById(R.id.EDTUserName);
        EditText Password=(EditText)findViewById(R.id.EDTpassword);

        // send user name and password over the http
        String url="http://sellingportal.alruabye.net/UsersWS.asmx/Login?UserName="+ UserName.getText().toString() +"&Password="+ Password.getText().toString();

        // start background task
        new MyAsyncTaskGetNews().execute(url, "news");
    }


    // get news from server
    public class MyAsyncTaskGetNews extends AsyncTask<String, String, String> {
        @Override
        protected void onPreExecute() {
            //before works
        }

        @Override
        protected String doInBackground(String... params) {
            try {
                String NewsData;
                //define the url we have to connect with
                URL url = new URL(params[0]);
                //make connect with url and send request
                HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
                //waiting for 7000ms for response
                urlConnection.setConnectTimeout(7000);//set timeout to 5 seconds

                try {
                    //getting the response data
                    InputStream in = new BufferedInputStream(urlConnection.getInputStream());
                    //convert the stream to string
                    NewsData = ConvertInputToStringNoChange(in);
                    //send to display data
                    publishProgress(NewsData);
                } finally {
                    //end connection
                    urlConnection.disconnect();
                }

            } catch (Exception ex){}
            return null;
        }

        protected void onProgressUpdate(String... progress) {
            try {
                //display response data
                Toast.makeText(getApplicationContext(),progress[0],Toast.LENGTH_LONG).show();
            } catch (Exception ex) {
            }
        }

        protected void onPostExecute(String result2) {

        }
    }

    // this method convert any stream to string
    public static String ConvertInputToStringNoChange(InputStream inputStream) {
        BufferedReader bureader=new BufferedReader( new InputStreamReader(inputStream));
        String line ;
        String linereultcal="";

        try {
            while((line=bureader.readLine())!=null) {

                linereultcal+=line;

            }
            inputStream.close();
        } catch (Exception ex) {}

        return linereultcal;
    }
}


```
5. Add permission to access the internet to Manifest.xml, found under “app/manifests/”. 
The highlighted line is the way we’re going to add the permission.

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="com.example.httpinsecure">

    <uses-permission android:name="android.permission.INTERNET"></uses-permission>
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:supportsRtl="true"
        android:theme="@style/AppTheme">
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity><!-- ATTENTION: This was auto-generated to add Google Play services to your project for
     App Indexing.  See https://g.co/AppIndexing/AndroidStudio for more information. -->
        <meta-data
            android:name="com.google.android.gms.version"
            android:value="@integer/google_play_services_version" />
    </application>

</manifest>


```
See the image below to see how to start the virtual device and run the app. You may need to click “Create New Virtual Device” if you have nothing under your list of Available Virtual Devices.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image6.png" alt="Image">
When the app comes up (which may take a while), enter username “Hussein” and password “abc”.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image7.png" alt="Image">

### How the data is vulnerable:
When this data is in transit, it is very easy for a hacker to intercept and read the data.

We will use WireShark app to monitor traffic. Go to https://www.wireshark.org/ to download and install it. Follow the installation wizard. 

Change the android device proxy to your IP address. To do so, in your Android device go to Settings->Cellular Networks->Access Point Names->Select the APN->Change Proxy to your device IPv4 
address and PORT to 8888. Save the changes.
To get your IP address, start your terminal/command prompt and type IPCONFIG.


Run WireShark application and select your internet mode and look for your IPv4 address and corresponding info, we see that the username and password is available.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image29.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataOverHTTP/image30.png" alt="Image">

How do we protect our app data in transit, then?
We should use HTTPS (HyperText Transfer Protocol Secure) when sending data over the network.

In order to use HTTPS, all we need to do is call openConnection() on a URL with “https” in front of it, then cast the resulting connection to HttpsURLConnection.

Here is the HTTP version of our code:

```java
public void buloginckic(View view) {
        //get user name and password
        EditText UserName=(EditText)findViewById(R.id.EDTUserName);
        EditText Password=(EditText)findViewById(R.id.EDTpassword);

        // send user name and password over the http
        String url="http://sellingportal.alruabye.net/UsersWS.asmx/Login?UserName="+ UserName.getText().toString() +"&Password="+ Password.getText().toString();

        // start background task
        new MyAsyncTaskGetNews().execute(url, "news");
    }

    // get news from server
    public class MyAsyncTaskGetNews extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... params) {
            try {
                String NewsData;
                //define the url we have to connect with
                URL url = new URL(params[0]);
                //make connect with url and send request
                HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
                //waiting for 7000ms for response
                urlConnection.setConnectTimeout(7000);//set timeout to 5 seconds


```
6- Add a class named “MainActivity.java”
```java
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
data+=(c.getString(c.getColumnIndex( _ID)) +", " +  c.getString(c.getColumnIndex( NAME)) +
", " + c.getString(c.getColumnIndex( GRADE)));
} while (c.moveToNext());
}
 textView1.setText(data);
    }
}

```
The relevant lines are highlighted above – some code has been omitted for clarity.
 
Unfortunately, the website we have been using (in our example code) to submit our username/password over does not support HTTPS, so we will not be able to demonstrate it in our current code. Below is a code sample of how HTTPS could be accomplished. We should also import javax.net.ssl.HttpsURLConnection instead of java.net.HttpURLConnection. 
```java 
URL url = new URL("https://en.wikipedia.org/wiki/Main_Page");
HttpsURLConnection urlConnection = (HttpsURLConnection) url.openConnection();
try {
InputStream in = new BufferedInputStream(urlConnection.getInputStream());
readStream(in);
} finally {
urlConnection.disconnect();
}

```

Resources
For more information, consult these links:
i.	HttpURLConnection Android API Reference
ii.	Security with HTTPS and SSL
