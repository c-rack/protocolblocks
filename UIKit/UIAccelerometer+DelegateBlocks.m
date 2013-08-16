//
// protocolblocks: UIKit/UIAccelerometer+DelegateBlocks.m
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

#import "UIAccelerometer+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIAccelerometerDelegateBlocksKey = @"UIAccelerometerDelegateBlocksKey";

@implementation UIAccelerometer (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIAccelerometerDelegateBlocks* delegate = [[[UIAccelerometerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIAccelerometerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidAccelerate:(UIAccelerometerDidAccelerateBlock)block {
    [((UIAccelerometerDelegateBlocks*)self.delegate) setDidAccelerateBlock:block];
}

@end

@implementation UIAccelerometerDelegateBlocks

@synthesize didAccelerateBlock = _didAccelerateBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(accelerometer:didAccelerate:)) ) {
        return !!self.didAccelerateBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration  {
    UIAccelerometerDidAccelerateBlock block = [self.didAccelerateBlock copy];
    block(accelerometer, acceleration);
    [block release];
}

@end

