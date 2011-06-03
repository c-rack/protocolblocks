//
// ProtocolBlocks: UIKit/UIAlertView+DelegateBlocks.m
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

#import "UIAlertView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIAlertViewDelegateBlocksKey = @"UIAlertViewDelegateBlocksKey";

@implementation UIAlertView (DelegateBlocks)

-(id)delegateblocks {
    UIAlertViewDelegateBlocks* delegate = [[[UIAlertViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIAlertViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setClickedButtonAtIndexBlock:(UIAlertViewClickedButtonAtIndexBlock)block {
    [((UIAlertViewDelegateBlocks*)self.delegate) setClickedButtonAtIndexBlock:block];
}

-(void)setDidDismissWithButtonIndexBlock:(UIAlertViewDidDismissWithButtonIndexBlock)block {
    [((UIAlertViewDelegateBlocks*)self.delegate) setDidDismissWithButtonIndexBlock:block];
}

-(void)setWillDismissWithButtonIndexBlock:(UIAlertViewWillDismissWithButtonIndexBlock)block {
    [((UIAlertViewDelegateBlocks*)self.delegate) setWillDismissWithButtonIndexBlock:block];
}

-(void)setCancelBlock:(UIAlertViewCancelBlock)block {
    [((UIAlertViewDelegateBlocks*)self.delegate) setCancelBlock:block];
}

-(void)setDidPresentAlertViewBlock:(UIAlertViewDidPresentAlertViewBlock)block {
    [((UIAlertViewDelegateBlocks*)self.delegate) setDidPresentAlertViewBlock:block];
}

-(void)setWillPresentAlertViewBlock:(UIAlertViewWillPresentAlertViewBlock)block {
    [((UIAlertViewDelegateBlocks*)self.delegate) setWillPresentAlertViewBlock:block];
}

@end

@implementation UIAlertViewDelegateBlocks

@synthesize clickedButtonAtIndexBlock = _clickedButtonAtIndexBlock;
@synthesize didDismissWithButtonIndexBlock = _didDismissWithButtonIndexBlock;
@synthesize willDismissWithButtonIndexBlock = _willDismissWithButtonIndexBlock;
@synthesize cancelBlock = _cancelBlock;
@synthesize didPresentAlertViewBlock = _didPresentAlertViewBlock;
@synthesize willPresentAlertViewBlock = _willPresentAlertViewBlock;

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex  {
    UIAlertViewClickedButtonAtIndexBlock block = [self.clickedButtonAtIndexBlock copy];
    block(alertView, buttonIndex);
    [block release];
}

-(void)alertView:(UIAlertView*)alertView didDissmissWithButtonIndex:(NSInteger)buttonIndex  {
    UIAlertViewDidDismissWithButtonIndexBlock block = [self.didDismissWithButtonIndexBlock copy];
    block(alertView, buttonIndex);
    [block release];
}

-(void)alertView:(UIAlertView*)alertView willDissmissWithButtonIndex:(NSInteger)buttonIndex  {
    UIAlertViewWillDismissWithButtonIndexBlock block = [self.willDismissWithButtonIndexBlock copy];
    block(alertView, buttonIndex);
    [block release];
}

-(void)alertViewCancel:(UIAlertView*)alertView  {
    UIAlertViewCancelBlock block = [self.cancelBlock copy];
    block(alertView);
    [block release];
}

-(void)didPresentAlertView:(UIAlertView*)alertView  {
    UIAlertViewDidPresentAlertViewBlock block = [self.didPresentAlertViewBlock copy];
    block(alertView);
    [block release];
}

-(void)willPresentAlertView:(UIAlertView*)alertView  {
    UIAlertViewWillPresentAlertViewBlock block = [self.willPresentAlertViewBlock copy];
    block(alertView);
    [block release];
}


@end

