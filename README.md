# protocolblocks

Replacing delegates in iOS with blocks.

## Motivation

With iOS 4, Apple introduced [blocks](http://developer.apple.com/library/ios/#documentation/cocoa/Conceptual/Blocks/Articles/00_Introduction.html) (also known as [closures](https://secure.wikimedia.org/wikipedia/en/wiki/Closure_%28computer_science%29)) to Objective-C and iOS.

Unfortunately, this leads to [some confusion](http://stackoverflow.com/questions/3940520/why-does-the-new-ios-gamekit-split-between-delegates-and-blocks), because newer callbacks are implemented as blocks, while older ones are implemented with delegates.

This projects aims to backport blocks for all *old* delegates of iOS.

## Features

* **Easiest usage:**
  only one file to import and one line per object to activate block programming support.
* **No learning curve:**
  thanks to XCode's autocompletion, you don't have to remember block syntax
* **Standard naming:**
  block names are equivalent to protocol method names

## Implementation Status

Currently, blocks have been backported for the following delegates:

* **EventKitUI**
  * EKEventEditViewController delegate
  * EKEventViewController delegate
* **iAd**
  * ADBannerView delegate
  * ADInterstitialAd delegate
* **MessageUI**
  * MFMailComposeViewController delegate
  * MFMessageComposeViewController delegate
* **UIKit**
  * UIAccelerometer delegate
  * UIActionSheet delegate
  * UIAlertView delegate
  * UIDocumentInteractionController delegate
  * UIGestureRecognizer delegate
  * UIImagePickerController delegate
  * UINavigationBar delegate
  * UINavigationController delegate
  * UIPickerView dataSource
  * UIPickerView delegate
  * UIPopoverController delegate
  * UIPrintInteractionController delegate
  * UIScrollView delegate
  * UISearchBar delegate
  * UISearchDisplayController delegate
  * UISplitViewController delegate
  * UITabBarController delegate
  * UITabBar delegate
  * UITableView dataSource
  * UITableView delegate
  * UITextField delegate
  * UITextView delegate
  * UIVideoEditorController delegate
  * UIWebView delegate

## Usage Example

#### 1. Import the header
```
#import "UIKit+Blocks.h"
```
#### 2. Initialize your object as usual
```
UIActionSheet* actionSheet = [[UIActionSheet alloc]
                               initWithTitle:@"Title"
                               delegate:nil // no need for self or similar
                               cancelButtonTitle:@"Cancel"
                               destructiveButtonTitle:@"Destruct"
                               otherButtonTitles:nil];
```
#### 3. Enable blocks instead of providing a delegate
```
[actionSheet useBlocksForDelegate];
```
The automatically created delegate object is autoreleased thanks to Objective-C's [Associate Reference](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocAssociativeReferences.html) magic.

#### 4. Implement delegate methods with blocks

```
[actionSheet onCancel:^(UIActionSheet *actionSheet) {
    // your code here
}];
[actionSheet onClickedButtonAtIndex:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
    // your code here
}];
[actionSheet onDidDismissWithButtonIndex:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
    // your code here
}];
[actionSheet onDidPresentActionSheet:^(UIActionSheet *actionSheet) {
    // your code here
}];
[actionSheet onWillDismissWithButtonIndex:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
    // your code here
}];
[actionSheet onWillPresentActionSheet:^(UIActionSheet *actionSheet) {
    // your code here
}];
```

## Related Work

in chronological order:

* 2009-10-18: [How blocks are implemented (and the consequences)](http://cocoawithlove.com/2009/10/how-blocks-are-implemented-and.html) by Matt Gallagher
* 2010-07-07: [Programming with C Blocks On Apple Devices](http://thirdcog.eu/pwcblocks/) by Joachim Bengtsson
* 2010-08-07: [iPhone on blocks: UITextFields ](http://pivotallabs.com/users/amilligan/blog/articles/1353-iphone-on-blocks-uitextfields) by Adam Milligan
* 2010-09-15: [Using Blocks in iOS 4: Designing with Blocks](http://pragmaticstudio.com/blog/2010/9/15/ios4-blocks-2) by Mike Clark
* 2010-12-08: [iOS and Objective-C block quickref](http://augustl.com/blog/2010/ios_and_objective_c_block_quickref) by August Lilleaas
* 2011-02-15: [UIAlertView with Blocks](http://gkoreman.com/blog/2011/02/15/uialertview-with-blocks/) by Greg Koreman 
* 2011-03-20: [EMKAssociateDelegate](http://benedictcohen.co.uk/blog/archives/189) by Benedict Cohen
* 2011-03-22: [iOS Code: Block Based UIAlertView and UIActionSheet](http://blog.mugunthkumar.com/coding/ios-code-block-based-uialertview-and-uiactionsheet/) by Mugunth Kumar

## Contribution Process

This project uses the [C4.1 process](http://rfc.zeromq.org/spec:22) for all code changes.

> "Everyone, without distinction or discrimination, SHALL have an equal right to become a Contributor under the
terms of this contract."

### tl;dr

1. Check for [open issues](https://github.com/c-rack/protocolblocks/issues) or [open a new issue](https://github.com/c-rack/protocolblocks/issues/new) to start a discussion around a feature idea or a bug
2. Fork the [protocolblocks repository on Github](https://github.com/c-rack/protocolblocks) to start making your changes
3. Write a test which shows that the bug was fixed or that the feature works as expected
4. Send a pull request
5. Your pull request is merged and you are added to the [list of contributors](https://github.com/c-rack/protocolblocks/graphs/contributors)


## License

This project is licensed under the [MIT License](http://www.opensource.org/licenses/mit-license.php):

    Copyright (C) 2011-2016 Constantin Rack
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
