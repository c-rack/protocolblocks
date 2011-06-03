//
// ProtocolBlocks: UIKit/UITextField+DelegateBlocks.m
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

#import "UITextField+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITextFieldDelegateBlocksKey = @"UITextFieldDelegateBlocksKey";

@implementation UITextField (DelegateBlocks)

-(id)delegateblocks {
    UITextFieldDelegateBlocks* delegate = [[[UITextFieldDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITextFieldDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setShouldChangeCharactersInRangeBlock:(UITextFieldShouldChangeCharactersInRangeBlock)block {
    [((UITextFieldDelegateBlocks*)self.delegate) setShouldChangeCharactersInRangeBlock:block];
}

-(void)setDidBeginEditingBlock:(UITextFieldDidBeginEditingBlock)block {
    [((UITextFieldDelegateBlocks*)self.delegate) setDidBeginEditingBlock:block];
}

-(void)setDidEndEditingBlock:(UITextFieldDidEndEditingBlock)block {
    [((UITextFieldDelegateBlocks*)self.delegate) setDidEndEditingBlock:block];
}

-(void)setShouldBeginEditingBlock:(UITextFieldShouldBeginEditingBlock)block {
    [((UITextFieldDelegateBlocks*)self.delegate) setShouldBeginEditingBlock:block];
}

-(void)setShouldClearBlock:(UITextFieldShouldClearBlock)block {
    [((UITextFieldDelegateBlocks*)self.delegate) setShouldClearBlock:block];
}

-(void)setShouldEndEditingBlock:(UITextFieldShouldEndEditingBlock)block {
    [((UITextFieldDelegateBlocks*)self.delegate) setShouldEndEditingBlock:block];
}

-(void)setShouldReturnBlock:(UITextFieldShouldReturnBlock)block {
    [((UITextFieldDelegateBlocks*)self.delegate) setShouldReturnBlock:block];
}

@end

@implementation UITextFieldDelegateBlocks

@synthesize shouldChangeCharactersInRangeBlock = _shouldChangeCharactersInRangeBlock;
@synthesize didBeginEditingBlock = _didBeginEditingBlock;
@synthesize didEndEditingBlock = _didEndEditingBlock;
@synthesize shouldBeginEditingBlock = _shouldBeginEditingBlock;
@synthesize shouldClearBlock = _shouldClearBlock;
@synthesize shouldEndEditingBlock = _shouldEndEditingBlock;
@synthesize shouldReturnBlock = _shouldReturnBlock;

-(BOOL)textfield:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  {
    UITextFieldShouldChangeCharactersInRangeBlock block = [self.shouldChangeCharactersInRangeBlock copy];
    BOOL result = block(textField, range, string);
    [block release];
    return result;
}

-(void)textFieldDidBeginEditing:(UITextField*)textField  {
    UITextFieldDidBeginEditingBlock block = [self.didBeginEditingBlock copy];
    block(textField);
    [block release];
}

-(void)textFieldDidEndEditing:(UITextField*)textField  {
    UITextFieldDidEndEditingBlock block = [self.didEndEditingBlock copy];
    block(textField);
    [block release];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField*)textField  {
    UITextFieldShouldBeginEditingBlock block = [self.shouldBeginEditingBlock copy];
    BOOL result = block(textField);
    [block release];
    return result;
}

-(BOOL)textFieldShouldClear:(UITextField*)textField  {
    UITextFieldShouldClearBlock block = [self.shouldClearBlock copy];
    BOOL result = block(textField);
    [block release];
    return result;
}

-(BOOL)textFieldShouldEndEditing:(UITextField*)textField  {
    UITextFieldShouldEndEditingBlock block = [self.shouldEndEditingBlock copy];
    BOOL result = block(textField);
    [block release];
    return result;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField  {
    UITextFieldShouldReturnBlock block = [self.shouldReturnBlock copy];
    BOOL result = block(textField);
    [block release];
    return result;
}


@end

