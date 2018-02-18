// @author KeeVee Games (MusNik)

package ${YYAndroidPackageName};

import java.lang.String;
import java.lang.Long;

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import static com.gamemaker.bufferzlib.BufferZlib.*;

public class BufferZlibExt {
    public double bufferDeflateRaw1(String source, double offset, double length, double level) {
        long address = stringAddressToLongPointer(source);
        return bufferDeflateRaw1_Native(address, offset, length, level);
    }

    public double bufferDeflateRaw2(String out, double start, double till) {
        long address = stringAddressToLongPointer(out);
        return bufferDeflateRaw2_Native(address, start, till);
    }

    public double bufferInflateRaw1(String source, double offset, double size) {
        long address = stringAddressToLongPointer(source);
        return bufferInflateRaw1_Native(address, offset, size);
    }

    public double bufferInflateRaw2(String out, double start, double till) {
        long address = stringAddressToLongPointer(out);
        return bufferInflateRaw2_Native(address, start, till);
    }

    public double bufferZlibInitRaw() {
        return bufferZlibInitRaw_Native();
    }

    public double bufferZlibGetStatus() {
        return bufferZlibGetStatus_Native();
    }

    private long stringAddressToLongPointer(String address) {
        return Long.parseLong(address.substring(2), 16);
    }
}