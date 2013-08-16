//
// protocolblocks: EventKitUI/EKEventViewController+DelegateBlocks.m
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

#import "EKEventViewController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* EKEventViewControllerDelegateBlocksKey = @"EKEventViewControllerDelegateBlocksKey";

@implementation EKEventViewController (DelegateBlocks)

-(id)useBlocksForDelegate {
    EKEventViewControllerDelegateBlocks* delegate = [[[EKEventViewControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &EKEventViewControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidCompleteWithAction:(EKEventViewControllerDidCompleteWithActionBlock)block {
    [((EKEventViewControllerDelegateBlocks*)self.delegate) setDidCompleteWithActionBlock:block];
}

@end

@implementation EKEventViewControllerDelegateBlocks

@synthesize didCompleteWithActionBlock = _didCompleteWithActionBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(eventViewController:didCompleteWithAction:)) ) {
        return !!self.didCompleteWithActionBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)eventViewController:(EKEventViewController*)controller didCompleteWithAction:(EKEventViewAction)action  {
    EKEventViewControllerDidCompleteWithActionBlock block = [self.didCompleteWithActionBlock copy];
    block(controller, action);
    [block release];
}

@end

