# ButtonProgressBar-iOS

[![CI Status](http://img.shields.io/travis/thePsguy/ButtonProgressBar-iOS.svg?style=flat)](https://travis-ci.org/thePsguy/ButtonProgressBar-iOS)
[![Version](https://img.shields.io/cocoapods/v/ButtonProgressBar-iOS.svg?style=flat)](http://cocoapods.org/pods/ButtonProgressBar-iOS)
[![License](https://img.shields.io/cocoapods/l/ButtonProgressBar-iOS.svg?style=flat)](http://cocoapods.org/pods/ButtonProgressBar-iOS)
[![Platform](https://img.shields.io/cocoapods/p/ButtonProgressBar-iOS.svg?style=flat)](http://cocoapods.org/pods/ButtonProgressBar-iOS)
[![Contact](https://img.shields.io/badge/contact-%40thePsguy-3a8fc1.svg)](https://twitter.com/thePsguy)

<img src="https://raw.githubusercontent.com/thePsguy/ButtonProgressBar-iOS/master/output_F2Ryon.gif" alt="GIF Preview"/>

## Example

* To test it in your browser itself, [click here](https://appetize.io/app/rcb15cyg78agt90pqa3xujx3cc).

* To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="https://raw.githubusercontent.com/thePsguy/ButtonProgressBar-iOS/master/SimulatorScreenShot.png" alt="Simulator Screen" width="200"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://raw.githubusercontent.com/thePsguy/ButtonProgressBar-iOS/master/preview.gif" alt="GIF Preview" width="350"/> 

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
<hr>

#### Initialize just like you would any other UIButton:
```swift
var progressButton = ButtonProgressBar(frame: CGRect)
view.addSubview(progressButton)
```
<hr>

#### Since this is a UIButton subclass, targets and labels can be set in the same way:
```swift
progressButton.addTarget(nil, action: #selector(self.tapped), for: .touchUpInside)
progressButton.setTitle("Download", for: .normal)
```
<hr>

#### The completion image can be set with;
_This image must be set since no default exists._
```swift    
  setCompletionImage(image: UIImage)
```
<hr>

#### Indeterminate loading can be handled with the following functions:
```swift
startIndeterminate(withTimePeriod time: TimeInterval)
startIndeterminate(withTimePeriod time: TimeInterval, andTimePadding padding: TimeInterval)

/*
Time Padding is the duration (default 0.5), in seconds, before starting the next cycle.
Time Period is the total time (animation + padding) that 1 cycle of the loading takes.
*/

stopIndeterminate()  //Stops the indeterminate loading.
```
<hr>

#### For determinate usage or otherwise, progress can be set with:
```swift
setProgress(progress: CGFloat, _ animated: Bool) 
/*
Progress ranges from 0.0 to 1.0

If animated is true, linearly animates to progress.
*/

resetProgress()  //Set progress to 0.0 unanimated.
```
<hr>

#### Set the progress and background colors:
```swift
setBackgroundColor(color: UIColor)
setProgressColor(color: UIColor)
```
<hr>

#### To explicitly show/hide the title / image:
```swift
hideTitle(_ hidden: Bool)
hideImage(_ hidden: Bool)
```
<hr>

#### Stop indeterminate loading if active, set progress to 1.0 animated, and display completion image if set.
     Needs to be called explicitly when loading determinate as well.
```swift
  triggerCompletion()
```
<hr>

## Author

Pushkar Sharma, thePsguy@icloud.com
<hr>

Inspiration from [Dribbble](https://dribbble.com/shots/2551579-Download-Button)

[Android version](https://github.com/ishaan1995/ButtonProgressBar) available!


## License

ButtonProgressBar-iOS is available under the MIT license. See the LICENSE file for more info.
