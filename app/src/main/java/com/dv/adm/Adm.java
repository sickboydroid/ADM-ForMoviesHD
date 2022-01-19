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
        copyCommand();
    }

    public void copyCommand() {
        Utils.showToast(this, "DONE: UPDATED");
        Bundle extras = getIntent().getExtras();
        String title = extras.getString("title");
        //String url = extras.getString("url");
        //String userAgent = extras.getString("user-agent");
        String cookie = extras.getString("cookie");
        String data = getIntent().getData().toString();
        title = title.replaceAll("\\[.*\\]", "").trim();
        String commandDownload = String.format("wget -c --header='Cookie: %s' '%s' -O '%s'", cookie, data, title);
        copyToClipboard(commandDownload);
        finish();
    }

    private void copyToClipboard(String data) {
        ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = ClipData.newPlainText("ADM", data);
        clipboard.setPrimaryClip(clip);
        Utils.showToast(this, "Copied to clipboard!");
    }
}
