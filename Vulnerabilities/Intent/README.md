# Intents
### Background
In Android, we can send data between apps quite easily. For example, when we want to share images on Facebook from a local app, we send the image to the Facebook app over the bundle. Then, the Facebook app reads the image data and posts it. Another example might be that when we want to call someone, we send the phone number to call over the bundle to the calling API.

Sending data between apps is especially important for companies with multiple apps that need to interact in some way.

The problem is that sending data between apps is insecure in Android. For example, if we send data from app A to app B, any app C might have the same application ID of app B. App C could then receive the data that should be received by app B. We should not send important data between applications without taking defensive measures. 

We will demonstrate examples to show how to send data between two applications. Next, we will show how a (possibly) malicious app could read the data, and finally, we will explain how we could prevent against this from happening.

### Steps to build the sender app (app A): 
This app will send comment data to app B.

1.	Create a new project with name “Sender”. Again, remember to save the package name. We will need that later.


<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image1.png" alt="Image">

2.	Add some objects to the activity_main.xml, found under “app/res/layout/”. Add a TextView, EditText, and a Button.

Once you have the objects in the device layout, click on the TextView and change its properties from right side panel to the following: 
•	ID: tvHint

The EditText should have these properties:
•	ID: commentEditText
•	Hint: comment
•	Delete all text in the box next to the “Text” label

For the Button:
•	ID: sendButton
•	Text: Send to app 
o	You may need to play around with this to avoid Android Studio autocompleting the word “app” to “@string/app_name”

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image2.png" alt="Image">

3.	The code in MainActivity.java, found in “app/java/your_package_name_here/”, will look like this:
```java
package com.example.sender;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Define send button
        Button sendButton = (Button)findViewById(R.id.sendButton);

        // init commentEditText
        final EditText commentEditText = (EditText)findViewById(R.id.commentEditText);

        // button listen to click event
        sendButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // set the package that we want to run
                Intent intent = getPackageManager().getLaunchIntentForPackage("com.example.receiver");


                // put the data that we want to send over intent
                intent.putExtra("Comment", commentEditText.getText().toString());

                // start another app
                startActivity(intent);
            }
        });
    }
}
```
### Steps to build the Receiver app (app B): 

This app will receive the comment data and read it.

1.	Create a new project with name “Receiver”. Save the package name, as usual.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image3.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image4.png" alt="Image">
2.	Drag and drop a TextView from the “Palette” bar into the design view of activity_main.xml, found in “app/res/layout/”. Edit the properties of the TextView in the Properties panel that pops up when you click on it to be:
•	ID: txtDisplay


3.	Copy and paste the following code into MainActivity.java.

```java
package com.example.receiver;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Define the display Text view
        TextView txtview = (TextView)findViewById(R.id.txtDisplay);

        // get app the data sent on bundle
        Bundle b = getIntent().getExtras();

        // display the key that have the data
        txtview.setText(b.getString("Comment"));
    }
}


```
To run the apps:
1.	Build and run the Receiver app by clicking the button circled in red below:

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image5.png" alt="Image">
It will stop running and throw an error, but that is okay. We just need to run it that first time to load the app onto the device. 

The Sender app will call the Receiver app, and as such, the Receiver app needs to be loaded onto the device before we run Sender. Note that it is important to load the apps onto the same virtual or physical device. We need all three apps to be running on the same device.

2.	Build and run the Sender app. You can leave the emulator running in between these steps. 
If the button to compile, load, and run has changed to the one depicted below, that simply means that Android Studio will be pushing any updates to the app directly, without rebuilding it from scratch. It is fine to continue.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image6.png" alt="Image">
3.	Enter text into sender, click the Send to App button. When the Receiver app comes up, it will be displaying the comment you entered in Send to App.

See below for some images of what this could look like.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image7.png" alt="Image">

### Steps to build the Hacker app (app C): 
This app will try to read the data that should be read only by app B, or in our case, the Receiver app.

1.	Create a new project with name “HackerApp”. Save the package.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image8.png" alt="Image">

2.	Drag and drop a TextView object into the design view (found in “app/res/layout/activity_main.xml”), and access the properties panel by clicking on it in the Component Tree panel. Change the properties of this TextView to be:
•	ID: txtDisplay
If the app template is Empty, it usually already has a “Hello, World” TextView present. We can use that. 
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image9.png" alt="Image">
3.	Go to the Gradle build script for the specific module, found under “app/Gradle Scripts/”, in the build.gradle (Module: app) file. Change the applicationId to the applicationId the Receiver app has. Since they now have the same applicationId, it could receive the data that should be received by as the Receiver.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image10.png" alt="Image">
4.	MainActivity.java should have this code in it:
```java
package com.example.hackerapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // init the textView to display data
        TextView txtDisplay = (TextView)findViewById(R.id.txtDisplay);
        String dataBundle = "";

        // get the data sent in bundle from the app
        Bundle bundle = getIntent().getExtras();

        // loop through all keys in the bundle
        for (String key : bundle.keySet()) {
            // get object by key - we define it as object because we are not sure of type
            Object value = bundle.get(key);

            // get all keys
            dataBundle += String.format("%s %s (%s)", key, value.toString(), value.getClass().getName());
        }
        txtDisplay.setText(dataBundle);
    }
}

```
### To run the apps:
1.	Run and build the HackerApp as described above. Again, the app will crash. This is because it is reliant upon receiving a data bundle from the Intent. In this situation, however, we are running the app ourselves. The bundle ends up being empty (more correctly known as Null), and will crash when we try to iterate over it.
2.	After we’ve loaded HackerApp onto our device, we go back to the home screen and run Sender. Write any comment and click to send.
3.	The “Click to Send” button brings up HackerApp instead of Receiver. See that it has indeed intercepted the data meant for Receiver.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image11.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image12.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image13.png" alt="Image">
To fix this problem:

To fix this problem use encryption and decryption theory. That is mean that in sender app we encrypt the data before send it over bundle.  Then in receiver app we decrypt that bundle data so the hacker app even could access to the data, it could not understand it.

See the example below. We can see that the Receiver app is unable to understand.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image14.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image15.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Intents/image16.png" alt="Image">
