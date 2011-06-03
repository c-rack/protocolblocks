//
// ProtocolBlocks: UIKit/UITabBarController+DelegateBlocks.m
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

#import "UITabBarController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITabBarControllerDelegateBlocksKey = @"UITabBarControllerDelegateBlocksKey";

@implementation UITabBarController (DelegateBlocks)

-(id)delegateblocks {
    UITabBarControllerDelegateBlocks* delegate = [[[UITabBarControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITabBarControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidEndCustomizingViewControllersBlock:(UITabBarControllerDidEndCustomizingViewControllersBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setDidEndCustomizingViewControllersBlock:block];
}

-(void)setDidSelectViewControllerBlock:(UITabBarControllerDidSelectViewControllerBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setDidSelectViewControllerBlock:block];
}

-(void)setShouldSelectViewControllerBlock:(UITabBarControllerShouldSelectViewControllerBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setShouldSelectViewControllerBlock:block];
}

-(void)setWillBeginCustomizingViewControllersBlock:(UITabBarControllerWillBeginCustomizingViewControllersBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setWillBeginCustomizingViewControllersBlock:block];
}

-(void)setWillEndCustomizingViewControllersBlock:(UITabBarControllerWillEndCustomizingViewControllersBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setWillEndCustomizingViewControllersBlock:block];
}

@end

@implementation UITabBarControllerDelegateBlocks

@synthesize didEndCustomizingViewControllersBlock = _didEndCustomizingViewControllersBlock;
@synthesize didSelectViewControllerBlock = _didSelectViewControllerBlock;
@synthesize shouldSelectViewControllerBlock = _shouldSelectViewControllerBlock;
@synthesize willBeginCustomizingViewControllersBlock = _willBeginCustomizingViewControllersBlock;
@synthesize willEndCustomizingViewControllersBlock = _willEndCustomizingViewControllersBlock;

-(void)tabBarController:(UITabBarController*)tabBarController didEndCustomizingViewControllers:(NSArray*)viewControllers changed:(BOOL)changed  {
    UITabBarControllerDidEndCustomizingViewControllersBlock block = [self.didEndCustomizingViewControllersBlock copy];
    block(tabBarController, viewControllers, changed);
    [block release];
}

-(void)tabBarController:(UITabBarController*)tabBarController didSelectViewController:(UIViewController*)viewController  {
    UITabBarControllerDidSelectViewControllerBlock block = [self.didSelectViewControllerBlock copy];
    block(tabBarController, viewController);
    [block release];
}

-(BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UIViewController*)viewController  {
    UITabBarControllerShouldSelectViewControllerBlock block = [self.shouldSelectViewControllerBlock copy];
    BOOL result = block(tabBarController, viewController);
    [block release];
    return result;
}

-(void)tabBarController:(UITabBarController*)tabBarController willBeginCustomizingViewControllers:(NSArray*)viewControllers  {
    UITabBarControllerWillBeginCustomizingViewControllersBlock block = [self.willBeginCustomizingViewControllersBlock copy];
    block(tabBarController, viewControllers);
    [block release];
}

-(void)tabBarController:(UITabBarController*)tabBarController willEndCustomizingViewControllers:(NSArray*)viewControllers changed:(BOOL)changed  {
    UITabBarControllerWillEndCustomizingViewControllersBlock block = [self.willEndCustomizingViewControllersBlock copy];
    block(tabBarController, viewControllers, changed);
    [block release];
}


@end

