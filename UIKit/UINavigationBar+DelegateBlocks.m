//
// ProtocolBlocks: UIKit/UINavigationBar+DelegateBlocks.m
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

