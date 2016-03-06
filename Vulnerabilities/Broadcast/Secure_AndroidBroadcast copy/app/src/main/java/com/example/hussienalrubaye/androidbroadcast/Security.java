package com.example.hussienalrubaye.androidbroadcast;

/**
 * Created by hussienalrubaye on 3/6/16.
 */
public class Security {

    // cipher encryption add shift for key
   public static String cipher(String msg, int shift){
        String s = "";
        int len = msg.length(); // get string length
        for(int x = 0; x < len; x++){
            char c = (char)(msg.charAt(x) + shift);  // shift every character
            s += c; // append the characters
        }
        return s;
    }
}
