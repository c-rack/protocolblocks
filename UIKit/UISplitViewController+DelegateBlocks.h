//
// protocolblocks: UIKit/UISplitViewController+DelegateBlocks.h
//
// Copyright (C) 2011 by Constantin Rack, VIGOS AG.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <Foundation/Foundation.h>

typedef void (^UISplitViewControllerWillPresentViewControllerBlock)(UISplitViewController* svc, UIPopoverController* pc, UIViewController* aViewController);
typedef void (^UISplitViewControllerWillHideViewControllerBlock)(UISplitViewController* svc, UIViewController* aViewController, UIBarButtonItem* barButtonItem, UIPopoverController* pc);
typedef void (^UISplitViewControllerWillShowViewControllerBlock)(UISplitViewController* svc, UIViewController* aViewController, UIBarButtonItem* button);

@interface UISplitViewController (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onWillPresentViewController:(UISplitViewControllerWillPresentViewControllerBlock)block;
-(void)onWillHideViewController:(UISplitViewControllerWillHideViewControllerBlock)block;
-(void)onWillShowViewController:(UISplitViewControllerWillShowViewControllerBlock)block;

@end

@interface UISplitViewControllerDelegateBlocks : NSObject <UISplitViewControllerDelegate> {
    UISplitViewControllerWillPresentViewControllerBlock _willPresentViewControllerBlock;
    UISplitViewControllerWillHideViewControllerBlock _willHideViewControllerBlock;
    UISplitViewControllerWillShowViewControllerBlock _willShowViewControllerBlock;
}

@property(nonatomic, copy) UISplitViewControllerWillPresentViewControllerBlock willPresentViewControllerBlock;
@property(nonatomic, copy) UISplitViewControllerWillHideViewControllerBlock willHideViewControllerBlock;
@property(nonatomic, copy) UISplitViewControllerWillShowViewControllerBlock willShowViewControllerBlock;

@end

