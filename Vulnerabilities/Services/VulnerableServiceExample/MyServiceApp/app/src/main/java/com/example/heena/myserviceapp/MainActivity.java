package com.example.heena.myserviceapp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button serviceStartBtn, serviceStopBtn;
    private Context context;
    private Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        serviceStartBtn = (Button) findViewById(R.id.StartServiceBtn);
        serviceStartBtn.setOnClickListener(this);

        serviceStopBtn = (Button) findViewById(R.id.StopServiceBtn);
        serviceStopBtn.setOnClickListener(this);

        context = getApplicationContext();

        intent = new Intent(getApplicationContext(),MyService.class);

    }

    @Override
    public void onClick(View view){
        switch (view.getId()){
            case R.id.StartServiceBtn:startService(intent);
                Toast.makeText(context,"Math Service Started",Toast.LENGTH_SHORT).show();
                break;
            case R.id.StopServiceBtn: stopService(intent);
                break;
            default:
                break;
        }
    }


}
