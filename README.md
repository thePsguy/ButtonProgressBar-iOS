# ButtonProgressBar-iOS

[![CI Status](http://img.shields.io/travis/thePsguy/ButtonProgressBar-iOS.svg?style=flat)](https://travis-ci.org/thePsguy/ButtonProgressBar-iOS)
[![Version](https://img.shields.io/cocoapods/v/ButtonProgressBar-iOS.svg?style=flat)](http://cocoapods.org/pods/ButtonProgressBar-iOS)
[![License](https://img.shields.io/cocoapods/l/ButtonProgressBar-iOS.svg?style=flat)](http://cocoapods.org/pods/ButtonProgressBar-iOS)
[![Platform](https://img.shields.io/cocoapods/p/ButtonProgressBar-iOS.svg?style=flat)](http://cocoapods.org/pods/ButtonProgressBar-iOS)

![](https://raw.githubusercontent.com/thePsguy/ButtonProgressBar-iOS/master/preview.gif "GIF Preview")

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS > 7.0

## Installation

ButtonProgressBar-iOS is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ButtonProgressBar-iOS"
```

## Usage
```Swift
import ButtonProgressBar_iOS
```
Initialize just like you would any other UIButton:
```swift
var progressButton = ButtonProgressBar(frame: CGRect)
view.addSubview(progressButton)
```

Since this is a UIButton subclass, targets and labels can be set in the same way:
```swift
progressButton.addTarget(nil, action: #selector(self.tapped), for: .touchUpInside)
progressButton.setTitle("Download", for: .normal)
```

Indeterminate loading can be handled with the following functions:
```swift
startIndeterminate(withTimePeriod time: TimeInterval)
startIndeterminate(withTimePeriod time: TimeInterval, andTimePadding padding: TimeInterval)

/*
Time Padding is the duration (default 0.5), in seconds, before starting the next cycle.
Time Period is the total time (animation + padding) that 1 cycle of the loading takes.
*/

stopIndeterminate()  //Stops the indeterminate loading.
```

For determinate usage or otherwise, progress can be set with:
```swift
setProgress(progress: CGFloat, _ animated: Bool) 
/*
Progress ranges from 0.0 to 1.0

If animated is true, linearly animates to progress.
*/

resetProgress()  //Set progress to 0.0 unanimated.
```

Set the progress and background colors:
```swift
setBackgroundColor(color: UIColor)
setProgressColor(color: UIColor)
```

## Author

Pushkar Sharma, thePsguy@icloud.com

## License

ButtonProgressBar-iOS is available under the MIT license. See the LICENSE file for more info.
