package com.example.hussienalrubaye.androidjavascript;

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
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText etURL; //navigation url
    WebView browser; // web browser

    // host name
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
