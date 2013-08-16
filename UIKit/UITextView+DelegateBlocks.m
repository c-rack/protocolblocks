//
// protocolblocks: UIKit/UITextView+DelegateBlocks.m
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

#import "UITextView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITextViewDelegateBlocksKey = @"UITextViewDelegateBlocksKey";

@implementation UITextView (DelegateBlocks)

-(id)useBlocksForDelegate {
    UITextViewDelegateBlocks* delegate = [[[UITextViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITextViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onShouldChangeTextInRange:(UITextViewShouldChangeTextInRangeBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setShouldChangeTextInRangeBlock:block];
}

-(void)onDidBeginEditing:(UITextViewDidBeginEditingBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidBeginEditingBlock:block];
}

-(void)onDidChange:(UITextViewDidChangeBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidChangeBlock:block];
}

-(void)onDidChangeSelection:(UITextViewDidChangeSelectionBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidChangeSelectionBlock:block];
}

-(void)onDidEndEditing:(UITextViewDidEndEditingBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setDidEndEditingBlock:block];
}

-(void)onShouldBeginEditing:(UITextViewShouldBeginEditingBlock)block {
    [((UITextViewDelegateBlocks*)self.delegate) setShouldBeginEditingBlock:block];
}

-(void)onShouldEndEditing:(UITextViewShouldEndEditingBlock)block {
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

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( aSelector == @selector(textView:shouldChangeTextInRange:replacementText:) ) {
        return !!self.shouldChangeTextInRangeBlock;
    } else if ( aSelector == @selector(textViewDidBeginEditing:) ) {
        return !!self.shouldChangeTextInRangeBlock;
    } else if ( aSelector == @selector(textViewDidChange:) ) {
        return !!self.didChangeBlock;
    } else if ( aSelector == @selector(textViewDidChangeSelection:) ) {
        return !!self.didChangeSelectionBlock;
    } else if ( aSelector == @selector(textViewDidEndEditing:) ) {
        return !!self.didEndEditingBlock;
    } else if ( aSelector == @selector(textViewShouldBeginEditing:) ) {
        return !!self.shouldBeginEditingBlock;
    } else if ( aSelector == @selector(textViewShouldEndEditing:) ) {
        return !!self.shouldEndEditingBlock;
    }
    return [super respondsToSelector:aSelector];
}

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

