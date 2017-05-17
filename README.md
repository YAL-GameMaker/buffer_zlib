# buffer_zlib

This small extension wraps [zlib](http://zlib.net/) to add several functions for data compression/decompression to GameMaker: Studio (1, 2).

Since the extension is freeware and I'm not particularly familiar with zlib, this repository is intended as a "do it yourself" kind of thing for anyone desiring additional features/platforms. Feel free to send back a pull request if you do something nice.

## Setting up

* Clone/download the repository.
* Download [zlib](http://zlib.net/). I've been using v1.2.11 as of writing this.
* Copy all `.h` / `.c` files (`zlib.h`, `inflate.c`) from main directory into `buffer_zlib` directory of the repository.
* Open `buffer_zlib.sln` in Visual Studio. I've been using Community Edition 2015 as of writing this.
* If all was done correctly, the project should now produce a valid DLL when in x86 release mode.
* If you want the extension function list to be automatically updated post-compile, download [gmxgen](https://bitbucket.org/yal_cc/gmxgen) and tuck it's executable files at some `PATH` environment variable location.

## License

See [zlib license](http://zlib.net/zlib_license.html).