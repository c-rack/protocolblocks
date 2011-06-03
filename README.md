# protocolblocks

### Implementation of iOS framework protocols (e.g. delegates) with blocks.
[http://protocolblocks.org/](http://protocolblocks.org/)

---
## Features

* **Easiest usage:**
  only one file to import and one line per object to activate block programming support.
* **No learning curve:**
  thanks to XCode's autocompletion, you don't have to remember block syntax
* **Standard naming:**
  block names are equivalent to protocol method names

---
## Implementation Status

Currently, protocolblocks are provided for the following classes and protocols:

* UIKit
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

---
## Usage Example

### 1. Import the header

    #import "UIKit+Blocks.h"

### 2. Initialize your object as usual

    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                   initWithTitle:@"title"
                                   delegate:nil // no need for self or similar
                                   cancelButtonTitle:@"Cancel"
                                   destructiveButtonTitle:@"Destruct"
                                   otherButtonTitles:nil];

### 3. Enable delegate blocks

    [actionSheet delegateblocks];

The created block delegate object is autoreleased due to Objective-C's [Associate Reference](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjectiveC/Chapters/ocAssociativeReferences.html) magic.

### 4. Implement delegate blocks

    [actionSheet setCancelBlock:^(UIActionSheet *actionSheet) {
        // your code here
    }];
    [actionSheet setClickedButtonAtIndexBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        // your code here
    }];
    [actionSheet setDidDismissWithButtonIndexBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        // your code here
    }];
    [actionSheet setDidPresentActionSheetBlock:^(UIActionSheet *actionSheet) {
        // your code here
    }];
    [actionSheet setWillDismissWithButtonIndexBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        // your code here
    }];
    [actionSheet setWillPresentActionSheetBlock:^(UIActionSheet *actionSheet) {
        // your code here
    }];

---
## Related Work
### in chronological order

* 2009-10-18: [How blocks are implemented (and the consequences)](http://cocoawithlove.com/2009/10/how-blocks-are-implemented-and.html) by Matt Gallagher
* 2010-07-07: [Programming with C Blocks On Apple Devices](http://thirdcog.eu/pwcblocks/) by Joachim Bengtsson
* 2010-08-07: [iPhone on blocks: UITextFields ](http://pivotallabs.com/users/amilligan/blog/articles/1353-iphone-on-blocks-uitextfields) by Adam Milligan
* 2010-09-15: [Using Blocks in iOS 4: Designing with Blocks](http://pragmaticstudio.com/blog/2010/9/15/ios4-blocks-2) by Mike Clark
* 2010-12-08: [iOS and Objective-C block quickref](http://augustl.com/blog/2010/ios_and_objective_c_block_quickref) by August Lilleaas
* 2011-02-15: [UIAlertView with Blocks](http://gkoreman.com/blog/2011/02/15/uialertview-with-blocks/) by Greg Koreman 
* 2011-03-20: [EMKAssociateDelegate](http://benedictcohen.co.uk/blog/archives/189) by Benedict Cohen

---
## License
### protocolblocks is licensed under the [Simplified BSD License](https://secure.wikimedia.org/wikipedia/en/wiki/BSD_licenses):

> Copyright 2011 Constantin Rack, VIGOS AG. All rights reserved.
> 
> Redistribution and use in source and binary forms, with or without modification, are
> permitted provided that the following conditions are met:
>
>   1. Redistributions of source code must retain the above copyright notice, this list of
>      conditions and the following disclaimer.
>
>   2. Redistributions in binary form must reproduce the above copyright notice, this list
>      of conditions and the following disclaimer in the documentation and/or other materials
>      provided with the distribution.
>
> THIS SOFTWARE IS PROVIDED BY CONSTANTIN RACK ``AS IS'' AND ANY EXPRESS OR IMPLIED
> WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL CONSTANTIN RACK OR
> CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
