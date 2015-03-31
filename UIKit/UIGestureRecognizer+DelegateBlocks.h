//
// protocolblocks: UIKit/UIGestureRecognizer+DelegateBlocks.h
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

typedef BOOL (^UIGestureRecognizerShouldReceiveTouchBlock)(UIGestureRecognizer* gestureRecognizer, UITouch* touch);
typedef BOOL (^UIGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizerBlock)(UIGestureRecognizer* gestureRecognizer, UIGestureRecognizer* otherGestureRecognizer);
typedef BOOL (^UIGestureRecognizerShouldBeginBlock)(UIGestureRecognizer* gestureRecognizer);

@interface UIGestureRecognizer (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onShouldReceiveTouch:(UIGestureRecognizerShouldReceiveTouchBlock)block;
-(void)onShouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizerBlock)block;
-(void)onShouldBegin:(UIGestureRecognizerShouldBeginBlock)block;

@end

@interface UIGestureRecognizerDelegateBlocks : NSObject <UIGestureRecognizerDelegate> {
    UIGestureRecognizerShouldReceiveTouchBlock _shouldReceiveTouchBlock;
    UIGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizerBlock _shouldRecognizeSimultaneouslyWithGestureRecognizerBlock;
    UIGestureRecognizerShouldBeginBlock _shouldBeginBlock;
}

@property(nonatomic, copy) UIGestureRecognizerShouldReceiveTouchBlock shouldReceiveTouchBlock;
@property(nonatomic, copy) UIGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizerBlock shouldRecognizeSimultaneouslyWithGestureRecognizerBlock;
@property(nonatomic, copy) UIGestureRecognizerShouldBeginBlock shouldBeginBlock;

@end

