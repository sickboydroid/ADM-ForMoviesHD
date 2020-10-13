package com.dv.adm.utils;

import android.os.Environment;
import java.io.File;

public abstract class AppConstants {
    /////////////////////////
    // Package name of app //
    /////////////////////////
    public static final String PACKAGE_NAME = "com.dv.adm";

    ///////////////////////////////////////
    // Constants for controlling logging //
    ///////////////////////////////////////
    public static final boolean DEBUG = true;
    public static final boolean EXTREME_LOGGING = false;

    //////////////////////////
    // File names and paths //
    //////////////////////////
    public static final File EXTERNAL_STORAGE_DIR = Environment.getExternalStorageDirectory();
    
    /////////////////////
    // Preference keys //
    /////////////////////
    public static final class preference {
	private preference() {}
    }
}
