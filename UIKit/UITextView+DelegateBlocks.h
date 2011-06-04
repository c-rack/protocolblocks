//
// protocolblocks: UIKit/UITextView+DelegateBlocks.h
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

typedef BOOL (^UITextViewShouldChangeTextInRangeBlock)(UITextView* textView, NSRange range, NSString * text);
typedef void (^UITextViewDidBeginEditingBlock)(UITextView* textView);
typedef void (^UITextViewDidChangeBlock)(UITextView* textView);
typedef void (^UITextViewDidChangeSelectionBlock)(UITextView* textView);
typedef void (^UITextViewDidEndEditingBlock)(UITextView* textView);
typedef BOOL (^UITextViewShouldBeginEditingBlock)(UITextView* textView);
typedef BOOL (^UITextViewShouldEndEditingBlock)(UITextView* textView);

@interface UITextView (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onShouldChangeTextInRange:(UITextViewShouldChangeTextInRangeBlock)block;
-(void)onDidBeginEditing:(UITextViewDidBeginEditingBlock)block;
-(void)onDidChange:(UITextViewDidChangeBlock)block;
-(void)onDidChangeSelection:(UITextViewDidChangeSelectionBlock)block;
-(void)onDidEndEditing:(UITextViewDidEndEditingBlock)block;
-(void)onShouldBeginEditing:(UITextViewShouldBeginEditingBlock)block;
-(void)onShouldEndEditing:(UITextViewShouldEndEditingBlock)block;

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

