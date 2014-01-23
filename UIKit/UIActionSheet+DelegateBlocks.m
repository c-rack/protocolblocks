//
// protocolblocks: UIKit/UIActionSheet+DelegateBlocks.m
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

#import "UIActionSheet+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIActionSheetDelegateBlocksKey = @"UIActionSheetDelegateBlocksKey";

@implementation UIActionSheet (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIActionSheetDelegateBlocks* delegate = [[[UIActionSheetDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIActionSheetDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onClickedButtonAtIndex:(UIActionSheetClickedButtonAtIndexBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setClickedButtonAtIndexBlock:block];
}

-(void)onDidDismissWithButtonIndex:(UIActionSheetDidDismissWithButtonIndexBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setDidDismissWithButtonIndexBlock:block];
}

-(void)onWillDismissWithButtonIndex:(UIActionSheetWillDismissWithButtonIndexBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setWillDismissWithButtonIndexBlock:block];
}

-(void)onCancel:(UIActionSheetCancelBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setCancelBlock:block];
}

-(void)onDidPresentActionSheet:(UIActionSheetDidPresentActionSheetBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setDidPresentActionSheetBlock:block];
}

-(void)onWillPresentActionSheet:(UIActionSheetWillPresentActionSheetBlock)block {
    [((UIActionSheetDelegateBlocks*)self.delegate) setWillPresentActionSheetBlock:block];
}

@end

@implementation UIActionSheetDelegateBlocks

@synthesize clickedButtonAtIndexBlock = _clickedButtonAtIndexBlock;
@synthesize didDismissWithButtonIndexBlock = _didDismissWithButtonIndexBlock;
@synthesize willDismissWithButtonIndexBlock = _willDismissWithButtonIndexBlock;
@synthesize cancelBlock = _cancelBlock;
@synthesize didPresentActionSheetBlock = _didPresentActionSheetBlock;
@synthesize willPresentActionSheetBlock = _willPresentActionSheetBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(actionSheet:willDismissWithButtonIndex:)) ) {
        return !!self.clickedButtonAtIndexBlock;
    } else if ( sel_isEqual(aSelector, @selector(actionSheet:willDismissWithButtonIndex:)) ) {
        return !!self.didDismissWithButtonIndexBlock;
    } else if ( sel_isEqual(aSelector, @selector(actionSheet:willDismissWithButtonIndex:)) ) {
        return !!self.willDismissWithButtonIndexBlock;
    } else if ( sel_isEqual(aSelector, @selector(actionSheetCancel:)) ) {
        return !!self.cancelBlock;
    } else if ( sel_isEqual(aSelector, @selector(didPresentActionSheet:)) ) {
        return !!self.didPresentActionSheetBlock;
    } else if ( sel_isEqual(aSelector, @selector(willPresentActionSheet:)) ) {
        return !!self.willPresentActionSheetBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex  {
    UIActionSheetClickedButtonAtIndexBlock block = [self.clickedButtonAtIndexBlock copy];
    block(actionSheet, buttonIndex);
    [block release];
}

-(void)actionSheet:(UIActionSheet*)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex  {
    UIActionSheetDidDismissWithButtonIndexBlock block = [self.didDismissWithButtonIndexBlock copy];
    block(actionSheet, buttonIndex);
    [block release];
}

-(void)actionSheet:(UIActionSheet*)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex  {
    UIActionSheetWillDismissWithButtonIndexBlock block = [self.willDismissWithButtonIndexBlock copy];
    block(actionSheet, buttonIndex);
    [block release];
}

-(void)actionSheetCancel:(UIActionSheet*)actionSheet  {
    UIActionSheetCancelBlock block = [self.cancelBlock copy];
    block(actionSheet);
    [block release];
}

-(void)didPresentActionSheet:(UIActionSheet*)actionSheet  {
    UIActionSheetDidPresentActionSheetBlock block = [self.didPresentActionSheetBlock copy];
    block(actionSheet);
    [block release];
}

-(void)willPresentActionSheet:(UIActionSheet*)actionSheet  {
    UIActionSheetWillPresentActionSheetBlock block = [self.willPresentActionSheetBlock copy];
    block(actionSheet);
    [block release];
}

@end

