//
// ProtocolBlocks: UIKit/UIScrollView+DelegateBlocks.m
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

