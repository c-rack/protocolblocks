//
// protocolblocks: iAd/ADBannerView+DelegateBlocks.m
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

#import "ADBannerView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* ADBannerViewDelegateBlocksKey = @"ADBannerViewDelegateBlocksKey";

@implementation ADBannerView (DelegateBlocks)

-(id)useBlocksForDelegate {
    ADBannerViewDelegateBlocks* delegate = [[[ADBannerViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &ADBannerViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidFailToReceiveAdWithError:(ADBannerViewDidFailToReceiveAdWithErrorBlock)block {
    [((ADBannerViewDelegateBlocks*)self.delegate) setDidFailToReceiveAdWithErrorBlock:block];
}

-(void)onActionDidFinish:(ADBannerViewActionDidFinishBlock)block {
    [((ADBannerViewDelegateBlocks*)self.delegate) setActionDidFinishBlock:block];
}

-(void)onActionShouldBegin:(ADBannerViewActionShouldBeginBlock)block {
    [((ADBannerViewDelegateBlocks*)self.delegate) setActionShouldBeginBlock:block];
}

-(void)onBannerViewDidLoadAd:(ADBannerViewBannerViewDidLoadAdBlock)block {
    [((ADBannerViewDelegateBlocks*)self.delegate) setBannerViewDidLoadAdBlock:block];
}

@end

@implementation ADBannerViewDelegateBlocks

@synthesize didFailToReceiveAdWithErrorBlock = _didFailToReceiveAdWithErrorBlock;
@synthesize actionDidFinishBlock = _actionDidFinishBlock;
@synthesize actionShouldBeginBlock = _actionShouldBeginBlock;
@synthesize bannerViewDidLoadAdBlock = _bannerViewDidLoadAdBlock;

-(void)bannerView:(ADBannerView*)banner didFailToReceiveAdWithError:(NSError*)error  {
    ADBannerViewDidFailToReceiveAdWithErrorBlock block = [self.didFailToReceiveAdWithErrorBlock copy];
    block(banner, error);
    [block release];
}

-(void)bannerViewActionDidFinish:(ADBannerView*)banner  {
    ADBannerViewActionDidFinishBlock block = [self.actionDidFinishBlock copy];
    block(banner);
    [block release];
}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView*)banner willLeaveApplication:(BOOL)willLeave  {
    ADBannerViewActionShouldBeginBlock block = [self.actionShouldBeginBlock copy];
    BOOL result = block(banner, willLeave);
    [block release];
    return result;
}

-(void)bannerViewActionShouldBegin:(ADBannerView*)banner  {
    ADBannerViewBannerViewDidLoadAdBlock block = [self.bannerViewDidLoadAdBlock copy];
    block(banner);
    [block release];
}

@end

