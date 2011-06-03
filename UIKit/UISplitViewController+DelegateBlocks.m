//
// ProtocolBlocks: UIKit/UISplitViewController+DelegateBlocks.m
// http://protocolblocks.org/
//
// Copyright 2011 Constantin Rack, VIGOS AG. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are
// permitted provided that the following conditions are met:
//
//    1. Redistributions of source code must retain the above copyright notice, this list of
//       conditions and the following disclaimer.
//
//    2. Redistributions in binary form must reproduce the above copyright notice, this list
//       of conditions and the following disclaimer in the documentation and/or other materials
//       provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY CONSTANTIN RACK ``AS IS'' AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL CONSTANTIN RACK OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
// ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "UISplitViewController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UISplitViewControllerDelegateBlocksKey = @"UISplitViewControllerDelegateBlocksKey";

@implementation UISplitViewController (DelegateBlocks)

-(id)delegateblocks {
    UISplitViewControllerDelegateBlocks* delegate = [[[UISplitViewControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UISplitViewControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setWillPresentViewControllerBlock:(UISplitViewControllerWillPresentViewControllerBlock)block {
    [((UISplitViewControllerDelegateBlocks*)self.delegate) setWillPresentViewControllerBlock:block];
}

-(void)setWillHideViewControllerBlock:(UISplitViewControllerWillHideViewControllerBlock)block {
    [((UISplitViewControllerDelegateBlocks*)self.delegate) setWillHideViewControllerBlock:block];
}

-(void)setWillShowViewControllerBlock:(UISplitViewControllerWillShowViewControllerBlock)block {
    [((UISplitViewControllerDelegateBlocks*)self.delegate) setWillShowViewControllerBlock:block];
}

@end

@implementation UISplitViewControllerDelegateBlocks

@synthesize willPresentViewControllerBlock = _willPresentViewControllerBlock;
@synthesize willHideViewControllerBlock = _willHideViewControllerBlock;
@synthesize willShowViewControllerBlock = _willShowViewControllerBlock;

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

