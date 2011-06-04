//
// protocolblocks: UIKit/UIDocumentInteractionController+DelegateBlocks.m
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

#import "UIDocumentInteractionController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIDocumentInteractionControllerDelegateBlocksKey = @"UIDocumentInteractionControllerDelegateBlocksKey";

@implementation UIDocumentInteractionController (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIDocumentInteractionControllerDelegateBlocks* delegate = [[[UIDocumentInteractionControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIDocumentInteractionControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onCanPerformAction:(UIDocumentInteractionControllerCanPerformActionBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setCanPerformActionBlock:block];
}

-(void)onDidEndSendingToApplication:(UIDocumentInteractionControllerDidEndSendingToApplicationBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidEndSendingToApplicationBlock:block];
}

-(void)onPerformAction:(UIDocumentInteractionControllerPerformActionBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setPerformActionBlock:block];
}

-(void)onWillBeginSendingToApplication:(UIDocumentInteractionControllerWillBeginSendingToApplicationBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setWillBeginSendingToApplicationBlock:block];
}

-(void)onDidDismissOpenInMenu:(UIDocumentInteractionControllerDidDismissOpenInMenuBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidDismissOpenInMenuBlock:block];
}

-(void)onDidDismissOptionsMenu:(UIDocumentInteractionControllerDidDismissOptionsMenuBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidDismissOptionsMenuBlock:block];
}

-(void)onDidEndPreview:(UIDocumentInteractionControllerDidEndPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidEndPreviewBlock:block];
}

-(void)onRectForPreview:(UIDocumentInteractionControllerRectForPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setRectForPreviewBlock:block];
}

-(void)onViewControllerForPreview:(UIDocumentInteractionControllerViewControllerForPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setViewControllerForPreviewBlock:block];
}

-(void)onViewForPreview:(UIDocumentInteractionControllerViewForPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setViewForPreviewBlock:block];
}

-(void)onWillBeginPreview:(UIDocumentInteractionControllerWillBeginPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setWillBeginPreviewBlock:block];
}

-(void)onWillPresentOpenInMenu:(UIDocumentInteractionControllerWillPresentOpenInMenuBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setWillPresentOpenInMenuBlock:block];
}

-(void)onWillPresentOptionsMenu:(UIDocumentInteractionControllerWillPresentOptionsMenuBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setWillPresentOptionsMenuBlock:block];
}

@end

@implementation UIDocumentInteractionControllerDelegateBlocks

@synthesize canPerformActionBlock = _canPerformActionBlock;
@synthesize didEndSendingToApplicationBlock = _didEndSendingToApplicationBlock;
@synthesize performActionBlock = _performActionBlock;
@synthesize willBeginSendingToApplicationBlock = _willBeginSendingToApplicationBlock;
@synthesize didDismissOpenInMenuBlock = _didDismissOpenInMenuBlock;
@synthesize didDismissOptionsMenuBlock = _didDismissOptionsMenuBlock;
@synthesize didEndPreviewBlock = _didEndPreviewBlock;
@synthesize rectForPreviewBlock = _rectForPreviewBlock;
@synthesize viewControllerForPreviewBlock = _viewControllerForPreviewBlock;
@synthesize viewForPreviewBlock = _viewForPreviewBlock;
@synthesize willBeginPreviewBlock = _willBeginPreviewBlock;
@synthesize willPresentOpenInMenuBlock = _willPresentOpenInMenuBlock;
@synthesize willPresentOptionsMenuBlock = _willPresentOptionsMenuBlock;

-(BOOL)documentInteractionController:(UIDocumentInteractionController*)controller canPerformAction:(SEL)action  {
    UIDocumentInteractionControllerCanPerformActionBlock block = [self.canPerformActionBlock copy];
    BOOL result = block(controller, action);
    [block release];
    return result;
}

-(void)documentInteractionController:(UIDocumentInteractionController*)controller didEndSendingToApplication:(NSString*)application  {
    UIDocumentInteractionControllerDidEndSendingToApplicationBlock block = [self.didEndSendingToApplicationBlock copy];
    block(controller, application);
    [block release];
}

-(BOOL)documentInteractionController:(UIDocumentInteractionController*)controller performAction:(SEL)action  {
    UIDocumentInteractionControllerPerformActionBlock block = [self.performActionBlock copy];
    BOOL result = block(controller, action);
    [block release];
    return result;
}

-(void)documentInteractionController:(UIDocumentInteractionController*)controller willBeginSendingToApplication:(NSString*)application  {
    UIDocumentInteractionControllerWillBeginSendingToApplicationBlock block = [self.willBeginSendingToApplicationBlock copy];
    block(controller, application);
    [block release];
}

-(void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerDidDismissOpenInMenuBlock block = [self.didDismissOpenInMenuBlock copy];
    block(controller);
    [block release];
}

-(void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerDidDismissOptionsMenuBlock block = [self.didDismissOptionsMenuBlock copy];
    block(controller);
    [block release];
}

-(void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerDidEndPreviewBlock block = [self.didEndPreviewBlock copy];
    block(controller);
    [block release];
}

-(CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerRectForPreviewBlock block = [self.rectForPreviewBlock copy];
    CGRect result = block(controller);
    [block release];
    return result;
}

-(UIViewController*)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerViewControllerForPreviewBlock block = [self.viewControllerForPreviewBlock copy];
    UIViewController* result = block(controller);
    [block release];
    return result;
}

-(UIView*)documentInteractionControllerViewForPreview:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerViewForPreviewBlock block = [self.viewForPreviewBlock copy];
    UIView* result = block(controller);
    [block release];
    return result;
}

-(void)documentInteractionControllerWillBeginPreview:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerWillBeginPreviewBlock block = [self.willBeginPreviewBlock copy];
    block(controller);
    [block release];
}

-(void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerWillPresentOpenInMenuBlock block = [self.willPresentOpenInMenuBlock copy];
    block(controller);
    [block release];
}

-(void)documentInteractionControllerWillPresentOptionsMenu:(UIDocumentInteractionController*)controller  {
    UIDocumentInteractionControllerWillPresentOptionsMenuBlock block = [self.willPresentOptionsMenuBlock copy];
    block(controller);
    [block release];
}

@end

