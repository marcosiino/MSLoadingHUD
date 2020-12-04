# MSLoadingHUD

A simple swift for your iOS view controllers to easily show a loading HUD with or without a loading message

[![Version](https://img.shields.io/cocoapods/v/MSLoadingHUD.svg?style=flat)](https://cocoapods.org/pods/MSLoadingHUD)
[![License](https://img.shields.io/cocoapods/l/MSLoadingHUD.svg?style=flat)](https://cocoapods.org/pods/MSLoadingHUD)
[![Platform](https://img.shields.io/cocoapods/p/MSLoadingHUD.svg?style=flat)](https://cocoapods.org/pods/MSLoadingHUD)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MSLoadingHUD is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MSLoadingHUD'
```

## Usage

Add the Loadable trait to your view controller by declaring its conformance to the Loadable protocol:

```swift
class MyViewController: UIViewController, Loadable { ...
```

Then you can use the `showLoadingHUD` and `hideLoadingHUD` methods within your view controller's class to show and hide the loading HUD. The first method accepts an optional `loadingMessage` argument, which if it's specified, a message will be shown below the loading indicator.

That's it!

## Author

Marco Siino, siino.marco [**] gmail.com

## License

MSLoadingHUD is available under the MIT license. See the LICENSE file for more info.