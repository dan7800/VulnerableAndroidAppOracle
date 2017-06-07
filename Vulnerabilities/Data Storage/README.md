# Data Storage

Android provides several options for developers to store data locally using different formats such as files, SharedPreferences and SQLite. Data stored using any of these formats will be stored in the same path where the application is stored on the phone which is:  
“data/data/package_name”  
If we explore this path we can see that there are three folders which are used to store local data in Android, these folders are:

* Files
* Databases
* SharedPreferences

The important thing to know is that Android does not encrypt this data, therefore anyone or any app can go to that path and read the stored data.  
Therefore, we advise developers to not use these types of data storage when storing secure information such as username and password since this information can be readable by anyone.
In this tutorial, we will build a simple Android app that allows users to store their usernames and passwords using SharedPreferences data storage, after that we will demonstrate how this data can be accessed and read.

### Steps to Build the App

1. Open Android Studio and create new Android project and name it “SharedPreferencesExample”. Make sure to save the package name somewhere on your computer since you will need it in a later stage of this tutorial. Click next.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image1.png" alt="Image">

2. Set the minimum SDK to 14, or whatever your default is, and then click on next.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image2.png" alt="Image">

3. Select Empty Activity, click on next and then finish to start the project  

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image3.png" alt="Image">

4. Open the activity_main.xml file, which can be found under app/res/layout/. You may need to wait for few seconds for the build and file indexing to complete.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image4.png" alt="Image">

5. Delete the “Hello World” TextView by selecting the TextView and then press the delete button on your keyboard.
6. Copy and paste the following code into acitivity_main.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:tools="http://schemas.android.com/tools"
android:id="@+id/activity_main"
android:layout_width="match_parent"
android:layout_height="match_parent"
tools:context=".MainActivity">

<EditText
android:layout_width="wrap_content"
android:layout_height="wrap_content"
android:inputType="textPersonName"
android:ems="10"
android:layout_alignParentTop="true"
android:layout_centerHorizontal="true"
android:layout_marginTop="23dp"
android:id="@+id/usernameEditText"
android:hint="Username" />

<EditText
android:layout_width="wrap_content"
android:layout_height="wrap_content"
android:inputType="textPassword"
android:ems="10"
android:layout_below="@+id/usernameEditText"
android:layout_alignStart="@+id/usernameEditText"
android:layout_marginTop="21dp"
android:id="@+id/passwordEditText"
android:hint="Password" />

<Button
android:text="Store"
android:layout_width="wrap_content"
android:layout_height="wrap_content"
android:layout_below="@+id/passwordEditText"
android:layout_centerHorizontal="true"
android:layout_marginTop="23dp"
android:id="@+id/storeButton" />

</RelativeLayout>

```

Once you have completed step 6, your app layout should look like the following image.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image5.png" alt="Image">

7. Copy and paste the code below to the MainActivity.java file which can be found under “app/java/your_package_name /”. Make sure that your package name is written correctly at the top of the file.

```java

package com.example.sharedpreferencesexample;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

public static final String MY_PREFERENCES = "MyPrefLogin" ;
public static final String USERNAME = "UsernameKey" ;
public static final String USER_PASSWORD = "PasswordKey" ;
SharedPreferences mSharedPreferences;
EditText mUsernameEditText, mPasswordEditText;
Button mStoreButton;

@Override
protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);

// initialize  the username EditText  instance
mUsernameEditText = (EditText)findViewById(R.id.usernameEditText);

// initialize  the password  EditText instance
mPasswordEditText = (EditText)findViewById(R.id.passwordEditText);

// initialize  the Button instance
mStoreButton = (Button) findViewById(R.id.storeButton);

// initialize SharedPreferences
mSharedPreferences = getSharedPreferences(MY_PREFERENCES, Context.MODE_PRIVATE);

// setting  on click listener for the button
mStoreButton.setOnClickListener(new View.OnClickListener() {
@Override
public void onClick(View view) {
// Store data
// enable start editing file
SharedPreferences.Editor editor = mSharedPreferences.edit();
// add user name
editor.putString(USERNAME, mUsernameEditText.getText().toString());
// add password
editor.putString(USER_PASSWORD, mPasswordEditText.getText().toString());
// store the update data
editor.commit();
//display message to inform the user that the stored
Toast.makeText(MainActivity.this,
"Your data has stored successfully!",
Toast.LENGTH_LONG).show();
}
});
}
}

