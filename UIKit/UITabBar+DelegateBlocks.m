//
// ProtocolBlocks: UIKit/UITabBar+DelegateBlocks.m
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

#import "UITabBar+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITabBarDelegateBlocksKey = @"UITabBarDelegateBlocksKey";

@implementation UITabBar (DelegateBlocks)

-(id)delegateblocks {
    UITabBarDelegateBlocks* delegate = [[[UITabBarDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITabBarDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidBeginCustomizingItemsBlock:(UITabBarDidBeginCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setDidBeginCustomizingItemsBlock:block];
}

-(void)setDidEndCustomizingItemsBlock:(UITabBarDidEndCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setDidEndCustomizingItemsBlock:block];
}

-(void)setDidSelectItemBlock:(UITabBarDidSelectItemBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setDidSelectItemBlock:block];
}

-(void)setWillBeginCustomizingItemsBlock:(UITabBarWillBeginCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setWillBeginCustomizingItemsBlock:block];
}

-(void)setWillEndCustomizingItemsBlock:(UITabBarWillEndCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setWillEndCustomizingItemsBlock:block];
}

@end

@implementation UITabBarDelegateBlocks

@synthesize didBeginCustomizingItemsBlock = _didBeginCustomizingItemsBlock;
@synthesize didEndCustomizingItemsBlock = _didEndCustomizingItemsBlock;
@synthesize didSelectItemBlock = _didSelectItemBlock;
@synthesize willBeginCustomizingItemsBlock = _willBeginCustomizingItemsBlock;
@synthesize willEndCustomizingItemsBlock = _willEndCustomizingItemsBlock;

-(void)tabBar:(UITabBar*)tabBar didBeginCustomizingItems:(NSArray*)items  {
    UITabBarDidBeginCustomizingItemsBlock block = [self.didBeginCustomizingItemsBlock copy];
    block(tabBar, items);
    [block release];
}

-(void)tabBar:(UITabBar*)tabBar didEndCustomizingItems:(NSArray*)items changed:(BOOL)changed  {
    UITabBarDidEndCustomizingItemsBlock block = [self.didEndCustomizingItemsBlock copy];
    block(tabBar, items, changed);
    [block release];
}

-(void)tabBar:(UITabBar*)tabBar didSelectItem:(UITabBarItem*)item  {
    UITabBarDidSelectItemBlock block = [self.didSelectItemBlock copy];
    block(tabBar, item);
    [block release];
}

-(void)tabBar:(UITabBar*)tabBar willBeginCustomizingItems:(NSArray*)items  {
    UITabBarWillBeginCustomizingItemsBlock block = [self.willBeginCustomizingItemsBlock copy];
    block(tabBar, items);
    [block release];
}

-(void)tabBar:(UITabBar*)tabBar willEndCustomizingItems:(NSArray*)items changed:(BOOL)changed  {
    UITabBarWillEndCustomizingItemsBlock block = [self.willEndCustomizingItemsBlock copy];
    block(tabBar, items, changed);
    [block release];
}


@end

