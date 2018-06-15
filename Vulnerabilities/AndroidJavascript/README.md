# Android and JavaScript

### Background

Android has a tool called WebView allowing users to visit websites and view other content on the web. This web content normally consists of some HTML, CSS and JavaScript that are rendered in WebView. Android allows developers to enable or disable running JavaScript in WebView for security purposes. As JavaScript is client side, Android allows JavaScript to read and write data from the device. For example, we could have JavaScript display an alert or open a new activity on the Android device. This means that anyone could view the source code of a web page that has Android JavaScript, get access to the script and use this script (in another website) to access data on the device.

Today we will investigate how sending and receiving sensitive data using JavaScript is not secure.   
We will build an app that sends sensitive data like the user’s phone number to the server, and then demonstrate how a hacker’s app can read and get access to this data.

### Creating HTML file

Open new file named News.html

```html

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>News </title>
</head>
<body>
<h1> Best Bird for weekend</h1>
<img src="bird.jpg" width="200" hight="200">
<p>This app is getting the phone number of any phone browser it is using related app and display the phone number bellow</p>

<br/>
<p id="phone"> </p>
<script type="text/javascript">
// functions call to get user phone number
    function GetPhoneNumber() {
 // gettting user phone number from android device
    var PhoneNumber= Android.GetPhoneNumber();
    document.getElementById("phone").innerHTML="Phone is "+ PhoneNumber;
    }
    //call get phone number
    GetPhoneNumber();
</script>

</body>
</html>
```


The website should look like this

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image2.png" alt="Image">

Then you can use any local webserver to serve the file.

If you do not want to test it with a local server you can browse this url https://goo.gl/TIGDOb .   


### Steps to build the News View App

1. Open new project with name “AndroidJavaScript”, save the package name as we need it in later steps.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image3.png" alt="Image">

2. Make sure Minimum SDK is Marshmallow or newer

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image4.png" alt="Image">

3. You may then continue with default settings when creating the project and create an Empty Activity

2. Paste the following code to res/layout/activity_main.xml

```xml

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <LinearLayout
        android:orientation="vertical"
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="horizontal">

            <TextView
                android:id="@+id/textView"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_weight="0"
                android:text="URL:"
                android:textAppearance="?android:attr/textAppearanceLarge"
                android:textSize="12dp" />

            <EditText
                android:id="@+id/etURL"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_weight="1"
                android:text="https://goo.gl/TIGDOb"
                android:textSize="12dp" />

            <Button
                android:id="@+id/buGo"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_weight="0"
                android:text="Go" />

        </LinearLayout>

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:orientation="horizontal">

            <WebView
                android:id="@+id/wvURL"
                android:layout_width="match_parent"
                android:layout_height="match_parent"
                android:layout_alignParentLeft="true"
                android:layout_alignParentStart="true"
                android:layout_alignParentTop="true"
                android:layout_weight="0" />
        </LinearLayout>

    </LinearLayout>
</RelativeLayout>


```

The result should look like this

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image5.png" alt="Image">


3. Add permission in app/manifests/AndroidManinfest.xml file to access to network and user phone number

```xml

<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>


```


Your manifest file will now look like: (be sure to retain your package name)

```xml

<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="***YOUR PACKAGE NAME">


    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/AppTheme">
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
    </mainfest>

```




4. Paste the following code into your java/MainActivity.java file. Be sure to retain your selected package name at the top of the document.

```java
package xxxxxxxx;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    EditText etURL; //navigation url
    WebView browser; // web browser

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etURL = (EditText) findViewById(R.id.etURL);
        browser = (WebView) findViewById(R.id.wvURL);

        //Enable Javascript
        browser.getSettings().setJavaScriptEnabled(true);

        //Inject WebAppInterface methods into Web page by having Interface name 'Android'
        browser.addJavascriptInterface(new WebAppInterface(), "Android");

        browser.setWebViewClient(new WebViewClient() {

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                view.loadUrl(url);
                return true;
            }

        });

        // button that click to go to url
        Button buClick = (Button) findViewById(R.id.buGo);

        //  event to navigate to website
        buClick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //check if the API>=23 to display runtime request permission
                if ((int) Build.VERSION.SDK_INT >= 23) {

                    // check if this permission is not grated yet
                    if (ActivityCompat.checkSelfPermission(getApplicationContext(), Manifest.permission.READ_PHONE_STATE) !=
                            PackageManager.PERMISSION_GRANTED) {

                        //shouldShowRequestPermissionRationale(). This method returns true
                        // if the app has requested this permission previously and the user denied the request.
                        if (!shouldShowRequestPermissionRationale(Manifest.permission.READ_PHONE_STATE)) {

                            // display request permission
                            requestPermissions(new String[]{Manifest.permission.READ_PHONE_STATE},
                                    REQUEST_CODE_ASK_PERMISSIONS);
                            return;

                        }

                        return;
                    }
                }

                //load the url that written in edittext to the webview
                LoadURL();
            }
        });
    }

    //Class to be injected in Web page
    public class WebAppInterface {

        //This method return user phone number to the javascript calls from website
        @JavascriptInterface   // must be added for API 17 or higher
        public String GetPhoneNumber() {
            return GetUserPhoneNumber();// "585-444-3234";
        }

    }

    /* this method is getting
    user phone number from his device
    */
    String GetUserPhoneNumber() {
        TelephonyManager tMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        String mPhoneNumber = tMgr.getLine1Number();
        return mPhoneNumber;
    }

    void LoadURL() {

        //load the url that written in edittext to the webview
        browser.loadUrl(etURL.getText().toString());
    }

    //get access to mailbox
    final private int REQUEST_CODE_ASK_PERMISSIONS = 123;

    //request permsion result
    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {

            case REQUEST_CODE_ASK_PERMISSIONS:

                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    // load the url data
                    LoadURL();

                } else {
                    // Permission Denied

                }
                break;
            default:
                super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}
```

