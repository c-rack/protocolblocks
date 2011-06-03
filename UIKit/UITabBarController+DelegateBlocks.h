//
// ProtocolBlocks: UIKit/UITabBarController+DelegateBlocks.h
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

#import <Foundation/Foundation.h>

typedef void (^UITabBarControllerDidEndCustomizingViewControllersBlock)(UITabBarController* tabBarController, NSArray* viewControllers, BOOL changed);
typedef void (^UITabBarControllerDidSelectViewControllerBlock)(UITabBarController* tabBarController, UIViewController* viewController);
typedef BOOL (^UITabBarControllerShouldSelectViewControllerBlock)(UITabBarController* tabBarController, UIViewController* viewController);
typedef void (^UITabBarControllerWillBeginCustomizingViewControllersBlock)(UITabBarController* tabBarController, NSArray* viewControllers);
typedef void (^UITabBarControllerWillEndCustomizingViewControllersBlock)(UITabBarController* tabBarController, NSArray* viewControllers, BOOL changed);

@interface UITabBarController (DelegateBlocks)

-(id)delegateblocks;
-(void)setDidEndCustomizingViewControllersBlock:(UITabBarControllerDidEndCustomizingViewControllersBlock)block;
-(void)setDidSelectViewControllerBlock:(UITabBarControllerDidSelectViewControllerBlock)block;
-(void)setShouldSelectViewControllerBlock:(UITabBarControllerShouldSelectViewControllerBlock)block;
-(void)setWillBeginCustomizingViewControllersBlock:(UITabBarControllerWillBeginCustomizingViewControllersBlock)block;
-(void)setWillEndCustomizingViewControllersBlock:(UITabBarControllerWillEndCustomizingViewControllersBlock)block;

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

