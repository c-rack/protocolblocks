//
// protocolblocks: iAd/ADInterstitialAd+DelegateBlocks.m
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

#import "ADInterstitialAd+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* ADInterstitialAdDelegateBlocksKey = @"ADInterstitialAdDelegateBlocksKey";

@implementation ADInterstitialAd (DelegateBlocks)

-(id)useBlocksForDelegate {
    ADInterstitialAdDelegateBlocks* delegate = [[[ADInterstitialAdDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &ADInterstitialAdDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidFailWithError:(ADInterstitialAdDidFailWithErrorBlock)block {
    [((ADInterstitialAdDelegateBlocks*)self.delegate) setDidFailWithErrorBlock:block];
}

-(void)onActionDidFinish:(ADInterstitialAdActionDidFinishBlock)block {
    [((ADInterstitialAdDelegateBlocks*)self.delegate) setActionDidFinishBlock:block];
}

-(void)onDidLoad:(ADInterstitialAdDidLoadBlock)block {
    [((ADInterstitialAdDelegateBlocks*)self.delegate) setDidLoadBlock:block];
}

-(void)onDidUnload:(ADInterstitialAdDidUnloadBlock)block {
    [((ADInterstitialAdDelegateBlocks*)self.delegate) setDidUnloadBlock:block];
}

@end

@implementation ADInterstitialAdDelegateBlocks

@synthesize didFailWithErrorBlock = _didFailWithErrorBlock;
@synthesize actionDidFinishBlock = _actionDidFinishBlock;
@synthesize didLoadBlock = _didLoadBlock;
@synthesize didUnloadBlock = _didUnloadBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( aSelector == @selector(interstitialAd:didFailWithError:) ) {
        return !!self.didFailWithErrorBlock;
    } if ( aSelector == @selector(interstitialAdActionDidFinish:) ) {
        return !!self.actionDidFinishBlock;
    } if ( aSelector == @selector(interstitialAdDidLoad:) ) {
        return !!self.didLoadBlock;
    } if ( aSelector == @selector(interstitialAdDidUnload:) ) {
        return !!self.didUnloadBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)interstitialAd:(ADInterstitialAd*)interstitialAd didFailWithError:(NSError*)error  {
    ADInterstitialAdDidFailWithErrorBlock block = [self.didFailWithErrorBlock copy];
    block(interstitialAd, error);
    [block release];
}

-(void)interstitialAdActionDidFinish:(ADInterstitialAd*)interstitialAd  {
    ADInterstitialAdActionDidFinishBlock block = [self.actionDidFinishBlock copy];
    block(interstitialAd);
    [block release];
}

-(void)interstitialAdDidLoad:(ADInterstitialAd*)interstitialAd  {
    ADInterstitialAdDidLoadBlock block = [self.didLoadBlock copy];
    block(interstitialAd);
    [block release];
}

-(void)interstitialAdDidUnload:(ADInterstitialAd*)interstitialAd  {
    ADInterstitialAdDidUnloadBlock block = [self.didUnloadBlock copy];
    block(interstitialAd);
    [block release];
}

@end

