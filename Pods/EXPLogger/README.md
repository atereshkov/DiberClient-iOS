# EXPLogger 
![](https://img.shields.io/cocoapods/v/EXPLogger.svg) ![](https://img.shields.io/cocoapods/p/EXPLogger.svg) ![](https://img.shields.io/cocoapods/l/EXPLogger.svg) ![](https://img.shields.io/cocoapods/dt/EXPLogger.svg) ![](https://img.shields.io/cocoapods/dw/EXPLogger.svg)
### A lightweight and simple logger for Swift projects

Colorful, flexible, lightweight logging for Swift 3 & Swift 4 (working on it :D).

---

## Navigation

* [Example](#example)
* [Installation](#installation)
* [Advanced Usage](#advanced-usage)
* [Documentation](#documentation)
* [Communication and help](#communication-and-help)
* [Changelog](#changelog)
* [License](#license)

---

## Example

Example of output in Xcode Console:

![Example of output](http://image.ibb.co/dXyJWk/image.png)

* Now there are some problems with displaying colors from the Xcode 8, so they are temporarily replaced by Emoji.

---

## Installation

### Cocoapods

To use EXPLogger with CocoaPods add this to your Podfile (Swift 3):

```
pod 'EXPLogger', '~> 1.0.1'
```

Then run pod install.
For details of the installation and usage of CocoaPods, [visit it's official web site](https://cocoapods.org/).

### Swift Package Manager

Will be available soon.

### Carthage

Will be available soon.

---

## Usage

_This quick start method is intended just to get you up and running with the EXPLogger. You should however use the [advanced usage](#advanced-usage) below to get the most out of this library._

Add this code at the top of your AppDelegate.swift to be able to use EXPLogger in your whole project. 
Or just use it in your individual classes. It's up to you.


1. Import

```swift
import EXPLogger
```

2. Declare an instance of the logger

```swift
let log = EXPLogger.self
```

In the AppDelegate method didFinishLaunchingWithOptions() add the EXPLogger log targets (console, file, etc.). And it's ready to use.

3. Set up logger

```swift
// add log targets (important! at least one is needed)
let console = ConsoleTarget() // xcode console

// add the targets to log
log.addDestination(console)

// log anything you want in your whole project!
log.verbose("Some non important information that can be easily skipped")
log.debug("Some useful information just to debugging")
log.info("Useful information, etc")
log.warning("Not a good information")
log.error("Some error")
log.critical("Something went so wrong with critical prior")
```

The different methods set the log level of the message. EXPLogger will only print messages with a log level that is greater to or equal to it's current log level setting. So a logger with a level of .error will only output log messages with a level of .error, or .critical.

---

## Advanced Usage

Will be filled soon.

---

## Documentation

Will be filled soon.

---

## Communcation and Help

* If you need help, use [Stack Overflow](http://stackoverflow.com/questions/tagged/explogger) (Tag 'explogger') or [open an issue](https://github.com/atereshkov/EXPLogger/issues/new).
* If you'd like to ask a general question, use [Stack Overflow](http://stackoverflow.com/questions/tagged/explogger) or [open an issue](https://github.com/atereshkov/EXPLogger/issues/new).
* If you've found a bug, [open an issue](https://github.com/atereshkov/EXPLogger/issues/new).
* If you have a feature request, [open an issue](https://github.com/atereshkov/EXPLogger/issues/new).
* If you want to contribute, submit a [pull request](https://github.com/atereshkov/EXPLogger/pulls).
* If you use and enjoy EXPlogger, please star the [project on GitHub](https://github.com/atereshkov/EXPLogger).

---

## Changelog

See [CHANGELOG](https://github.com/atereshkov/EXPLogger/blob/master/CHANGELOG).

---

## License

EXPLogger Library is released under the [MIT License](https://github.com/atereshkov/EXPLogger/blob/master/LICENSE).