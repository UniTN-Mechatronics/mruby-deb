# mruby-deb
Dirty simple compile and build solution for creating a .deb package for mruby suitable for use on Raspberry Pi.

## Requirements
A standard Ruby (>=1.9) install is required for building mruby. In addition, the following library are used by the mruby gems:

* libreadline6
* libssl1.0.0
* libpcre3
* libyaml-0-2

## Usage
Step 0: configure the list of mruby gems in `build_mruby.rb`.

Step 1: build latest mruby
```sh
$ ./build_mruby.rb
```

Step 2: build the debian package:
```sh
$ ./build.sh
```
Note that the build products get into the `products` subdir, and are marked with creation date and mruby git hash.

Step 3: install the package:
```sh
$ sudo dpkg -i products/mruby-unitn-YY.MM.DD-PATCHLEVEL.deb
```

## List of gems
The following gems are included. 
It is a rather complete selection allowing to use mruby on a Raspberry Pi for basic mechatronics tasks, especially when 
using the `Raspberry` module or the `SerialPort` class for talking to an Arduino connected via USB serial cable.

* pbosetti/mruby-io: IO class
* pbosetti/mruby-dir: Dir class
* pbosetti/mruby-tempfile: temporary files
* pbosetti/mruby-pcre-regexp: Perl-compatible Regular expressions
* pbosetti/mruby-yaml: YAML emitter/parser
* pbosetti/mruby-merb: ERB clone
* pbosetti/mruby-complex: complex numbers
* pbosetti/mruby-serialport: Serial port interface
* pbosetti/mruby-shell: run shell commands and get the result
* pbosetti/mruby-sleep: sleep (fractional seconds)
* iij/mruby-pack: pack/unpack bytestreams
* iij/mruby-socket: TCP/UDP sockets
* iij/mruby-errno: C errno interface
* UniTN-mechatronics/mruby-ftp: FTP client
* UniTN-mechatronics/mruby-raspberry: Interface to WiringPI library for IO
* UniTN-Mechatronics/mruby-fsm: Finite state machine
* pbosetti/mruby-emb-require: require script or compiled gems