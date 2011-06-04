//
// protocolblocks: UIKit/UITabBarController+DelegateBlocks.h
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

#import <Foundation/Foundation.h>

typedef void (^UITabBarControllerDidEndCustomizingViewControllersBlock)(UITabBarController* tabBarController, NSArray* viewControllers, BOOL changed);
typedef void (^UITabBarControllerDidSelectViewControllerBlock)(UITabBarController* tabBarController, UIViewController* viewController);
typedef BOOL (^UITabBarControllerShouldSelectViewControllerBlock)(UITabBarController* tabBarController, UIViewController* viewController);
typedef void (^UITabBarControllerWillBeginCustomizingViewControllersBlock)(UITabBarController* tabBarController, NSArray* viewControllers);
typedef void (^UITabBarControllerWillEndCustomizingViewControllersBlock)(UITabBarController* tabBarController, NSArray* viewControllers, BOOL changed);

@interface UITabBarController (DelegateBlocks)

-(id)delegateBlocks;
-(void)onDidEndCustomizingViewControllers:(UITabBarControllerDidEndCustomizingViewControllersBlock)block;
-(void)onDidSelectViewController:(UITabBarControllerDidSelectViewControllerBlock)block;
-(void)onShouldSelectViewController:(UITabBarControllerShouldSelectViewControllerBlock)block;
-(void)onWillBeginCustomizingViewControllers:(UITabBarControllerWillBeginCustomizingViewControllersBlock)block;
-(void)onWillEndCustomizingViewControllers:(UITabBarControllerWillEndCustomizingViewControllersBlock)block;

@end

@interface UITabBarControllerDelegateBlocks : NSObject <UITabBarControllerDelegate> {
    UITabBarControllerDidEndCustomizingViewControllersBlock _didEndCustomizingViewControllersBlock;
    UITabBarControllerDidSelectViewControllerBlock _didSelectViewControllerBlock;
    UITabBarControllerShouldSelectViewControllerBlock _shouldSelectViewControllerBlock;
    UITabBarControllerWillBeginCustomizingViewControllersBlock _willBeginCustomizingViewControllersBlock;
    UITabBarControllerWillEndCustomizingViewControllersBlock _willEndCustomizingViewControllersBlock;
}

@property(nonatomic, copy) UITabBarControllerDidEndCustomizingViewControllersBlock didEndCustomizingViewControllersBlock;
@property(nonatomic, copy) UITabBarControllerDidSelectViewControllerBlock didSelectViewControllerBlock;
@property(nonatomic, copy) UITabBarControllerShouldSelectViewControllerBlock shouldSelectViewControllerBlock;
@property(nonatomic, copy) UITabBarControllerWillBeginCustomizingViewControllersBlock willBeginCustomizingViewControllersBlock;
@property(nonatomic, copy) UITabBarControllerWillEndCustomizingViewControllersBlock willEndCustomizingViewControllersBlock;

@end

