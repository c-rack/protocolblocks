//
// protocolblocks: UIKit/UIScrollView+DelegateBlocks.m
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

#import "UIScrollView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIScrollViewDelegateBlocksKey = @"UIScrollViewDelegateBlocksKey";

@implementation UIScrollView (DelegateBlocks)

-(id)delegateblocks {
    UIScrollViewDelegateBlocks* delegate = [[[UIScrollViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIScrollViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidEndDeceleratingBlock:(UIScrollViewDidEndDeceleratingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndDeceleratingBlock:block];
}

-(void)setDidEndDraggingBlock:(UIScrollViewDidEndDraggingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndDraggingBlock:block];
}

-(void)setDidEndScrollingAnimationBlock:(UIScrollViewDidEndScrollingAnimationBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndScrollingAnimationBlock:block];
}

-(void)setDidEndZoomingBlock:(UIScrollViewDidEndZoomingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndZoomingBlock:block];
}

-(void)setDidScrollBlock:(UIScrollViewDidScrollBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidScrollBlock:block];
}

-(void)setDidScrollToTopBlock:(UIScrollViewDidScrollToTopBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidScrollToTopBlock:block];
}

-(void)setDidZoomBlock:(UIScrollViewDidZoomBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidZoomBlock:block];
}

-(void)setShouldScrollToTopBlock:(UIScrollViewShouldScrollToTopBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setShouldScrollToTopBlock:block];
}

-(void)setWillBeginDeceleratingBlock:(UIScrollViewWillBeginDeceleratingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setWillBeginDeceleratingBlock:block];
}

-(void)setWillBeginDraggingBlock:(UIScrollViewWillBeginDraggingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setWillBeginDraggingBlock:block];
}

-(void)setWillBeginZoomingBlock:(UIScrollViewWillBeginZoomingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setWillBeginZoomingBlock:block];
}

-(void)setViewForZoomingInScrollViewBlock:(UIScrollViewViewForZoomingInScrollViewBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setViewForZoomingInScrollViewBlock:block];
}

@end

@implementation UIScrollViewDelegateBlocks

@synthesize didEndDeceleratingBlock = _didEndDeceleratingBlock;
@synthesize didEndDraggingBlock = _didEndDraggingBlock;
@synthesize didEndScrollingAnimationBlock = _didEndScrollingAnimationBlock;
@synthesize didEndZoomingBlock = _didEndZoomingBlock;
@synthesize didScrollBlock = _didScrollBlock;
@synthesize didScrollToTopBlock = _didScrollToTopBlock;
@synthesize didZoomBlock = _didZoomBlock;
@synthesize shouldScrollToTopBlock = _shouldScrollToTopBlock;
@synthesize willBeginDeceleratingBlock = _willBeginDeceleratingBlock;
@synthesize willBeginDraggingBlock = _willBeginDraggingBlock;
@synthesize willBeginZoomingBlock = _willBeginZoomingBlock;
@synthesize viewForZoomingInScrollViewBlock = _viewForZoomingInScrollViewBlock;

-(void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView  {
    UIScrollViewDidEndDeceleratingBlock block = [self.didEndDeceleratingBlock copy];
    block(scrollView);
    [block release];
}

-(void)scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate  {
    UIScrollViewDidEndDraggingBlock block = [self.didEndDraggingBlock copy];
    block(scrollView, decelerate);
    [block release];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView*)scrollView  {
    UIScrollViewDidEndScrollingAnimationBlock block = [self.didEndScrollingAnimationBlock copy];
    block(scrollView);
    [block release];
}

-(void)scrollViewDidEndZooming:(UIScrollView*)scrollView withView:(UIView*)view atScale:(float)scale  {
    UIScrollViewDidEndZoomingBlock block = [self.didEndZoomingBlock copy];
    block(scrollView, view, scale);
    [block release];
}

-(void)scrollViewDidScroll:(UIScrollView*)scrollView  {
    UIScrollViewDidScrollBlock block = [self.didScrollBlock copy];
    block(scrollView);
    [block release];
}

-(void)scrollViewDidScrollToTop:(UIScrollView*)scrollView  {
    UIScrollViewDidScrollToTopBlock block = [self.didScrollToTopBlock copy];
    block(scrollView);
    [block release];
}

-(void)scrollViewDidZoom:(UIScrollView*)scrollView  {
    UIScrollViewDidZoomBlock block = [self.didZoomBlock copy];
    block(scrollView);
    [block release];
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView*)scrollView  {
    UIScrollViewShouldScrollToTopBlock block = [self.shouldScrollToTopBlock copy];
    BOOL result = block(scrollView);
    [block release];
    return result;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView*)scrollView  {
    UIScrollViewWillBeginDeceleratingBlock block = [self.willBeginDeceleratingBlock copy];
    block(scrollView);
    [block release];
}

-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView  {
    UIScrollViewWillBeginDraggingBlock block = [self.willBeginDraggingBlock copy];
    block(scrollView);
    [block release];
}

-(void)scrollViewWillBeginZooming:(UIScrollView*)scrollView withView:(UIView*)view  {
    UIScrollViewWillBeginZoomingBlock block = [self.willBeginZoomingBlock copy];
    block(scrollView, view);
    [block release];
}

-(UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView  {
    UIScrollViewViewForZoomingInScrollViewBlock block = [self.viewForZoomingInScrollViewBlock copy];
    UIView* result = block(scrollView);
    [block release];
    return result;
}

@end

