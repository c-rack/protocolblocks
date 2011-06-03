//
// ProtocolBlocks: UIKit/UITextField+DelegateBlocks.h
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

typedef BOOL (^UITextFieldShouldChangeCharactersInRangeBlock)(UITextField* textField, NSRange range, NSString * string);
typedef void (^UITextFieldDidBeginEditingBlock)(UITextField* textField);
typedef void (^UITextFieldDidEndEditingBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldBeginEditingBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldClearBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldEndEditingBlock)(UITextField* textField);
typedef BOOL (^UITextFieldShouldReturnBlock)(UITextField* textField);

@interface UITextField (DelegateBlocks)

-(id)delegateblocks;
-(void)setShouldChangeCharactersInRangeBlock:(UITextFieldShouldChangeCharactersInRangeBlock)block;
-(void)setDidBeginEditingBlock:(UITextFieldDidBeginEditingBlock)block;
-(void)setDidEndEditingBlock:(UITextFieldDidEndEditingBlock)block;
-(void)setShouldBeginEditingBlock:(UITextFieldShouldBeginEditingBlock)block;
-(void)setShouldClearBlock:(UITextFieldShouldClearBlock)block;
-(void)setShouldEndEditingBlock:(UITextFieldShouldEndEditingBlock)block;
-(void)setShouldReturnBlock:(UITextFieldShouldReturnBlock)block;

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

