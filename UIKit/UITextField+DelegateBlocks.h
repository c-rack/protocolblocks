//
// protocolblocks: UIKit/UITextField+DelegateBlocks.h
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

typedef BOOL (^UITextFieldShouldChangeCharactersInRangeBlock)(UITextField* textField, NSRange range, NSString * string);
typedef void (^UITextFieldDidBeginEditingBlock)(UITextField* textField);
typedef void (^UITextFieldDidEndEditingBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldBeginEditingBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldClearBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldEndEditingBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldReturnBlock)(UITextField* textField);

@interface UITextField (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onShouldChangeCharactersInRange:(UITextFieldShouldChangeCharactersInRangeBlock)block;
-(void)onDidBeginEditing:(UITextFieldDidBeginEditingBlock)block;
-(void)onDidEndEditing:(UITextFieldDidEndEditingBlock)block;
-(void)onShouldBeginEditing:(UITextFieldShouldBeginEditingBlock)block;
-(void)onShouldClear:(UITextFieldShouldClearBlock)block;
-(void)onShouldEndEditing:(UITextFieldShouldEndEditingBlock)block;
-(void)onShouldReturn:(UITextFieldShouldReturnBlock)block;

@end

@interface UITextFieldDelegateBlocks : NSObject <UITextFieldDelegate> {
    UITextFieldShouldChangeCharactersInRangeBlock _shouldChangeCharactersInRangeBlock;
    UITextFieldDidBeginEditingBlock _didBeginEditingBlock;
    UITextFieldDidEndEditingBlock _didEndEditingBlock;
    UITextFieldShouldBeginEditingBlock _shouldBeginEditingBlock;
    UITextFieldShouldClearBlock _shouldClearBlock;
    UITextFieldShouldEndEditingBlock _shouldEndEditingBlock;
    UITextFieldShouldReturnBlock _shouldReturnBlock;
}

@property(nonatomic, copy) UITextFieldShouldChangeCharactersInRangeBlock shouldChangeCharactersInRangeBlock;
@property(nonatomic, copy) UITextFieldDidBeginEditingBlock didBeginEditingBlock;
@property(nonatomic, copy) UITextFieldDidEndEditingBlock didEndEditingBlock;
@property(nonatomic, copy) UITextFieldShouldBeginEditingBlock shouldBeginEditingBlock;
@property(nonatomic, copy) UITextFieldShouldClearBlock shouldClearBlock;
@property(nonatomic, copy) UITextFieldShouldEndEditingBlock shouldEndEditingBlock;
@property(nonatomic, copy) UITextFieldShouldReturnBlock shouldReturnBlock;

@end

