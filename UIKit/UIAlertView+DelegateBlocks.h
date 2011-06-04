//
// protocolblocks: UIKit/UIAlertView+DelegateBlocks.h
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

typedef void (^UIAlertViewClickedButtonAtIndexBlock)(UIAlertView* alertView, NSInteger buttonIndex);
typedef void (^UIAlertViewDidDismissWithButtonIndexBlock)(UIAlertView* alertView, NSInteger buttonIndex);
typedef void (^UIAlertViewWillDismissWithButtonIndexBlock)(UIAlertView* alertView, NSInteger buttonIndex);
typedef void (^UIAlertViewCancelBlock)(UIAlertView* alertView);
typedef void (^UIAlertViewDidPresentAlertViewBlock)(UIAlertView* alertView);
typedef void (^UIAlertViewWillPresentAlertViewBlock)(UIAlertView* alertView);

@interface UIAlertView (DelegateBlocks)

-(id)delegateBlocks;
-(void)onClickedButtonAtIndex:(UIAlertViewClickedButtonAtIndexBlock)block;
-(void)onDidDismissWithButtonIndex:(UIAlertViewDidDismissWithButtonIndexBlock)block;
-(void)onWillDismissWithButtonIndex:(UIAlertViewWillDismissWithButtonIndexBlock)block;
-(void)onCancel:(UIAlertViewCancelBlock)block;
-(void)onDidPresentAlertView:(UIAlertViewDidPresentAlertViewBlock)block;
-(void)onWillPresentAlertView:(UIAlertViewWillPresentAlertViewBlock)block;

@end

@interface UIAlertViewDelegateBlocks : NSObject <UIAlertViewDelegate> {
    UIAlertViewClickedButtonAtIndexBlock _clickedButtonAtIndexBlock;
    UIAlertViewDidDismissWithButtonIndexBlock _didDismissWithButtonIndexBlock;
    UIAlertViewWillDismissWithButtonIndexBlock _willDismissWithButtonIndexBlock;
    UIAlertViewCancelBlock _cancelBlock;
    UIAlertViewDidPresentAlertViewBlock _didPresentAlertViewBlock;
    UIAlertViewWillPresentAlertViewBlock _willPresentAlertViewBlock;
}

@property(nonatomic, copy) UIAlertViewClickedButtonAtIndexBlock clickedButtonAtIndexBlock;
@property(nonatomic, copy) UIAlertViewDidDismissWithButtonIndexBlock didDismissWithButtonIndexBlock;
@property(nonatomic, copy) UIAlertViewWillDismissWithButtonIndexBlock willDismissWithButtonIndexBlock;
@property(nonatomic, copy) UIAlertViewCancelBlock cancelBlock;
@property(nonatomic, copy) UIAlertViewDidPresentAlertViewBlock didPresentAlertViewBlock;
@property(nonatomic, copy) UIAlertViewWillPresentAlertViewBlock willPresentAlertViewBlock;

@end

