//
// ProtocolBlocks: UIKit/UIWebView+DelegateBlocks.m
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

#import "UIWebView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIWebViewDelegateBlocksKey = @"UIWebViewDelegateBlocksKey";

@implementation UIWebView (DelegateBlocks)

-(id)delegateblocks {
    UIWebViewDelegateBlocks* delegate = [[[UIWebViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIWebViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidFailLoadWithErrorBlock:(UIWebViewDidFailLoadWithErrorBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setDidFailLoadWithErrorBlock:block];
}

-(void)setShouldStartLoadWithRequestBlock:(UIWebViewShouldStartLoadWithRequestBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setShouldStartLoadWithRequestBlock:block];
}

-(void)setDidFinishLoadBlock:(UIWebViewDidFinishLoadBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setDidFinishLoadBlock:block];
}

-(void)setDidStartLoadBlock:(UIWebViewDidStartLoadBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setDidStartLoadBlock:block];
}

@end

@implementation UIWebViewDelegateBlocks

@synthesize didFailLoadWithErrorBlock = _didFailLoadWithErrorBlock;
@synthesize shouldStartLoadWithRequestBlock = _shouldStartLoadWithRequestBlock;
@synthesize didFinishLoadBlock = _didFinishLoadBlock;
@synthesize didStartLoadBlock = _didStartLoadBlock;

-(void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error  {
    UIWebViewDidFailLoadWithErrorBlock block = [self.didFailLoadWithErrorBlock copy];
    block(webView, error);
    [block release];
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType  {
    UIWebViewShouldStartLoadWithRequestBlock block = [self.shouldStartLoadWithRequestBlock copy];
    BOOL result = block(webView, request, navigationType);
    [block release];
    return result;
}

-(void)webViewDidFinishLoad:(UIWebView*)webView  {
    UIWebViewDidFinishLoadBlock block = [self.didFinishLoadBlock copy];
    block(webView);
    [block release];
}

-(void)webViewDidStartLoad:(UIWebView*)webView  {
    UIWebViewDidStartLoadBlock block = [self.didStartLoadBlock copy];
    block(webView);
    [block release];
}


@end

