//
// protocolblocks: UIKit/UITabBarController+DelegateBlocks.m
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

#import "UITabBarController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITabBarControllerDelegateBlocksKey = @"UITabBarControllerDelegateBlocksKey";

@implementation UITabBarController (DelegateBlocks)

-(id)useBlocksForDelegate {
    UITabBarControllerDelegateBlocks* delegate = [[[UITabBarControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITabBarControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidEndCustomizingViewControllers:(UITabBarControllerDidEndCustomizingViewControllersBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setDidEndCustomizingViewControllersBlock:block];
}

-(void)onDidSelectViewController:(UITabBarControllerDidSelectViewControllerBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setDidSelectViewControllerBlock:block];
}

-(void)onShouldSelectViewController:(UITabBarControllerShouldSelectViewControllerBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setShouldSelectViewControllerBlock:block];
}

-(void)onWillBeginCustomizingViewControllers:(UITabBarControllerWillBeginCustomizingViewControllersBlock)block {
    [((UITabBarControllerDelegateBlocks*)self.delegate) setWillBeginCustomizingViewControllersBlock:block];
}

-(void)onWillEndCustomizingViewControllers:(UITabBarControllerWillEndCustomizingViewControllersBlock)block {
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

