//
// protocolblocks: UIKit/UIPickerView+DelegateBlocks.m
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

#import "UIPickerView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIPickerViewDelegateBlocksKey = @"UIPickerViewDelegateBlocksKey";

@implementation UIPickerView (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIPickerViewDelegateBlocks* delegate = [[[UIPickerViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIPickerViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidSelectRow:(UIPickerViewDidSelectRowBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setDidSelectRowBlock:block];
}

-(void)onRowHeightForComponent:(UIPickerViewRowHeightForComponentBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setRowHeightForComponentBlock:block];
}

-(void)onTitleForRow:(UIPickerViewTitleForRowBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setTitleForRowBlock:block];
}

-(void)onViewForRow:(UIPickerViewViewForRowBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setViewForRowBlock:block];
}

-(void)onWidthForComponent:(UIPickerViewWidthForComponentBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setWidthForComponentBlock:block];
}

@end

@implementation UIPickerViewDelegateBlocks

@synthesize didSelectRowBlock = _didSelectRowBlock;
@synthesize rowHeightForComponentBlock = _rowHeightForComponentBlock;
@synthesize titleForRowBlock = _titleForRowBlock;
@synthesize viewForRowBlock = _viewForRowBlock;
@synthesize widthForComponentBlock = _widthForComponentBlock;

-(void)pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component  {
    UIPickerViewDidSelectRowBlock block = [self.didSelectRowBlock copy];
    block(pickerView, row, component);
    [block release];
}

-(CGFloat)pickerView:(UIPickerView*)pickerView rowHeightForComponent:(NSInteger)component  {
    UIPickerViewRowHeightForComponentBlock block = [self.rowHeightForComponentBlock copy];
    CGFloat result = block(pickerView, component);
    [block release];
    return result;
}

-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component  {
    UIPickerViewTitleForRowBlock block = [self.titleForRowBlock copy];
    NSString* result = block(pickerView, row, component);
    [block release];
    return result;
}

-(UIView*)pickerView:(UIPickerView*)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView*)view  {
    UIPickerViewViewForRowBlock block = [self.viewForRowBlock copy];
    UIView* result = block(pickerView, row, component, view);
    [block release];
    return result;
}

-(CGFloat)pickerView:(UIPickerView*)pickerView widthForComponent:(NSInteger)component  {
    UIPickerViewWidthForComponentBlock block = [self.widthForComponentBlock copy];
    CGFloat result = block(pickerView, component);
    [block release];
    return result;
}

@end

