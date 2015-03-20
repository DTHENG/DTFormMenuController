# DTFormMenuController

[![CI Status](http://img.shields.io/travis/DTHENG/DTFormMenuController.svg?style=flat)](https://travis-ci.org/DTHENG/DTFormMenuController)
[![Version](https://img.shields.io/cocoapods/v/DTFormMenuController.svg?style=flat)](http://cocoadocs.org/docsets/DTFormMenuController)
[![License](https://img.shields.io/cocoapods/l/DTFormMenuController.svg?style=flat)](http://cocoadocs.org/docsets/DTFormMenuController)
[![Platform](https://img.shields.io/cocoapods/p/DTFormMenuController.svg?style=flat)](http://cocoadocs.org/docsets/DTFormMenuController)

<img src="https://s3.amazonaws.com/dtheng/DTFormViewController.gif" style="max-width:200px"/>

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
- In the view controller set the _UICollectionViewCell's_ __Reusable Identifier__ to __"content"__.
- Form objects are any class that extends __DTBaseFormObject__.

_ExampleTextInputFormObject.h_ [view file](DTFormMenuControllerExampleApp/DTFormMenuControllerExampleApp/ExampleTextInputFormObject.h)
```obj-c
#import "DTBaseFormObject.h"

@interface ExampleTextInputFormObject : DTBaseFormObject

- (ExampleTextInputFormObject *)initWithPlaceholder:(NSString *)placeholderText onChanged:(void (^)(NSString *text))onChangedBehavior;

@end
```
- In the implementation of the new class the only required override method is:

_ExampleTextInputFormObject.m_ [view file](DTFormMenuControllerExampleApp/DTFormMenuControllerExampleApp/ExampleTextInputFormObject.m#L18)
```obj-c
- (UICollectionViewCell *)toCollectionViewCell:(UICollectionView *)collectionView :(NSIndexPath *)indexPath {

	UICollectionViewCell *exampleCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"example" forIndexPath:indexPath];
	
	// Customize cell
	
	return exampleCell;
}
```
- Before we can run the code we'll need to add the _ViewController_ to __Main.storyboard__.
- In the Main storyboard add a new _UICollectionViewController_. 
- Find the new view controllers _Identity inspector_ set the _Custom Class_ and _Storyboard ID_ fields to the name of your class.
- Now in the view controller's _Collection View Flow Layout_ set the __Min Spacing__ values to __0__.
- In the view controller set the _UICollectionViewCell's_ __Reusable Identifier__ to __"example"__.
- Done!

## Installation

DTFormMenuController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

	pod 'DTFormMenuController', '0.1.8'

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

pod 'DTFormMenuController', '0.1.8'
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

