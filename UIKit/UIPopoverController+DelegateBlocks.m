//
// protocolblocks: UIKit/UIPopoverController+DelegateBlocks.m
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

#import "UIPopoverController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIPopoverControllerDelegateBlocksKey = @"UIPopoverControllerDelegateBlocksKey";

@implementation UIPopoverController (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIPopoverControllerDelegateBlocks* delegate = [[[UIPopoverControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIPopoverControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidDismissPopover:(UIPopoverControllerDidDismissPopoverBlock)block {
    [((UIPopoverControllerDelegateBlocks*)self.delegate) setDidDismissPopoverBlock:block];
}

-(void)onShouldDismissPopover:(UIPopoverControllerShouldDismissPopoverBlock)block {
    [((UIPopoverControllerDelegateBlocks*)self.delegate) setShouldDismissPopoverBlock:block];
}

@end

@implementation UIPopoverControllerDelegateBlocks

@synthesize didDismissPopoverBlock = _didDismissPopoverBlock;
@synthesize shouldDismissPopoverBlock = _shouldDismissPopoverBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(popoverControllerDidDismissPopover:)) ) {
        return !!self.didDismissPopoverBlock;
    } else if ( sel_isEqual(aSelector, @selector(popoverControllerShouldDismissPopover:)) ) {
        return !!self.shouldDismissPopoverBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController*)popoverController  {
    UIPopoverControllerDidDismissPopoverBlock block = [self.didDismissPopoverBlock copy];
    block(popoverController);
    [block release];
}

-(BOOL)popoverControllerShouldDismissPopover:(UIPopoverController*)popoverController  {
    UIPopoverControllerShouldDismissPopoverBlock block = [self.shouldDismissPopoverBlock copy];
    BOOL result = block(popoverController);
    [block release];
    return result;
}

@end

