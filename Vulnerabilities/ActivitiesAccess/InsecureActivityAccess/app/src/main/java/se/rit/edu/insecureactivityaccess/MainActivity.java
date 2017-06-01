package se.rit.edu.insecureactivityaccess;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // username and password hard  coded for testing purpose
        final String USERNAME = "admin";
        final String PASSWORD = "admin";


        // initialize  user name  instance with the real input in xml
        final EditText etUsername = (EditText)findViewById(R.id.etUsername);

        // initialize  password  instance with the real input in xml
        final EditText etPassword = (EditText)findViewById(R.id.etPassword);

        // initialize login button instance
        final Button btnLogin = (Button)findViewById(R.id.btnLogin);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {

                // collect user's username input
                String username = etUsername.getText().toString();

                // collect user's password input
                String password = etPassword.getText().toString();

                // compare values
                if(USERNAME.equals(username) && PASSWORD.equals(password))
                {
                    Toast.makeText( MainActivity.this,
                            "You are logged in successfully",
                            Toast.LENGTH_LONG).show();

                    Intent intent = new Intent(getApplicationContext(), Main2Activity.class);
                    intent.putExtra("key", 3433);
                    startActivity(intent);
                }

                else {
                    Toast.makeText( MainActivity.this,
                            "Invalid credentials",
                            Toast.LENGTH_LONG).show();
                }
            }
        });


    }
}
