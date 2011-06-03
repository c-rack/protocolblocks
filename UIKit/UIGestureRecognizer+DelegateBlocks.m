//
// ProtocolBlocks: UIKit/UIGestureRecognizer+DelegateBlocks.m
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

#import "UIGestureRecognizer+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIGestureRecognizerDelegateBlocksKey = @"UIGestureRecognizerDelegateBlocksKey";

@implementation UIGestureRecognizer (DelegateBlocks)

-(id)delegateblocks {
    UIGestureRecognizerDelegateBlocks* delegate = [[[UIGestureRecognizerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIGestureRecognizerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setShouldReceiveTouchBlock:(UIGestureRecognizerShouldReceiveTouchBlock)block {
    [((UIGestureRecognizerDelegateBlocks*)self.delegate) setShouldReceiveTouchBlock:block];
}

-(void)setShouldRecognizeSimultaneouslyWithGestureRecognizerBlock:(UIGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizerBlock)block {
    [((UIGestureRecognizerDelegateBlocks*)self.delegate) setShouldRecognizeSimultaneouslyWithGestureRecognizerBlock:block];
}

-(void)setShouldBeginBlock:(UIGestureRecognizerShouldBeginBlock)block {
    [((UIGestureRecognizerDelegateBlocks*)self.delegate) setShouldBeginBlock:block];
}

@end

@implementation UIGestureRecognizerDelegateBlocks

@synthesize shouldReceiveTouchBlock = _shouldReceiveTouchBlock;
@synthesize shouldRecognizeSimultaneouslyWithGestureRecognizerBlock = _shouldRecognizeSimultaneouslyWithGestureRecognizerBlock;
@synthesize shouldBeginBlock = _shouldBeginBlock;

-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch  {
    UIGestureRecognizerShouldReceiveTouchBlock block = [self.shouldReceiveTouchBlock copy];
    BOOL result = block(gestureRecognizer, touch);
    [block release];
    return result;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizer  {
    UIGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizerBlock block = [self.shouldRecognizeSimultaneouslyWithGestureRecognizerBlock copy];
    BOOL result = block(gestureRecognizer, otherGestureRecognizer);
    [block release];
    return result;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer  {
    UIGestureRecognizerShouldBeginBlock block = [self.shouldBeginBlock copy];
    BOOL result = block(gestureRecognizer);
    [block release];
    return result;
}


@end

