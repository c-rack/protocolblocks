//
// ProtocolBlocks: UIKit/UIWebView+DelegateBlocks.h
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

typedef void (^UIWebViewDidFailLoadWithErrorBlock)(UIWebView* webView, NSError* error);
typedef BOOL (^UIWebViewShouldStartLoadWithRequestBlock)(UIWebView* webView, NSURLRequest* request, UIWebViewNavigationType navigationType);
typedef void (^UIWebViewDidFinishLoadBlock)(UIWebView* webView);
typedef void (^UIWebViewDidStartLoadBlock)(UIWebView* webView);

@interface UIWebView (DelegateBlocks)

-(id)delegateblocks;
-(void)setDidFailLoadWithErrorBlock:(UIWebViewDidFailLoadWithErrorBlock)block;
-(void)setShouldStartLoadWithRequestBlock:(UIWebViewShouldStartLoadWithRequestBlock)block;
-(void)setDidFinishLoadBlock:(UIWebViewDidFinishLoadBlock)block;
-(void)setDidStartLoadBlock:(UIWebViewDidStartLoadBlock)block;

@end

@interface UIWebViewDelegateBlocks : NSObject <UIWebViewDelegate> {
    UIWebViewDidFailLoadWithErrorBlock _didFailLoadWithErrorBlock;
    UIWebViewShouldStartLoadWithRequestBlock _shouldStartLoadWithRequestBlock;
    UIWebViewDidFinishLoadBlock _didFinishLoadBlock;
    UIWebViewDidStartLoadBlock _didStartLoadBlock;
}

@property(nonatomic, copy) UIWebViewDidFailLoadWithErrorBlock didFailLoadWithErrorBlock;
@property(nonatomic, copy) UIWebViewShouldStartLoadWithRequestBlock shouldStartLoadWithRequestBlock;
@property(nonatomic, copy) UIWebViewDidFinishLoadBlock didFinishLoadBlock;
@property(nonatomic, copy) UIWebViewDidStartLoadBlock didStartLoadBlock;

@end

