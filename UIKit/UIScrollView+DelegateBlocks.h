//
// protocolblocks: UIKit/UIScrollView+DelegateBlocks.h
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

typedef void (^UIScrollViewDidEndDeceleratingBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidEndDraggingBlock)(UIScrollView* scrollView, BOOL decelerate);
typedef void (^UIScrollViewDidEndScrollingAnimationBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidEndZoomingBlock)(UIScrollView* scrollView, UIView* view, CGFloat scale);
typedef void (^UIScrollViewDidScrollBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidScrollToTopBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewDidZoomBlock)(UIScrollView* scrollView);
typedef BOOL (^UIScrollViewShouldScrollToTopBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewWillBeginDeceleratingBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewWillBeginDraggingBlock)(UIScrollView* scrollView);
typedef void (^UIScrollViewWillBeginZoomingBlock)(UIScrollView* scrollView, UIView* view);
typedef UIView* (^UIScrollViewViewForZoomingInScrollViewBlock)(UIScrollView* scrollView);

@interface UIScrollView (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onDidEndDecelerating:(UIScrollViewDidEndDeceleratingBlock)block;
-(void)onDidEndDragging:(UIScrollViewDidEndDraggingBlock)block;
-(void)onDidEndScrollingAnimation:(UIScrollViewDidEndScrollingAnimationBlock)block;
-(void)onDidEndZooming:(UIScrollViewDidEndZoomingBlock)block;
-(void)onDidScroll:(UIScrollViewDidScrollBlock)block;
-(void)onDidScrollToTop:(UIScrollViewDidScrollToTopBlock)block;
-(void)onDidZoom:(UIScrollViewDidZoomBlock)block;
-(void)onShouldScrollToTop:(UIScrollViewShouldScrollToTopBlock)block;
-(void)onWillBeginDecelerating:(UIScrollViewWillBeginDeceleratingBlock)block;
-(void)onWillBeginDragging:(UIScrollViewWillBeginDraggingBlock)block;
-(void)onWillBeginZooming:(UIScrollViewWillBeginZoomingBlock)block;
-(void)onViewForZoomingInScrollView:(UIScrollViewViewForZoomingInScrollViewBlock)block;

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

