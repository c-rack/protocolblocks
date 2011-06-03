//
// ProtocolBlocks: UIKit/UITextView+DelegateBlocks.h
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

typedef BOOL (^UITextViewShouldChangeTextInRangeBlock)(UITextView* textView, NSRange range, NSString * text);
typedef void (^UITextViewDidBeginEditingBlock)(UITextView* textView);
typedef void (^UITextViewDidChangeBlock)(UITextView* textView);
typedef void (^UITextViewDidChangeSelectionBlock)(UITextView* textView);
typedef void (^UITextViewDidEndEditingBlock)(UITextView* textView);
typedef BOOL (^UITextViewShouldBeginEditingBlock)(UITextView* textView);
typedef BOOL (^UITextViewShouldEndEditingBlock)(UITextView* textView);

@interface UITextView (DelegateBlocks)

-(id)delegateblocks;
-(void)setShouldChangeTextInRangeBlock:(UITextViewShouldChangeTextInRangeBlock)block;
-(void)setDidBeginEditingBlock:(UITextViewDidBeginEditingBlock)block;
-(void)setDidChangeBlock:(UITextViewDidChangeBlock)block;
-(void)setDidChangeSelectionBlock:(UITextViewDidChangeSelectionBlock)block;
-(void)setDidEndEditingBlock:(UITextViewDidEndEditingBlock)block;
-(void)setShouldBeginEditingBlock:(UITextViewShouldBeginEditingBlock)block;
-(void)setShouldEndEditingBlock:(UITextViewShouldEndEditingBlock)block;

@end

@interface UITextViewDelegateBlocks : NSObject <UITextViewDelegate> {
    UITextViewShouldChangeTextInRangeBlock _shouldChangeTextInRangeBlock;
    UITextViewDidBeginEditingBlock _didBeginEditingBlock;
    UITextViewDidChangeBlock _didChangeBlock;
    UITextViewDidChangeSelectionBlock _didChangeSelectionBlock;
    UITextViewDidEndEditingBlock _didEndEditingBlock;
    UITextViewShouldBeginEditingBlock _shouldBeginEditingBlock;
    UITextViewShouldEndEditingBlock _shouldEndEditingBlock;
}

@property(nonatomic, copy) UITextViewShouldChangeTextInRangeBlock shouldChangeTextInRangeBlock;
@property(nonatomic, copy) UITextViewDidBeginEditingBlock didBeginEditingBlock;
@property(nonatomic, copy) UITextViewDidChangeBlock didChangeBlock;
@property(nonatomic, copy) UITextViewDidChangeSelectionBlock didChangeSelectionBlock;
@property(nonatomic, copy) UITextViewDidEndEditingBlock didEndEditingBlock;
@property(nonatomic, copy) UITextViewShouldBeginEditingBlock shouldBeginEditingBlock;
@property(nonatomic, copy) UITextViewShouldEndEditingBlock shouldEndEditingBlock;

@end

