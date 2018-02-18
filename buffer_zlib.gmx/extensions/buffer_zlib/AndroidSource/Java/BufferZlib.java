// @author KeeVee Games (MusNik)

package com.gamemaker.bufferzlib;

public class BufferZlib
{
    // Declare the native functions
    public static native double bufferDeflateRaw1_Native(long source, double offset, double length, double level);
    public static native double bufferDeflateRaw2_Native(long out, double start, double till);
    public static native double bufferInflateRaw1_Native(long source, double offset, double size);
    public static native double bufferInflateRaw2_Native(long out, double start, double till);
    public static native double bufferZlibInitRaw_Native();
    public static native double bufferZlibGetStatus_Native();

    // Load the shared library
    static {
        System.loadLibrary("BufferZlib");
    } 
}