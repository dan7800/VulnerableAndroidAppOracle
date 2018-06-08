The android app here demonstrates the need for awareness as to how your personal info is handled across the internet. Any details that you may save in an application may appear elsewhere if you have not read the terms of use or what the application may do with your data. In this particular example information that you enter in the application is submitted to the server that the app is set to send it to.

Instructions For use
1) Use Android Studio to run application with min API level 27

2) Set the correct IP address with port number for the server that will listen to POST connections.

3) Open Terminal on a Unix based system.
Make sure you have homebrew installed so that you can install npm.(Applicable to macOS only)
If not, install homebrew on macOS by following steps listed on https://brew.sh

4) Install npm by using the following homebrew command.
`brew install npm`

5) I used a NodeJS based local web server. Install the web server by running the following npm command on the terminal.
`npm install http-echo-server -g`

6) Run remaining commands to start the server.
`export PORT=8081`
`http-echo-server`

7) Hit play button in Android studio to start the application.

8) Enter details and press the save button. See the information leak in the terminal window.
