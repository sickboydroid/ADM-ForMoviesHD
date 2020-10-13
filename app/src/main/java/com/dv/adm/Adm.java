package com.dv.adm;

import android.app.Activity;
import android.os.*;
import android.widget.*;
import android.content.*;
import com.dv.adm.utils.*;

public class Adm extends Activity {
    TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);
        //tv = findViewById(R.id.tv);
        //tv.setText("__________________");
        main();
    }

    public void main() {
        Bundle extras = getIntent().getExtras();
        String title = extras.getString("title");
        String url = extras.getString("url");
        String cookie = extras.getString("cookie");
        String userAgent = extras.getString("user-agent");
        String data = getIntent().getData().toString();
        title = title.replaceAll("\\[.*\\]", "").trim();
        title += ".mp4";
        String commandDownload = String.format("wget -c --header='Cookie: %s' %s -O '%s'", cookie, data, title);
        /*
           log("Title: " + extras.getString("title"));
           log("Url: " + extras.getString("url"));
           log("Cookie: " + extras.getString("cookie"));
           log("User-agent: " + extras.getString("User-agent"));
           log("Data: " + getIntent().getData());
           */
        copyToClipboard(commandDownload);
        finish();
    }

    private void copyToClipboard(String data) {
        ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = ClipData.newPlainText("ADM", data);
        clipboard.setPrimaryClip(clip);
        Utils.showToast(this, "Copied to clipboard!");
    }

    public void log(Object msg) {
        tv.setText(tv.getText().toString() + "\n" + msg);
    }
}
