//
// protocolblocks: UIKit/UITabBar+DelegateBlocks.m
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

#import "UITabBar+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITabBarDelegateBlocksKey = @"UITabBarDelegateBlocksKey";

@implementation UITabBar (DelegateBlocks)

-(id)useBlocksForDelegate {
    UITabBarDelegateBlocks* delegate = [[[UITabBarDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITabBarDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidBeginCustomizingItems:(UITabBarDidBeginCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setDidBeginCustomizingItemsBlock:block];
}

-(void)onDidEndCustomizingItems:(UITabBarDidEndCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setDidEndCustomizingItemsBlock:block];
}

-(void)onDidSelectItem:(UITabBarDidSelectItemBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setDidSelectItemBlock:block];
}

-(void)onWillBeginCustomizingItems:(UITabBarWillBeginCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setWillBeginCustomizingItemsBlock:block];
}

-(void)onWillEndCustomizingItems:(UITabBarWillEndCustomizingItemsBlock)block {
    [((UITabBarDelegateBlocks*)self.delegate) setWillEndCustomizingItemsBlock:block];
}

@end

@implementation UITabBarDelegateBlocks

@synthesize didBeginCustomizingItemsBlock = _didBeginCustomizingItemsBlock;
@synthesize didEndCustomizingItemsBlock = _didEndCustomizingItemsBlock;
@synthesize didSelectItemBlock = _didSelectItemBlock;
@synthesize willBeginCustomizingItemsBlock = _willBeginCustomizingItemsBlock;
@synthesize willEndCustomizingItemsBlock = _willEndCustomizingItemsBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(tabBar:didBeginCustomizingItems:)) ) {
        return !!self.didBeginCustomizingItemsBlock;
    } else if ( sel_isEqual(aSelector, @selector(tabBar:didEndCustomizingItems:changed:)) ) {
        return !!self.didEndCustomizingItemsBlock;
    } else if ( sel_isEqual(aSelector, @selector(tabBar:didSelectItem:)) ) {
        return !!self.didSelectItemBlock;
    } else if ( sel_isEqual(aSelector, @selector(tabBar:willBeginCustomizingItems:)) ) {
        return !!self.willBeginCustomizingItemsBlock;
    } else if ( sel_isEqual(aSelector, @selector(tabBar:willEndCustomizingItems:changed:)) ) {
        return !!self.willEndCustomizingItemsBlock;
    }
    return [super respondsToSelector:aSelector];
}

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

