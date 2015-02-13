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

-(id)useBlocksForDelegate {
    UIScrollViewDelegateBlocks* delegate = [[[UIScrollViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIScrollViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidEndDecelerating:(UIScrollViewDidEndDeceleratingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndDeceleratingBlock:block];
}

-(void)onDidEndDragging:(UIScrollViewDidEndDraggingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndDraggingBlock:block];
}

-(void)onDidEndScrollingAnimation:(UIScrollViewDidEndScrollingAnimationBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndScrollingAnimationBlock:block];
}

-(void)onDidEndZooming:(UIScrollViewDidEndZoomingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidEndZoomingBlock:block];
}

-(void)onDidScroll:(UIScrollViewDidScrollBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidScrollBlock:block];
}

-(void)onDidScrollToTop:(UIScrollViewDidScrollToTopBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidScrollToTopBlock:block];
}

-(void)onDidZoom:(UIScrollViewDidZoomBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setDidZoomBlock:block];
}

-(void)onShouldScrollToTop:(UIScrollViewShouldScrollToTopBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setShouldScrollToTopBlock:block];
}

-(void)onWillBeginDecelerating:(UIScrollViewWillBeginDeceleratingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setWillBeginDeceleratingBlock:block];
}

-(void)onWillBeginDragging:(UIScrollViewWillBeginDraggingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setWillBeginDraggingBlock:block];
}

-(void)onWillBeginZooming:(UIScrollViewWillBeginZoomingBlock)block {
    [((UIScrollViewDelegateBlocks*)self.delegate) setWillBeginZoomingBlock:block];
}

-(void)onViewForZoomingInScrollView:(UIScrollViewViewForZoomingInScrollViewBlock)block {
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

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(scrollViewDidEndDecelerating:)) ) {
        return !!self.didEndDeceleratingBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewDidEndDragging:willDecelerate:)) ) {
        return !!self.didEndDraggingBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewDidEndScrollingAnimation:)) ) {
        return !!self.didEndScrollingAnimationBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewDidEndZooming:withView:atScale:)) ) {
        return !!self.didEndZoomingBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewDidScroll:)) ) {
        return !!self.didScrollBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewDidScrollToTop:)) ) {
        return !!self.didScrollToTopBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewDidZoom:)) ) {
        return !!self.didZoomBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewShouldScrollToTop:)) ) {
        return !!self.shouldScrollToTopBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewWillBeginDecelerating:)) ) {
        return !!self.willBeginDeceleratingBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewWillBeginDragging:)) ) {
        return !!self.willBeginDraggingBlock;
    } else if ( sel_isEqual(aSelector, @selector(scrollViewWillBeginZooming:withView:)) ) {
        return !!self.willBeginZoomingBlock;
    } else if ( sel_isEqual(aSelector, @selector(viewForZoomingInScrollView:)) ) {
        return !!self.viewForZoomingInScrollViewBlock;
    }
    return [super respondsToSelector:aSelector];
}

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

-(void)scrollViewDidEndZooming:(UIScrollView*)scrollView withView:(UIView*)view atScale:(CGFloat)scale  {
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

