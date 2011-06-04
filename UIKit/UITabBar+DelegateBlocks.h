//
// protocolblocks: UIKit/UITabBar+DelegateBlocks.h
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

typedef void (^UITabBarDidBeginCustomizingItemsBlock)(UITabBar* tabBar, NSArray* items);
typedef void (^UITabBarDidEndCustomizingItemsBlock)(UITabBar* tabBar, NSArray* items, BOOL changed);
typedef void (^UITabBarDidSelectItemBlock)(UITabBar* tabBar, UITabBarItem* item);
typedef void (^UITabBarWillBeginCustomizingItemsBlock)(UITabBar* tabBar, NSArray* items);
typedef void (^UITabBarWillEndCustomizingItemsBlock)(UITabBar* tabBar, NSArray* items, BOOL changed);

@interface UITabBar (DelegateBlocks)

-(id)delegateBlocks;
-(void)onDidBeginCustomizingItems:(UITabBarDidBeginCustomizingItemsBlock)block;
-(void)onDidEndCustomizingItems:(UITabBarDidEndCustomizingItemsBlock)block;
-(void)onDidSelectItem:(UITabBarDidSelectItemBlock)block;
-(void)onWillBeginCustomizingItems:(UITabBarWillBeginCustomizingItemsBlock)block;
-(void)onWillEndCustomizingItems:(UITabBarWillEndCustomizingItemsBlock)block;

@end

@interface UITabBarDelegateBlocks : NSObject <UITabBarDelegate> {
    UITabBarDidBeginCustomizingItemsBlock _didBeginCustomizingItemsBlock;
    UITabBarDidEndCustomizingItemsBlock _didEndCustomizingItemsBlock;
    UITabBarDidSelectItemBlock _didSelectItemBlock;
    UITabBarWillBeginCustomizingItemsBlock _willBeginCustomizingItemsBlock;
    UITabBarWillEndCustomizingItemsBlock _willEndCustomizingItemsBlock;
}

@property(nonatomic, copy) UITabBarDidBeginCustomizingItemsBlock didBeginCustomizingItemsBlock;
@property(nonatomic, copy) UITabBarDidEndCustomizingItemsBlock didEndCustomizingItemsBlock;
@property(nonatomic, copy) UITabBarDidSelectItemBlock didSelectItemBlock;
@property(nonatomic, copy) UITabBarWillBeginCustomizingItemsBlock willBeginCustomizingItemsBlock;
@property(nonatomic, copy) UITabBarWillEndCustomizingItemsBlock willEndCustomizingItemsBlock;

@end

