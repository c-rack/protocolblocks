//
// ProtocolBlocks: UIKit/UIScrollView+DelegateBlocks.h
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

typedef void (^UIScrollViewDidEndDeceleratingBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidEndDraggingBlock)(UIScrollView* scrollView, BOOL decelerate);
typedef void (^UIScrollViewDidEndScrollingAnimationBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidEndZoomingBlock)(UIScrollView* scrollView, UIView* view, float scale);
typedef void (^UIScrollViewDidScrollBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidScrollToTopBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidZoomBlock)(UIScrollView* scrollView);
typedef BOOL (^UIScrollViewShouldScrollToTopBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewWillBeginDeceleratingBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewWillBeginDraggingBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewWillBeginZoomingBlock)(UIScrollView* scrollView, UIView* view);
typedef UIView* (^UIScrollViewViewForZoomingInScrollViewBlock)(UIScrollView* scrollView);

@interface UIScrollView (DelegateBlocks)

-(id)delegateblocks;
-(void)setDidEndDeceleratingBlock:(UIScrollViewDidEndDeceleratingBlock)block;
-(void)setDidEndDraggingBlock:(UIScrollViewDidEndDraggingBlock)block;
-(void)setDidEndScrollingAnimationBlock:(UIScrollViewDidEndScrollingAnimationBlock)block;
-(void)setDidEndZoomingBlock:(UIScrollViewDidEndZoomingBlock)block;
-(void)setDidScrollBlock:(UIScrollViewDidScrollBlock)block;
-(void)setDidScrollToTopBlock:(UIScrollViewDidScrollToTopBlock)block;
-(void)setDidZoomBlock:(UIScrollViewDidZoomBlock)block;
-(void)setShouldScrollToTopBlock:(UIScrollViewShouldScrollToTopBlock)block;
-(void)setWillBeginDeceleratingBlock:(UIScrollViewWillBeginDeceleratingBlock)block;
-(void)setWillBeginDraggingBlock:(UIScrollViewWillBeginDraggingBlock)block;
-(void)setWillBeginZoomingBlock:(UIScrollViewWillBeginZoomingBlock)block;
-(void)setViewForZoomingInScrollViewBlock:(UIScrollViewViewForZoomingInScrollViewBlock)block;

@end

@interface UIScrollViewDelegateBlocks : NSObject <UIScrollViewDelegate> {
    UIScrollViewDidEndDeceleratingBlock _didEndDeceleratingBlock;
    UIScrollViewDidEndDraggingBlock _didEndDraggingBlock;
    UIScrollViewDidEndScrollingAnimationBlock _didEndScrollingAnimationBlock;
    UIScrollViewDidEndZoomingBlock _didEndZoomingBlock;
    UIScrollViewDidScrollBlock _didScrollBlock;
    UIScrollViewDidScrollToTopBlock _didScrollToTopBlock;
    UIScrollViewDidZoomBlock _didZoomBlock;
    UIScrollViewShouldScrollToTopBlock _shouldScrollToTopBlock;
    UIScrollViewWillBeginDeceleratingBlock _willBeginDeceleratingBlock;
    UIScrollViewWillBeginDraggingBlock _willBeginDraggingBlock;
    UIScrollViewWillBeginZoomingBlock _willBeginZoomingBlock;
    UIScrollViewViewForZoomingInScrollViewBlock _viewForZoomingInScrollViewBlock;
}

@property(nonatomic, copy) UIScrollViewDidEndDeceleratingBlock didEndDeceleratingBlock;
@property(nonatomic, copy) UIScrollViewDidEndDraggingBlock didEndDraggingBlock;
@property(nonatomic, copy) UIScrollViewDidEndScrollingAnimationBlock didEndScrollingAnimationBlock;
@property(nonatomic, copy) UIScrollViewDidEndZoomingBlock didEndZoomingBlock;
@property(nonatomic, copy) UIScrollViewDidScrollBlock didScrollBlock;
@property(nonatomic, copy) UIScrollViewDidScrollToTopBlock didScrollToTopBlock;
@property(nonatomic, copy) UIScrollViewDidZoomBlock didZoomBlock;
@property(nonatomic, copy) UIScrollViewShouldScrollToTopBlock shouldScrollToTopBlock;
@property(nonatomic, copy) UIScrollViewWillBeginDeceleratingBlock willBeginDeceleratingBlock;
@property(nonatomic, copy) UIScrollViewWillBeginDraggingBlock willBeginDraggingBlock;
@property(nonatomic, copy) UIScrollViewWillBeginZoomingBlock willBeginZoomingBlock;
@property(nonatomic, copy) UIScrollViewViewForZoomingInScrollViewBlock viewForZoomingInScrollViewBlock;

@end

