package com.example.heena.myserviceapp2;

/**
 * Created by Heena on 3/29/2017.
 */

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;

import android.support.annotation.Nullable;
import android.util.Log;
import android.widget.Toast;


public class MySecureService extends Service {
    private Messenger messenger=new Messenger(new RequestHandler());
    public static final int REQUEST_COUNT = 0;
    public boolean isServiceRunning=false;
    private int random = 0 ;


    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        isServiceRunning = true;
        Thread service_thread = new Thread(new Runnable() {
            @Override
            public void run() {
                startRandomNumGenerationService();
            }
        });
        service_thread.start();
        return START_STICKY;
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return messenger.getBinder();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        stopRandomNumGenerationService();
    }

    private static class RequestHandler extends Handler {
        @Override
        public void handleMessage(Message message){
            switch (message.what){
                case REQUEST_COUNT:
                    Message message_to_send = Message.obtain(null,REQUEST_COUNT);
                    message_to_send.arg1 = getRandomNumber();
                    try{
                        message.replyTo.send(message_to_send);
                    }catch (RemoteException e){
                        Log.i("My Service",e.getMessage());
                    }
            }

            super.handleMessage(message);
        }
    }

    private void startRandomNumGenerationService(){
        while(isServiceRunning){
            try{
                Thread.sleep(1000);
                if(isServiceRunning){
                    random = getRandomNumber();
                    Log.i("My Math Service","New Random Number is :"+ random);
                }
            }catch (InterruptedException e){
                Log.i("My Math Service","Service Thread Interrupted");
            }
        }
    }

    private void stopRandomNumGenerationService(){
        isServiceRunning = false;
        Toast.makeText(getApplicationContext(),"Math Service Stopped", Toast.LENGTH_SHORT).show();
    }

    public static int getRandomNumber() {
        return (int)(Math.random()*100+1);
    }
}
