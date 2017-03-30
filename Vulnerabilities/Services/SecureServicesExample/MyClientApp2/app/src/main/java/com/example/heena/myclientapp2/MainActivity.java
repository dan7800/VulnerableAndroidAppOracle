package com.example.heena.myclientapp2;

import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private boolean isBound;
    private int randomVal;
    // This application will only invoke the math services getRandomNumber function
    private static final int GET_RANDOMNUM_FLAG = 0 ;
    private static final String RUN_SERVICE = "RUNSERVICE";

    private Button bindToServiceBtn, invokeServiceBtn;
    private TextView viewResult;

    Messenger requestMessenger, responseMessenger;
    private Intent intent;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        viewResult = (TextView)findViewById(R.id.ResultView);
        bindToServiceBtn = (Button)findViewById(R.id.BindToServiceBtn);
        bindToServiceBtn.setOnClickListener(this);
        invokeServiceBtn = (Button)findViewById(R.id.InvokeServiceBtn);
        invokeServiceBtn.setOnClickListener(this);

        intent = new Intent();
        intent.setComponent(new ComponentName("com.example.heena.myserviceapp","com.example.heena.myserviceapp.MyService"));

    }

    ServiceConnection serviceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName arg0, IBinder binder) {
            //wrap the binder returned from the onBind method in the Service
            requestMessenger=new Messenger(binder);
            /*wrap the Handler that will handle the response being sent from the service*/
            responseMessenger=new Messenger(new ResponseHandler());
            isBound=true;
        }
        @Override
        public void onServiceDisconnected(ComponentName arg0) {
            requestMessenger=null;
            responseMessenger=null;
            isBound = false;
        }
    };

    private class ResponseHandler extends Handler {

        @Override
        public void handleMessage(Message message) {
            randomVal = 0;
            /*message sent from the messenger
            that holds an instance of the Binder
             returned from the onBind Method of the service*/

            switch (message.what){
                case GET_RANDOMNUM_FLAG:
                    randomVal = message.arg1;
                    viewResult.setText("Math Service - Random number is " + randomVal);
                    break;
                default:
                    break;

            }
            super.handleMessage(message);
        }
    }


    private void bindToService(){
        bindService(intent,serviceConnection,BIND_AUTO_CREATE);
        Toast.makeText(getApplicationContext(),"Bound to Math Service",Toast.LENGTH_SHORT).show();
    }


    private void fetchNewRandomNum(){
        if(isBound){
            Message request = Message.obtain(null,GET_RANDOMNUM_FLAG);
            /*Message's replyTo attribute takes a messenger indicating
            which messenger the reply should be sent to
             once we have received something from the service*/
            try{
                //set receiving messenger
                request.replyTo = responseMessenger;
                //send request to service
                requestMessenger.send(request);
            }catch (RemoteException e){
                Log.i("My Client App",e.getMessage());
            }

        }
    }

    @Override
    public void onClick(View view){
        switch (view.getId()){
            case R.id.BindToServiceBtn: bindToService();
                break;
            case R.id.InvokeServiceBtn: fetchNewRandomNum();
                break;
            default:break;
        }
    }
}
