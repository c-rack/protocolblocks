//
// protocolblocks: UIKit/UIGestureRecognizer+DelegateBlocks.m
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

#import "UIGestureRecognizer+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIGestureRecognizerDelegateBlocksKey = @"UIGestureRecognizerDelegateBlocksKey";

@implementation UIGestureRecognizer (DelegateBlocks)

-(id)delegateBlocks {
    UIGestureRecognizerDelegateBlocks* delegate = [[[UIGestureRecognizerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIGestureRecognizerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onShouldReceiveTouch:(UIGestureRecognizerShouldReceiveTouchBlock)block {
    [((UIGestureRecognizerDelegateBlocks*)self.delegate) setShouldReceiveTouchBlock:block];
}

-(void)onShouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizerBlock)block {
    [((UIGestureRecognizerDelegateBlocks*)self.delegate) setShouldRecognizeSimultaneouslyWithGestureRecognizerBlock:block];
}

-(void)onShouldBegin:(UIGestureRecognizerShouldBeginBlock)block {
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

