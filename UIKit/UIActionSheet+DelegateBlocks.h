//
// protocolblocks: UIKit/UIActionSheet+DelegateBlocks.h
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

