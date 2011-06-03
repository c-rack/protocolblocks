//
// ProtocolBlocks: UIKit/UIActionSheet+DelegateBlocks.h
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

typedef void (^UIActionSheetClickedButtonAtIndexBlock)(UIActionSheet* actionSheet, NSInteger buttonIndex);
typedef void (^UIActionSheetDidDismissWithButtonIndexBlock)(UIActionSheet* actionSheet, NSInteger buttonIndex);
typedef void (^UIActionSheetWillDismissWithButtonIndexBlock)(UIActionSheet* actionSheet, NSInteger buttonIndex);
typedef void (^UIActionSheetCancelBlock)(UIActionSheet* actionSheet);
typedef void (^UIActionSheetDidPresentActionSheetBlock)(UIActionSheet* actionSheet);
typedef void (^UIActionSheetWillPresentActionSheetBlock)(UIActionSheet* actionSheet);

@interface UIActionSheet (DelegateBlocks)

-(id)delegateblocks;
-(void)setClickedButtonAtIndexBlock:(UIActionSheetClickedButtonAtIndexBlock)block;
-(void)setDidDismissWithButtonIndexBlock:(UIActionSheetDidDismissWithButtonIndexBlock)block;
-(void)setWillDismissWithButtonIndexBlock:(UIActionSheetWillDismissWithButtonIndexBlock)block;
-(void)setCancelBlock:(UIActionSheetCancelBlock)block;
-(void)setDidPresentActionSheetBlock:(UIActionSheetDidPresentActionSheetBlock)block;
-(void)setWillPresentActionSheetBlock:(UIActionSheetWillPresentActionSheetBlock)block;

@end

@interface UIActionSheetDelegateBlocks : NSObject <UIActionSheetDelegate> {
    UIActionSheetClickedButtonAtIndexBlock _clickedButtonAtIndexBlock;
    UIActionSheetDidDismissWithButtonIndexBlock _didDismissWithButtonIndexBlock;
    UIActionSheetWillDismissWithButtonIndexBlock _willDismissWithButtonIndexBlock;
    UIActionSheetCancelBlock _cancelBlock;
    UIActionSheetDidPresentActionSheetBlock _didPresentActionSheetBlock;
    UIActionSheetWillPresentActionSheetBlock _willPresentActionSheetBlock;
}

@property(nonatomic, copy) UIActionSheetClickedButtonAtIndexBlock clickedButtonAtIndexBlock;
@property(nonatomic, copy) UIActionSheetDidDismissWithButtonIndexBlock didDismissWithButtonIndexBlock;
@property(nonatomic, copy) UIActionSheetWillDismissWithButtonIndexBlock willDismissWithButtonIndexBlock;
@property(nonatomic, copy) UIActionSheetCancelBlock cancelBlock;
@property(nonatomic, copy) UIActionSheetDidPresentActionSheetBlock didPresentActionSheetBlock;
@property(nonatomic, copy) UIActionSheetWillPresentActionSheetBlock willPresentActionSheetBlock;

@end

