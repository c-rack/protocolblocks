//
// protocolblocks: UIKit/UIWebView+DelegateBlocks.m
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

#import "UIWebView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIWebViewDelegateBlocksKey = @"UIWebViewDelegateBlocksKey";

@implementation UIWebView (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIWebViewDelegateBlocks* delegate = [[[UIWebViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIWebViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidFailLoadWithError:(UIWebViewDidFailLoadWithErrorBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setDidFailLoadWithErrorBlock:block];
}

-(void)onShouldStartLoadWithRequest:(UIWebViewShouldStartLoadWithRequestBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setShouldStartLoadWithRequestBlock:block];
}

-(void)onDidFinishLoad:(UIWebViewDidFinishLoadBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setDidFinishLoadBlock:block];
}

-(void)onDidStartLoad:(UIWebViewDidStartLoadBlock)block {
    [((UIWebViewDelegateBlocks*)self.delegate) setDidStartLoadBlock:block];
}

@end

@implementation UIWebViewDelegateBlocks

@synthesize didFailLoadWithErrorBlock = _didFailLoadWithErrorBlock;
@synthesize shouldStartLoadWithRequestBlock = _shouldStartLoadWithRequestBlock;
@synthesize didFinishLoadBlock = _didFinishLoadBlock;
@synthesize didStartLoadBlock = _didStartLoadBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(webView:didFailLoadWithError:)) ) {
        return !!self.didFailLoadWithErrorBlock;
    } else if ( sel_isEqual(aSelector, @selector(webView:shouldStartLoadWithRequest:navigationType:)) ) {
        return !!self.shouldStartLoadWithRequestBlock;
    } else if ( sel_isEqual(aSelector, @selector(webViewDidFinishLoad:)) ) {
        return !!self.didFinishLoadBlock;
    } else if ( sel_isEqual(aSelector, @selector(webViewDidStartLoad:)) ) {
        return !!self.didStartLoadBlock;
    }
    return [super respondsToSelector:aSelector];
}

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

