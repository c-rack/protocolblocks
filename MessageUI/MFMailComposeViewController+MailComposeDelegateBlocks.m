//
// protocolblocks: MessageUI/MFMailComposeViewController+MailComposeDelegateBlocks.m
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

#import "MFMailComposeViewController+MailComposeDelegateBlocks.h"
#import <objc/runtime.h>

static NSString* MFMailComposeViewControllerMailComposeDelegateBlocksKey = @"MFMailComposeViewControllerMailComposeDelegateBlocksKey";

@implementation MFMailComposeViewController (MailComposeDelegateBlocks)

-(id)useBlocksForMailComposeDelegate {
    MFMailComposeViewControllerMailComposeDelegateBlocks* mailComposeDelegate = [[[MFMailComposeViewControllerMailComposeDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &MFMailComposeViewControllerMailComposeDelegateBlocksKey, mailComposeDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.mailComposeDelegate = mailComposeDelegate;
    return self;
}

-(void)onDidFinishWithResult:(MFMailComposeViewControllerDidFinishWithResultBlock)block {
    [((MFMailComposeViewControllerMailComposeDelegateBlocks*)self.mailComposeDelegate) setDidFinishWithResultBlock:block];
}

@end

@implementation MFMailComposeViewControllerMailComposeDelegateBlocks

@synthesize didFinishWithResultBlock = _didFinishWithResultBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( aSelector == @selector(mailComposeController:didFinishWithResult:) ) {
        return !!self.didFinishWithResultBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result  {
    MFMailComposeViewControllerDidFinishWithResultBlock block = [self.didFinishWithResultBlock copy];
    block(controller, result);
    [block release];
}

@end

