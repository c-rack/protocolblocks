//
// ProtocolBlocks: UIKit/UITextView+DelegateBlocks.m
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

#import "UITextView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITextViewDelegateBlocksKey = @"UITextViewDelegateBlocksKey";

@implementation UITextView (DelegateBlocks)

-(id)delegateblocks {
    UITextViewDelegateBlocks* delegate = [[[UITextViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITextViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setShouldChangeTextInRangeBlock:(UITextViewShouldChangeTextInRangeBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setShouldChangeTextInRangeBlock:block];
}

-(void)setDidBeginEditingBlock:(UITextViewDidBeginEditingBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidBeginEditingBlock:block];
}

-(void)setDidChangeBlock:(UITextViewDidChangeBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidChangeBlock:block];
}

-(void)setDidChangeSelectionBlock:(UITextViewDidChangeSelectionBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidChangeSelectionBlock:block];
}

-(void)setDidEndEditingBlock:(UITextViewDidEndEditingBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidEndEditingBlock:block];
}

-(void)setShouldBeginEditingBlock:(UITextViewShouldBeginEditingBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setShouldBeginEditingBlock:block];
}

-(void)setShouldEndEditingBlock:(UITextViewShouldEndEditingBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setShouldEndEditingBlock:block];
}

@end

@implementation UITextViewDelegateBlocks

@synthesize shouldChangeTextInRangeBlock = _shouldChangeTextInRangeBlock;
@synthesize didBeginEditingBlock = _didBeginEditingBlock;
@synthesize didChangeBlock = _didChangeBlock;
@synthesize didChangeSelectionBlock = _didChangeSelectionBlock;
@synthesize didEndEditingBlock = _didEndEditingBlock;
@synthesize shouldBeginEditingBlock = _shouldBeginEditingBlock;
@synthesize shouldEndEditingBlock = _shouldEndEditingBlock;

-(BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text  {
    UITextViewShouldChangeTextInRangeBlock block = [self.shouldChangeTextInRangeBlock copy];
    BOOL result = block(textView, range, text);
    [block release];
    return result;
}

-(void)textViewDidBeginEditing:(UITextView*)textView  {
    UITextViewDidBeginEditingBlock block = [self.didBeginEditingBlock copy];
    block(textView);
    [block release];
}

-(void)textViewDidChange:(UITextView*)textView  {
    UITextViewDidChangeBlock block = [self.didChangeBlock copy];
    block(textView);
    [block release];
}

-(void)textViewDidChangeSelection:(UITextView*)textView  {
    UITextViewDidChangeSelectionBlock block = [self.didChangeSelectionBlock copy];
    block(textView);
    [block release];
}

-(void)textViewDidEndEditing:(UITextView*)textView  {
    UITextViewDidEndEditingBlock block = [self.didEndEditingBlock copy];
    block(textView);
    [block release];
}

-(BOOL)textViewShouldBeginEditing:(UITextView*)textView  {
    UITextViewShouldBeginEditingBlock block = [self.shouldBeginEditingBlock copy];
    BOOL result = block(textView);
    [block release];
    return result;
}

-(BOOL)textViewShouldEndEditing:(UITextView*)textView  {
    UITextViewShouldEndEditingBlock block = [self.shouldEndEditingBlock copy];
    BOOL result = block(textView);
    [block release];
    return result;
}


@end

