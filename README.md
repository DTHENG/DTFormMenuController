# DTFormMenuController

[![CI Status](http://img.shields.io/travis/DTHENG/DTFormMenuController.svg?style=flat)](https://travis-ci.org/DTHENG/DTFormMenuController)
[![Version](https://img.shields.io/cocoapods/v/DTFormMenuController.svg?style=flat)](http://cocoadocs.org/docsets/DTFormMenuController)
[![License](https://img.shields.io/cocoapods/l/DTFormMenuController.svg?style=flat)](http://cocoadocs.org/docsets/DTFormMenuController)
[![Platform](https://img.shields.io/cocoapods/p/DTFormMenuController.svg?style=flat)](http://cocoadocs.org/docsets/DTFormMenuController)

## Usage

- Start by creating a new class that extends the __DTFormViewController__:

_ViewController.h_ [view file](DTFormMenuControllerExampleApp/DTFormMenuControllerExampleApp/ViewController.h)
```obj-c
#import "DTFormViewController.h"

@interface ViewController : DTFormViewController

@end
```
- Then in the implementation file you'll initialize the form with its "objects":

_ViewController.m_ [view file](DTFormMenuControllerExampleApp/DTFormMenuControllerExampleApp/ViewController.m)
```obj-c
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[super setFormObjects:@[
		
		// Array of objects that extend DTBaseFormObject
		
	]];
}
```
> __NOTE__ you dont have to execute _setFormObjects_ in the _viewDidLoad_ method, it can be called from anywhere.

- Now that you have your view controller setup you will need to open or create a __Main.storyboard__ file.
- In the Main storyboard add a new _UICollectionViewController_. 
- Find the new view controllers _Identity inspector_ set the _Custom Class_ and _Storyboard ID_ fields to __DTFormMenuViewController__.
- Now in the view controller's _Collection View Flow Layout_ set the __Min Spacing__ values to __0__.
- Form objects are any class that extends __DTBaseFormObject__.

_ExampleTextInputFormObject.h_ [view file](DTFormMenuControllerExampleApp/DTFormMenuControllerExampleApp/ExampleTextInputFormObject.h)
```obj-c
#import "DTBaseFormObject.h"

@interface ExampleTextInputFormObject : DTBaseFormObject

- (ExampleTextInputFormObject *)initWithPlaceholder:(NSString *)placeholderText onChanged:(void (^)(NSString *text))onChangedBehavior;

@end
```



## Installation

DTFormMenuController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'DTFormMenuController', '0.1.1'

#### Dont have a Podfile? 

You can easily update your project to use CocoaPods:

- Install the CocoaPods library:
```sh
sudo gem install cocoapods
```
- Go to the directory where your __.xcodeproj__ file is
- Create a new file called __Podfile__
- Update _Podfile_ with:
```ruby
platform :ios, deployment_target: '8.0'

pod 'DTAsyncIO', :git => 'https://github.com/DTHENG/DTAsyncIO.git'
```
- Now run this command:
```sh
pod install
```
- From now on only open the __.xcworkspace__ file in your project _NOT_ __.xcodeproj__
- Done!

## Author

DTHENG, fender5289@gmail.com

## License

DTFormMenuController is available under the MIT license. See the LICENSE file for more info.

