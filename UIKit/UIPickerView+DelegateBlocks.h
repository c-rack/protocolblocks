//
// ProtocolBlocks: UIKit/UIPickerView+DelegateBlocks.h
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

typedef void (^UIPickerViewDidSelectRowBlock)(UIPickerView* pickerView, NSInteger row, NSInteger component);
typedef CGFloat (^UIPickerViewRowHeightForComponentBlock)(UIPickerView* pickerView, NSInteger component);
typedef NSString* (^UIPickerViewTitleForRowBlock)(UIPickerView* pickerView, NSInteger row, NSInteger component);
typedef UIView* (^UIPickerViewViewForRowBlock)(UIPickerView* pickerView, NSInteger row, NSInteger component, UIView* view);
typedef CGFloat (^UIPickerViewWidthForComponentBlock)(UIPickerView* pickerView, NSInteger component);

@interface UIPickerView (DelegateBlocks)

-(id)delegateblocks;
-(void)setDidSelectRowBlock:(UIPickerViewDidSelectRowBlock)block;
-(void)setRowHeightForComponentBlock:(UIPickerViewRowHeightForComponentBlock)block;
-(void)setTitleForRowBlock:(UIPickerViewTitleForRowBlock)block;
-(void)setViewForRowBlock:(UIPickerViewViewForRowBlock)block;
-(void)setWidthForComponentBlock:(UIPickerViewWidthForComponentBlock)block;

@end

@interface UIPickerViewDelegateBlocks : NSObject <UIPickerViewDelegate> {
    UIPickerViewDidSelectRowBlock _didSelectRowBlock;
    UIPickerViewRowHeightForComponentBlock _rowHeightForComponentBlock;
    UIPickerViewTitleForRowBlock _titleForRowBlock;
    UIPickerViewViewForRowBlock _viewForRowBlock;
    UIPickerViewWidthForComponentBlock _widthForComponentBlock;
}

@property(nonatomic, copy) UIPickerViewDidSelectRowBlock didSelectRowBlock;
@property(nonatomic, copy) UIPickerViewRowHeightForComponentBlock rowHeightForComponentBlock;
@property(nonatomic, copy) UIPickerViewTitleForRowBlock titleForRowBlock;
@property(nonatomic, copy) UIPickerViewViewForRowBlock viewForRowBlock;
@property(nonatomic, copy) UIPickerViewWidthForComponentBlock widthForComponentBlock;

@end

