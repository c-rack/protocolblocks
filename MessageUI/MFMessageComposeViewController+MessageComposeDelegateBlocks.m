//
// protocolblocks: MessageUI/MFMessageComposeViewController+MessageComposeDelegateBlocks.m
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

#import "MFMessageComposeViewController+MessageComposeDelegateBlocks.h"
#import <objc/runtime.h>

static NSString* MFMessageComposeViewControllerMessageComposeDelegateBlocksKey = @"MFMessageComposeViewControllerMessageComposeDelegateBlocksKey";

@implementation MFMessageComposeViewController (MessageComposeDelegateBlocks)

-(id)useBlocksForMessageComposeDelegate {
    MFMessageComposeViewControllerMessageComposeDelegateBlocks* messageComposeDelegate = [[[MFMessageComposeViewControllerMessageComposeDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &MFMessageComposeViewControllerMessageComposeDelegateBlocksKey, messageComposeDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.messageComposeDelegate = messageComposeDelegate;
    return self;
}

-(void)onDidFinishWithResult:(MFMessageComposeViewControllerDidFinishWithResultBlock)block {
    [((MFMessageComposeViewControllerMessageComposeDelegateBlocks*)self.messageComposeDelegate) setDidFinishWithResultBlock:block];
}

@end

@implementation MFMessageComposeViewControllerMessageComposeDelegateBlocks

@synthesize didFinishWithResultBlock = _didFinishWithResultBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( aSelector == @selector(messageComposeViewController:didFinishWithResult:) ) {
        return !!self.didFinishWithResultBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)messageComposeViewController:(MFMessageComposeViewController*)controller didFinishWithResult:(MessageComposeResult)result  {
    MFMessageComposeViewControllerDidFinishWithResultBlock block = [self.didFinishWithResultBlock copy];
    block(controller, result);
    [block release];
}

@end

