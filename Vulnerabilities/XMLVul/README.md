# XML Vulnerability

Android uses XML files to store static data, meaning that the data does not change through execution of the app. For example, translated strings (in languages such as English, Spanish, or Arabic) are stored in XML files for multi-language support. APK files are compressed files that contain many XML and Java files, making up the application.  Note that anyone could unzip the APK and read the data that was saved in XML. 

Many developers store important information in XML, such as an Ads number or a Google Maps API key. That is precarious, because someone who reverse engineers the app could read all the keys. The attacker could then use the stolen API key to obtain access to paid services, possibly running up charges on the developer’s account. 

We will demonstrate how to build an Android app that displays Google Maps with the API key saved in the XML. After that, we will extract the key from the APK, and learn the best place to store the key.

### Steps to Build the App

1.	Create a new project named “XMLVul”. Make sure to remember package name, outlined in red below.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image1.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image2.png" alt="Image">
2.	Select project of type Empty Activity.
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image3.png" alt="Image">
<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image4.png" alt="Image">


3.	See the app files under “app/res/values/”. One of them is strings.xml file. Add a new string element named "key" and give it a value.   

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image5.png" alt="Image">

4.	Build and run the app.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image8.png" alt="Image">


### Part 2 - Reverse engineering the app:

Perform the following steps to locate and copy the generated APK file from the device emulator to your development machine.

Open Terminal or Command Prompt

CD to the location of the Android SDK installed on your development machine.

The default location on Mac OS is: cd ~/Library/Android/sdk/platform-tools

The default location on Windows is: C:\Users\YOUR_USERNAME_HERE\AppData\Local\Android\sdk\platform-tools

Run the following command to retrieve the location of the APK file on the emulator:

./adb shell pm path YOUR_PACKAGE_NAME_GOES_HERE

Note: Replace the text "YOUR_PACKAGE_NAME_GOES_HERE" with the actual package name you specified when creating the project. If you cannot rember the package name, refer to the AndroidManifest.xml OR run the following command:./adb shell pm list packages

The output will look like: package:/data/app/com.example.someapp.apk We want the part that comes after “package:”

Run the following command to copy the APK file to your development machine:

./adb pull /data/app/com.example.someapp.apk /PATH/TO/DESTINATION/GOES/HERE

Note: Replace the text "/PATH/TO/DESTINATION/GOES/HERE" with the path to where the APK should be copied to

We have the app package, called “base.apk” here.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XML/image6.png" alt="Image">


### Reverse Engineering APK file using apktool

1. Download apktool from http://ibotpeaches.github.io/Apktool/

2. Follow these installation instructions https://ibotpeaches.github.io/Apktool/install/ 

3. Then run apktool command from command line intereface(cmd/powershell/cli) as
    apktool d base.apk 
    
4. Files will be extracted in the same directory. Look for newly created directory(named after apk file) and go to 
res->values->strings.xml

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image6.png" alt="Image">

Scroll through this file and you will find the key and value.

<img style="margin:10px;" src="https://github.com/dan7800/VulnerableAndroidAppOracle/blob/master/Pictures/XMLVul/image7.png" alt="Image">



This is an issue because your API key could be misused.

### Fixing the Problem

There are multiple ways to attack the problem. One solution is to only keep client keys on the device, retrieving API keys from a server you control via web requests. Essentially, we never store API keys in the APK because we assume that it can and will be decompiled.

Another is to use a tool to obfuscate your code, like ProGuard. In this approach, we would be trying to make it harder for people to reverse engineer the APK.