You may now build the app to view the page content. Note: Starting the emulator may take some time depending on the speed of your machine.

View the page content

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image6.png" alt="Image">

### Steps to build the hacker app

Another website can embed the same permissions included in your website’s script to gain access to user’s data on the device.

1. A hacker could inspect your website’s code and see that you are using Android function in your script

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image7.png" alt="Image">

2. Hacker will insert same JavaScript in his website. When your users view this website, he will get user’s personal information through your app’s permissions

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image8.png" alt="Image">

### Hacker's website
If you do not want to run local server you can use this url https://bitly.com/2sfdX0v  (0->zero) as the hacker url. 
NOTE: If you want to see hacker website code, open this url https://bitly.com/2sfdX0v on a browser and right click on the page-> view page source to view code.

<img style="margin:9px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image9.png" alt="Image">

### Fix This Problem

To fix this problem, we must send sensitive data only to the websites that are authorised to access the data. for e.g.,we could enable JavaScript to be run only in our website. The code below allows sending sensitive data only to the websites that we authorize. Open MainActivity.java, remove the previous code except package name(first line) and paste the below code.

```java
package ***YOUR PACKAGE NAME***

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    //get access to mailbox
    EditText etURL; //navigation url
    WebView browser; // web browser
    String HostingURL = "https://goo.gl/TIGDOb";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etURL = (EditText) findViewById(R.id.etURL);
        browser = (WebView) findViewById(R.id.wvURL);

        //Enable Javascript
        browser.getSettings().setJavaScriptEnabled(true);

        //Inject WebAppInterface methods into Web page by having Interface name 'Android'
        browser.addJavascriptInterface(new WebAppInterface(), "Android");

        browser.setWebViewClient(new WebViewClient() {

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                view.loadUrl(url);
                return true;
            }

        });

        // button that click to go to url
        Button buClick = (Button) findViewById(R.id.buGo);

        //  event to navigate to website
        buClick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //check if the API>=23 to display runtime request permission
                if ((int) Build.VERSION.SDK_INT >= 23) {

                    // check if this permission is not grated yet
                    if (ActivityCompat.checkSelfPermission(getApplicationContext(), Manifest.permission.READ_PHONE_STATE) !=
                            PackageManager.PERMISSION_GRANTED) {

                        //shouldShowRequestPermissionRationale(). This method returns true
                        // if the app has requested this permission previously and the user denied the request.
                        if (!shouldShowRequestPermissionRationale(Manifest.permission.READ_PHONE_STATE)) {

                            // display request permission
                            requestPermissions(new String[]{Manifest.permission.READ_PHONE_STATE},
                                    REQUEST_CODE_ASK_PERMISSIONS);
                            return;

                        }

                        return;
                    }
                }

                //load the url that written in edittext to the webview
                LoadURL();
            }
        });
    }

    //Class to be injected in Web page
    public class WebAppInterface {

        //This method return user phone number to the javascript calls from website
        @JavascriptInterface   // must be added for API 17 or higher
        public String GetPhoneNumber() {

                     // only send the phone to authorize website
                             if(etURL.getText().toString().indexOf(HostingURL)==0)
                return GetUserPhoneNumber();

                      else
                         return  null;

        }

    }

    /* this method is getting
    user phone number from his device
    */
    String GetUserPhoneNumber() {
        TelephonyManager tMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        String mPhoneNumber = tMgr.getLine1Number();
        return mPhoneNumber;
    }

    void LoadURL() {

        //load the url that written in edittext to the webview
        browser.loadUrl(etURL.getText().toString());
    }

    //get access to mailbox
    final private int REQUEST_CODE_ASK_PERMISSIONS = 123;

    //request permsion result
    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {

            case REQUEST_CODE_ASK_PERMISSIONS:

                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    // load the url data
                    LoadURL();

                } else {
                    // Permission Denied

                }
                break;
            default:
                super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}
```
As we see our website could access the phone number while hacker website cannot.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/AndroidJavascript/image10.png" alt="Image">
