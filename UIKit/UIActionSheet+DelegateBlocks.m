//
// ProtocolBlocks: UIKit/UIActionSheet+DelegateBlocks.m
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

#import "UIActionSheet+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIActionSheetDelegateBlocksKey = @"UIActionSheetDelegateBlocksKey";

@implementation UIActionSheet (DelegateBlocks)

-(id)delegateblocks {
    UIActionSheetDelegateBlocks* delegate = [[[UIActionSheetDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIActionSheetDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setClickedButtonAtIndexBlock:(UIActionSheetClickedButtonAtIndexBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setClickedButtonAtIndexBlock:block];
}

-(void)setDidDismissWithButtonIndexBlock:(UIActionSheetDidDismissWithButtonIndexBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setDidDismissWithButtonIndexBlock:block];
}

-(void)setWillDismissWithButtonIndexBlock:(UIActionSheetWillDismissWithButtonIndexBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setWillDismissWithButtonIndexBlock:block];
}

-(void)setCancelBlock:(UIActionSheetCancelBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setCancelBlock:block];
}

-(void)setDidPresentActionSheetBlock:(UIActionSheetDidPresentActionSheetBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setDidPresentActionSheetBlock:block];
}

-(void)setWillPresentActionSheetBlock:(UIActionSheetWillPresentActionSheetBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setWillPresentActionSheetBlock:block];
}

@end

@implementation UIActionSheetDelegateBlocks

@synthesize clickedButtonAtIndexBlock = _clickedButtonAtIndexBlock;
@synthesize didDismissWithButtonIndexBlock = _didDismissWithButtonIndexBlock;
@synthesize willDismissWithButtonIndexBlock = _willDismissWithButtonIndexBlock;
@synthesize cancelBlock = _cancelBlock;
@synthesize didPresentActionSheetBlock = _didPresentActionSheetBlock;
@synthesize willPresentActionSheetBlock = _willPresentActionSheetBlock;

-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex  {
    UIActionSheetClickedButtonAtIndexBlock block = [self.clickedButtonAtIndexBlock copy];
    block(actionSheet, buttonIndex);
    [block release];
}

-(void)actionSheet:(UIActionSheet*)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex  {
    UIActionSheetDidDismissWithButtonIndexBlock block = [self.didDismissWithButtonIndexBlock copy];
    block(actionSheet, buttonIndex);
    [block release];
}

-(void)actionSheet:(UIActionSheet*)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex  {
    UIActionSheetWillDismissWithButtonIndexBlock block = [self.willDismissWithButtonIndexBlock copy];
    block(actionSheet, buttonIndex);
    [block release];
}

-(void)actionSheetCancel:(UIActionSheet*)actionSheet  {
    UIActionSheetCancelBlock block = [self.cancelBlock copy];
    block(actionSheet);
    [block release];
}

-(void)didPresentActionSheet:(UIActionSheet*)actionSheet  {
    UIActionSheetDidPresentActionSheetBlock block = [self.didPresentActionSheetBlock copy];
    block(actionSheet);
    [block release];
}

-(void)willPresentActionSheet:(UIActionSheet*)actionSheet  {
    UIActionSheetWillPresentActionSheetBlock block = [self.willPresentActionSheetBlock copy];
    block(actionSheet);
    [block release];
}


@end

