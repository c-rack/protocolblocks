//
// ProtocolBlocks: UIKit/UIAlertView+DelegateBlocks.h
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

typedef void (^UIAlertViewClickedButtonAtIndexBlock)(UIAlertView* alertView, NSInteger buttonIndex);
typedef void (^UIAlertViewDidDismissWithButtonIndexBlock)(UIAlertView* alertView, NSInteger buttonIndex);
typedef void (^UIAlertViewWillDismissWithButtonIndexBlock)(UIAlertView* alertView, NSInteger buttonIndex);
typedef void (^UIAlertViewCancelBlock)(UIAlertView* alertView);
typedef void (^UIAlertViewDidPresentAlertViewBlock)(UIAlertView* alertView);
typedef void (^UIAlertViewWillPresentAlertViewBlock)(UIAlertView* alertView);

@interface UIAlertView (DelegateBlocks)

-(id)delegateblocks;
-(void)setClickedButtonAtIndexBlock:(UIAlertViewClickedButtonAtIndexBlock)block;
-(void)setDidDismissWithButtonIndexBlock:(UIAlertViewDidDismissWithButtonIndexBlock)block;
-(void)setWillDismissWithButtonIndexBlock:(UIAlertViewWillDismissWithButtonIndexBlock)block;
-(void)setCancelBlock:(UIAlertViewCancelBlock)block;
-(void)setDidPresentAlertViewBlock:(UIAlertViewDidPresentAlertViewBlock)block;
-(void)setWillPresentAlertViewBlock:(UIAlertViewWillPresentAlertViewBlock)block;

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

