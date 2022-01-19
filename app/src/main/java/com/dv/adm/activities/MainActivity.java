package com.dv.adm.activities;

import android.widget.TextView;
import android.app.Activity;
import android.os.Bundle;

import com.dv.adm.R;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        TextView tv = findViewById(R.id.tv);
        tv.setText("WELCOME TO ADM: Patched");
        tv.setText(tv.getText().toString() + "\n" + "You are ready to use this app.");
        tv.setText(tv.getText().toString() + "\n\n" + "Step 1: Open Movies HD and search your favorite movie or tv show");
        tv.setText(tv.getText().toString() + "\n" + "Step 2: Click on the movie and go to videos section");
        tv.setText(tv.getText().toString() + "\n" + "Step 3: Choose your desired option");
        tv.setText(tv.getText().toString() + "\n" + "Step 4: You will be redirected to AMPlayer");

        tv.setText(tv.getText().toString() + "\n" + "Step 4: In AMPlayer click on download button and choose ADM downloader");
        tv.setText(tv.getText().toString() + "\n" + "Step 5: This app will copy link to your clipboarrd which you can paste in terminal to download movie using 'wget'");
    }
}
