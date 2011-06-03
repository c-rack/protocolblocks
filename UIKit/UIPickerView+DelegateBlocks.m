//
// ProtocolBlocks: UIKit/UIPickerView+DelegateBlocks.m
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

#import "UIPickerView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIPickerViewDelegateBlocksKey = @"UIPickerViewDelegateBlocksKey";

@implementation UIPickerView (DelegateBlocks)

-(id)delegateblocks {
    UIPickerViewDelegateBlocks* delegate = [[[UIPickerViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIPickerViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidSelectRowBlock:(UIPickerViewDidSelectRowBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setDidSelectRowBlock:block];
}

-(void)setRowHeightForComponentBlock:(UIPickerViewRowHeightForComponentBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setRowHeightForComponentBlock:block];
}

-(void)setTitleForRowBlock:(UIPickerViewTitleForRowBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setTitleForRowBlock:block];
}

-(void)setViewForRowBlock:(UIPickerViewViewForRowBlock)block {
    [((UIPickerViewDelegateBlocks*)self.delegate) setViewForRowBlock:block];
}

-(void)setWidthForComponentBlock:(UIPickerViewWidthForComponentBlock)block {
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