```

8. Run the app by clicking on the run button at the top and then select your virtual device and click on OK to run the app. It will take a little while for the virtual device to start and for the app to run.  The following image shows how you can start the virtual device and run the app.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image6.png" alt="Image">


9. Once the app has run, enter a username and a password and then click on the store button as shown in the following image.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image7.png" alt="Image">


### Steps to Read the App Data

To read the data which you just stored into the app, you first need to make sure that you still have the virtual device running. After that, open Terminal or Command Prompt and then execute the following commands:

get the android sdk directory which can be found under Gradle Scripts -> local.properties as shown below

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image10.png" alt="Image">

1. cd android-sdk-directory  (might also need to switch to platform-tools)
2. ./adb shell
[Note: On a Windows operating system the command is: adb shell]
3. run-as your_package_name
[Note: If you used the package name specified in the above code block, the command is: run-as com.example.sharedpreferencesexample]
4. cd shared_prefs
5. cat MyPrefLogin.xml

Once you have executed the commends above you will be able to read the data which you stored using the app as shown the following image.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image8.png" alt="Image">


### Conclusion

As shown in the image above, the data which you entered and stored in the app can be easily accessed and read. Therefore, using such a data storage type to store sensitive users’ information such as passwords or bank information can threaten the users.

### Fixing the Problem

There are two solutions which can help in encrypting the stored data and fixing the problem:

1. Encrypting the sensitive data in the phone using encryption and decryption technique.
2. Store the sensitive data on a cloud server and retrieve it when its needed.


### Steps to Fix the Problem

We are going to use the same app which we just built and then add an encryption and decryption technique to it known as Cipher which will help in encrypting the date before we store using SharedPreferences.

To start encrypting the data using Cipher you first need to add the cipher method to your source code and then you can call the Cipher method to encrypt the entered data before store it using SharedPreferences.

Your final source code (MainActivity.Java) should look like the following (remove the code highlighted in red and add the code highlighted in green):

Make sure the package name, in the first line, is the same as what you provided in the earlier steps

```java

package com.example.sharedpreferencesexample;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

public static final String MY_PREFERENCES = "MyPrefLogin" ;
public static final String USERNAME = "UsernameKey" ;
public static final String USER_PASSWORD = "PasswordKey" ;
SharedPreferences mSharedPreferences;
EditText mUsernameEditText, mPasswordEditText;
Button mStoreButton;

@Override
protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);

// initialize  the username EditText  instance
mUsernameEditText = (EditText)findViewById(R.id.usernameEditText);

// initialize  the password  EditText instance
mPasswordEditText = (EditText)findViewById(R.id.passwordEditText);

// initialize  the Button instance
mStoreButton = (Button) findViewById(R.id.storeButton);

// initialize SharedPreferences
mSharedPreferences = getSharedPreferences(MY_PREFERENCES, Context.MODE_PRIVATE);

// setting  on click listener for the button
mStoreButton.setOnClickListener(new View.OnClickListener() {
@Override
public void onClick(View view) {
// Store data
// enable start editing file
SharedPreferences.Editor editor = mSharedPreferences.edit();
```
```diff
// add user name
-                 editor.putString(USERNAME, mUsernameEditText.getText().toString());
+                 editor.putString(USERNAME, cipher(mUsernameEditText.getText().toString(),10));
// add password
-                 editor.putString(USER_PASSWORD, mPasswordEditText.getText().toString());
+                 editor.putString(USER_PASSWORD, cipher( mPasswordEditText.getText().toString(),10));
// store the update data
```
```java
editor.commit();
//display message to inform the user that the stored
Toast.makeText(MainActivity.this,
"Your data has stored successfully!",
Toast.LENGTH_LONG).show();
}
});
}
```
```diff
// Cipher Method. Cipher encryption add shift for key
+      String cipher(String msg, int shift){
+          String s = "";
+          int len = msg.length(); // get string length
+          for(int x = 0; x < len; x++){
+              char c = (char)(msg.charAt(x) + shift);  // shift every character
+              s += c; // append the characters
+          }
+          return s;
+      }
}

```

Once you have updated the code run the application again by click on the run button.
Basically, this encryption technique considered to be one of the basic encryption techniques, it works by adding shift for every character when we want to encrypt the data, and when we want to decrypt the data we subtract that shift to the origin character.

###Steps to Read the App Data after the encryption

To read the app data again and make sure that they encrypt it, we first need to open Terminal or Command Prompt and execute the following commands:

get the android sdk directory which can be found under Gradle Scripts -> local.properties as shown below

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image10.png" alt="Image">

1. cd android-sdk-directory (might need to switch to platform-tools)
2. ./adb shell
[Note: On a Windows operating system the command is: adb shell]
3. run-as your_package_name
[Note: If you used the package name specified in the above code block, the command is: run-as com.example.sharedpreferencesexample]
4. cd shared_prefs
5. cat MyPrefLogin.xml

This time you will notice that the data has encrypted and it’s no longer readable as shown in the image below.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/DataStorage/image9.png" alt="Image">
