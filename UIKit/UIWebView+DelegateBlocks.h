//
// protocolblocks: UIKit/UIWebView+DelegateBlocks.h
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

typedef void (^UIWebViewDidFailLoadWithErrorBlock)(UIWebView* webView, NSError* error);
typedef BOOL (^UIWebViewShouldStartLoadWithRequestBlock)(UIWebView* webView, NSURLRequest* request, UIWebViewNavigationType navigationType);
typedef void (^UIWebViewDidFinishLoadBlock)(UIWebView* webView);
typedef void (^UIWebViewDidStartLoadBlock)(UIWebView* webView);

@interface UIWebView (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onDidFailLoadWithError:(UIWebViewDidFailLoadWithErrorBlock)block;
-(void)onShouldStartLoadWithRequest:(UIWebViewShouldStartLoadWithRequestBlock)block;
-(void)onDidFinishLoad:(UIWebViewDidFinishLoadBlock)block;
-(void)onDidStartLoad:(UIWebViewDidStartLoadBlock)block;

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

