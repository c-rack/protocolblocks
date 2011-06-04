//
// protocolblocks: UIKit/UINavigationBar+DelegateBlocks.m
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

#import "UINavigationBar+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UINavigationBarDelegateBlocksKey = @"UINavigationBarDelegateBlocksKey";

@implementation UINavigationBar (DelegateBlocks)

-(id)delegateblocks {
    UINavigationBarDelegateBlocks* delegate = [[[UINavigationBarDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UINavigationBarDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidPopItemBlock:(UINavigationBarDidPopItemBlock)block {
    [((UINavigationBarDelegateBlocks*)self.delegate) setDidPopItemBlock:block];
}

-(void)setDidPushItemBlock:(UINavigationBarDidPushItemBlock)block {
    [((UINavigationBarDelegateBlocks*)self.delegate) setDidPushItemBlock:block];
}

-(void)setShouldPopItemBlock:(UINavigationBarShouldPopItemBlock)block {
    [((UINavigationBarDelegateBlocks*)self.delegate) setShouldPopItemBlock:block];
}

-(void)setShouldPushItemBlock:(UINavigationBarShouldPushItemBlock)block {
    [((UINavigationBarDelegateBlocks*)self.delegate) setShouldPushItemBlock:block];
}

@end

@implementation UINavigationBarDelegateBlocks

@synthesize didPopItemBlock = _didPopItemBlock;
@synthesize didPushItemBlock = _didPushItemBlock;
@synthesize shouldPopItemBlock = _shouldPopItemBlock;
@synthesize shouldPushItemBlock = _shouldPushItemBlock;

-(void)navigationBar:(UINavigationBar*)navigationBar didPopItem:(UINavigationItem*)item  {
    UINavigationBarDidPopItemBlock block = [self.didPopItemBlock copy];
    block(navigationBar, item);
    [block release];
}

-(void)navigationBar:(UINavigationBar*)navigationBar didPushItem:(UINavigationItem*)item  {
    UINavigationBarDidPushItemBlock block = [self.didPushItemBlock copy];
    block(navigationBar, item);
    [block release];
}

-(BOOL)navigationBar:(UINavigationBar*)navigationBar shouldPopItem:(UINavigationItem*)item  {
    UINavigationBarShouldPopItemBlock block = [self.shouldPopItemBlock copy];
    BOOL result = block(navigationBar, item);
    [block release];
    return result;
}

-(BOOL)navigationBar:(UINavigationBar*)navigationBar shouldPushItem:(UINavigationItem*)item  {
    UINavigationBarShouldPushItemBlock block = [self.shouldPushItemBlock copy];
    BOOL result = block(navigationBar, item);
    [block release];
    return result;
}

@end

