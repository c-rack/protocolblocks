//
// protocolblocks: UIKit/UIPickerView+DelegateBlocks.h
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

typedef void (^UIPickerViewDidSelectRowBlock)(UIPickerView* pickerView, NSInteger row, NSInteger component);
typedef CGFloat (^UIPickerViewRowHeightForComponentBlock)(UIPickerView* pickerView, NSInteger component);
typedef NSString* (^UIPickerViewTitleForRowBlock)(UIPickerView* pickerView, NSInteger row, NSInteger component);
typedef UIView* (^UIPickerViewViewForRowBlock)(UIPickerView* pickerView, NSInteger row, NSInteger component, UIView* view);
typedef CGFloat (^UIPickerViewWidthForComponentBlock)(UIPickerView* pickerView, NSInteger component);

@interface UIPickerView (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onDidSelectRow:(UIPickerViewDidSelectRowBlock)block;
-(void)onRowHeightForComponent:(UIPickerViewRowHeightForComponentBlock)block;
-(void)onTitleForRow:(UIPickerViewTitleForRowBlock)block;
-(void)onViewForRow:(UIPickerViewViewForRowBlock)block;
-(void)onWidthForComponent:(UIPickerViewWidthForComponentBlock)block;

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

