//
// protocolblocks: iAd/ADBannerView+DelegateBlocks.h
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

typedef void (^ADBannerViewDidFailToReceiveAdWithErrorBlock)(ADBannerView* banner, NSError* error);
typedef void (^ADBannerViewActionDidFinishBlock)(ADBannerView* banner);
typedef BOOL (^ADBannerViewActionShouldBeginBlock)(ADBannerView* banner, BOOL willLeave);
typedef void (^ADBannerViewBannerViewDidLoadAdBlock)(ADBannerView* banner);

@interface ADBannerView (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onDidFailToReceiveAdWithError:(ADBannerViewDidFailToReceiveAdWithErrorBlock)block;
-(void)onActionDidFinish:(ADBannerViewActionDidFinishBlock)block;
-(void)onActionShouldBegin:(ADBannerViewActionShouldBeginBlock)block;
-(void)onBannerViewDidLoadAd:(ADBannerViewBannerViewDidLoadAdBlock)block;

@end

@interface ADBannerViewDelegateBlocks : NSObject <ADBannerViewDelegate> {
    ADBannerViewDidFailToReceiveAdWithErrorBlock _didFailToReceiveAdWithErrorBlock;
    ADBannerViewActionDidFinishBlock _actionDidFinishBlock;
    ADBannerViewActionShouldBeginBlock _actionShouldBeginBlock;
    ADBannerViewBannerViewDidLoadAdBlock _bannerViewDidLoadAdBlock;
}

@property(nonatomic, copy) ADBannerViewDidFailToReceiveAdWithErrorBlock didFailToReceiveAdWithErrorBlock;
@property(nonatomic, copy) ADBannerViewActionDidFinishBlock actionDidFinishBlock;
@property(nonatomic, copy) ADBannerViewActionShouldBeginBlock actionShouldBeginBlock;
@property(nonatomic, copy) ADBannerViewBannerViewDidLoadAdBlock bannerViewDidLoadAdBlock;

@end

