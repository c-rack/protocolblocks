//
// protocolblocks: UIKit/UISplitViewController+DelegateBlocks.m
// http://protocolblocks.org/
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

#import "UISplitViewController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UISplitViewControllerDelegateBlocksKey = @"UISplitViewControllerDelegateBlocksKey";

@implementation UISplitViewController (DelegateBlocks)

-(id)useBlocksForDelegate {
    UISplitViewControllerDelegateBlocks* delegate = [[[UISplitViewControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UISplitViewControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onWillPresentViewController:(UISplitViewControllerWillPresentViewControllerBlock)block {
    [((UISplitViewControllerDelegateBlocks*)self.delegate) setWillPresentViewControllerBlock:block];
}

-(void)onWillHideViewController:(UISplitViewControllerWillHideViewControllerBlock)block {
    [((UISplitViewControllerDelegateBlocks*)self.delegate) setWillHideViewControllerBlock:block];
}

-(void)onWillShowViewController:(UISplitViewControllerWillShowViewControllerBlock)block {
    [((UISplitViewControllerDelegateBlocks*)self.delegate) setWillShowViewControllerBlock:block];
}

@end

@implementation UISplitViewControllerDelegateBlocks

@synthesize willPresentViewControllerBlock = _willPresentViewControllerBlock;
@synthesize willHideViewControllerBlock = _willHideViewControllerBlock;
@synthesize willShowViewControllerBlock = _willShowViewControllerBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( aSelector == @selector(splitViewController:popoverController:willPresentViewController:) ) {
        return !!self.willPresentViewControllerBlock;
    } else if ( aSelector == @selector(splitViewController:willHideViewController:withBarButtonItem:forPopoverController:) ) {
        return !!self.willHideViewControllerBlock;
    } else if ( aSelector == @selector(splitViewController:willShowViewController:invalidatingBarButtonItem:) ) {
        return !!self.willShowViewControllerBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)splitViewController:(UISplitViewController*)svc popoverController:(UIPopoverController*)pc willPresentViewController:(UIViewController*)aViewController  {
    UISplitViewControllerWillPresentViewControllerBlock block = [self.willPresentViewControllerBlock copy];
    block(svc, pc, aViewController);
    [block release];
}

-(void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController*)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc  {
    UISplitViewControllerWillHideViewControllerBlock block = [self.willHideViewControllerBlock copy];
    block(svc, aViewController, barButtonItem, pc);
    [block release];
}

-(void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController*)aViewController invalidatingBarButtonItem:(UIBarButtonItem*)button  {
    UISplitViewControllerWillShowViewControllerBlock block = [self.willShowViewControllerBlock copy];
    block(svc, aViewController, button);
    [block release];
}

@end

