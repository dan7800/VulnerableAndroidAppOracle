# XML

Android uses XML files to store static data (data that does not change through execution of the app). For example, translated strings (in languages such as English, Spanish, or Arabic) are stored in XML files for multi-language support. Like a tradional Windows application using a .exe file to install the software, an Android app is packaged into an APK file. The APK files are compressed files that contain many XML and Java files, that make up the application.  Anyone could unzip the APK and read the data that was saved in XML. 

Many developers store important information in XML, such as an Ads number or a Google Maps API key. This approach is precarious, because someone who reverse engineers the app could read all the sensitive data. The attacker could then use the stolen API key to obtain access to paid services, possibly running up charges on the developer’s account. 

We will demonstrate how to build an Android app that displays Google Maps with the API key saved in the XML. After that, we will extract the key from the APK, and learn the best place to store the key.

### Part 1 - Building the app

1.	Create a new project named “AndroidGoogleMAP”. Make sure to remember package name, outlined in red below.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image1.png" alt="Image">

2.	Select project of type Google Maps Activity. You can keep the default activity name. 

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image2.png" alt="Image">

3.	A file called “google_maps_api.xml” is automatically created in the location: “app/res/values/”.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image10.png" alt="Image">

This file has a key named “google_maps_key”. We must create the Google Maps key for this app from the Google developer console by following the instructions in this [file] (GenerateKey.md). 
After obtaining the key, replace the placeholder text “YOUR_KEY_HERE” with the generated key.  

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image3.png" alt="Image">

4. After replacing the placeholder text with the generated key, you should see something like this:

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image4.png" alt="Image">

5.	Build and run the app.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image5.png" alt="Image">


### Part 2 - Reverse engineering the app:

Perform the following steps to locate and copy the generated APK file from the device emulator to your development machine.

1. Open Terminal or Command Prompt

2. CD to the location of the Android SDK installed on your development machine.

	The default location on Mac OS is: cd ~/Library/Android/sdk/platform-tools
	
	The default location on Windows is: C:\Users\YOUR_USERNAME_HERE\AppData\Local\Android\sdk\platform-tools

3. Run the following command to retrieve the location of the APK file on the emulator:

	./adb shell pm path YOUR_PACKAGE_NAME_GOES_HERE
	
	Note: Replace the text "YOUR_PACKAGE_NAME_GOES_HERE" with the actual package name you specified when creating the project. If you cannot rember the package name, refer to the AndroidManifest.xml OR run the following command:./adb shell pm list packages
	
	The output will look like: package:/data/app/com.example.someapp.apk 
	We want the part that comes after “package:”
	
4.	Run the following command to copy the APK file to your development machine:
	
	./adb pull /data/app/com.example.someapp.apk /PATH/TO/DESTINATION/GOES/HERE
	
	Note: Replace the text "/PATH/TO/DESTINATION/GOES/HERE" with the path to where the APK should be copied to

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image6.png" alt="Image">

5.	Reverse engineer the APK file by either:

	a)	Rename the “base.apk” file to “base.zip”, and extract the file
	
	b)	Use a tool like: http://ibotpeaches.github.io/Apktool/ follow the instructions to install and run it
	
6. After reverse engineering the APK file, open the "strings.xml" file located at: \base\res\values in the extracted location. (Note: depending on your settings, the file "google_maps_api.xml" will be copied into the APK and you would not need to open the "strings.xml" file)

7. Scroll through this file and you will see google maps API key 


This is an issue because your API key could be misused.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image11.png" alt="Image">

### Fixing the Problem

There are multiple ways to attack the problem. One solution is to only keep client keys on the device, retrieving API keys from a server you control via web requests. Essentially, we never store API keys in the APK because we assume that it can and will be decompiled.

Another is to use a tool to obfuscate your code, like ProGuard. In this approach, we would be trying to make it harder for people to reverse engineer the APK.
