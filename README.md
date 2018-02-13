# buffer_zlib

This small extension wraps [zlib](http://zlib.net/) to add several functions for data compression/decompression to GameMaker: Studio (1, 2).

Since the extension is freeware and I'm not particularly familiar with zlib, this repository is intended as a "do it yourself" kind of thing for anyone desiring additional features/platforms. Feel free to send back a pull request if you do something nice.

## Setting up

* Clone/download the repository.
* Download [zlib](http://zlib.net/). I've been using v1.2.11 as of writing this.

## Windows

* Copy all `.h` / `.c` files (`zlib.h`, `inflate.c`, etc) from zlib directory into `buffer_zlib` directory of the repository.
* Open `buffer_zlib.sln` in Visual Studio. I've been using Community Edition 2015 as of writing this.
* If all was done correctly, the project should now produce a valid DLL when in x86 release mode.
* If you want the extension function list to be automatically updated post-compile, download [gmxgen](https://bitbucket.org/yal_cc/gmxgen) and tuck it's executable files at some `PATH` environment variable location.

## Android

* Copy all `.h` / `.c` files (`zlib.h`, `inflate.c`, etc) from zlib directory into `buffer_zlib.java\jni` directory of the repository.
* Run `_javaclass` BAT to compile java class from `BufferZlib.java`. `BufferZlib.class` shall appear in the `buffer_zlib.java\bin\com\gamemaker\bufferzlib` directory.
* Run `_jniheader` BAT. It should produce `com_gamemaker_bufferzlib_BufferZlib.h` header based on the java class. You need to place this file into `buffer_zlib.java\jni`.
* Header is the link between `.java` and `.cpp` sources. Methods in `buffer_zlib.cpp` should match the methods from `com_gamemaker_bufferzlib_BufferZlib.h` which are generated based on the methods from `BufferZlib.java`.
* Run `_libs.bat` to build NDK Shared Library. If all was done correctly, you will see two newly created directories, `obj` and `libs`. Copy `libs` folder and name it `lib`.
* Go to `lib` directory and delete all architectures not supported by GameMaker. Currently **supported** architecures are: `armeabi`, `armeabi-v7a`, `mips` and `x86`, which should stay. If you build your games without supporting some of architecures (see Android Settings of your project) you can delete it too.
* Add `lib` directory to a zip file. Path of directory should be saved, so it shall be `lib.zip\lib\*`.
* Rename `lib.zip` into `lib.jar` and copy it into `AndroidSource\libs` directory of GameMaker extension.
* Copy `BufferZlib.java` and `BufferZlibExt.java` into `AndroidSource\Java` directory of GameMaker extension. `BufferZlibExt.java` is the main file, so Class Name in Android extension settings should be `BufferZlibExt`.
* Tested SDKs: jdk/jre `1.8.0`, Target SDK `25`, Min SDK `9`, Compile SDK `25`, Build Tools `26`, Support Lib `25.3.1`, NDK `r14b`.


## License

See [zlib license](http://zlib.net/zlib_license.html).