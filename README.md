# mruby-deb
Dirty simple compile and build solution for creating a .deb package for mruby suitable for use on Raspberry Pi.

## Requirements
A standard Ruby (>=1.9) install is required for building mruby. In addition, the following deb packages are used by the set of mruby gems:

```sh
sudo apt-get install libssl1.0.0 i2c-tools libi2c-dev \
     libopencv-core2.4 libopencv-core-dev libopencv-dev \
     automake libtool libgsl0-dev libgsl0ldbl libgsl0-dbg \
     libreadline6 libreadline6-dev libreadline6-dbg \
     libpcre3 libpcre3-dev libpcre3-dbg \
     libyaml-0-2 libyaml-0-2-dbg
```

Furthermore, the [wiringpi library v2](http://wiringpi.com) needs to be installed before using this mruby-gem. See the website for building instructions.

## Build instructions
- **Step 0:** [OPTIONAL] configure the list of mruby gems in `build_mruby.rb`.

- **Step 1:** build latest mruby
```sh
$ ./build_mruby.rb
```

- **Step 2:** build the debian package:
```sh
$ ./build.sh
```
Note that the build products get into the `products` subdir, and are marked with creation date and mruby git hash.

- **Step 3:** install the package:
```sh
$ sudo dpkg -i products/mruby-unitn-YY.MM.DD-PATCHLEVEL.deb
```

## List of functionalities

* Raspberry Camera module
* I2C master
* GPIO pins on the Raspberry
* Serial communication, including a simple command protocol for communicating with Arduino sketches (we call it RNCP, reverse notation command protocol)
* Finite State Machine for clean design of application logic
* Soft-realtime (0.1 ms time accuracy)
* HTTP server for exposing APIs and web pages
* Daemonizing facility


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
* iij/mruby-process: UNIX process management
* ksss/mruby-signal: UNIX signals
* mattn/mruby-thread: pthread support (experimental)
* UniTN-mechatronics/mruby-ftp: FTP client
* UniTN-mechatronics/mruby-raspberry: Interface to WiringPI library for IO
* UniTN-Mechatronics/mruby-raspicam: OpenCV interface (*preliminary*)
* UniTN-Mechatronics/mruby-kalman: Kalman filtering (*preliminary*)
* UniTN-Mechatronics/mruby-mrubot: Utilities for robotics: NewtonRaphson solver, Ballistics class, Process and memory info (*preliminary*)
* UniTN-Mechatronics/mruby-fsm: Finite state machine
* pbosetti/mruby-emb-require: require script or compiled gems
