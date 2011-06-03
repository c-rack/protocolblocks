//
// ProtocolBlocks: UIKit/UIDocumentInteractionController+DelegateBlocks.m
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

#import "UIDocumentInteractionController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIDocumentInteractionControllerDelegateBlocksKey = @"UIDocumentInteractionControllerDelegateBlocksKey";

@implementation UIDocumentInteractionController (DelegateBlocks)

-(id)delegateblocks {
    UIDocumentInteractionControllerDelegateBlocks* delegate = [[[UIDocumentInteractionControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIDocumentInteractionControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setCanPerformActionBlock:(UIDocumentInteractionControllerCanPerformActionBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setCanPerformActionBlock:block];
}

-(void)setDidEndSendingToApplicationBlock:(UIDocumentInteractionControllerDidEndSendingToApplicationBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidEndSendingToApplicationBlock:block];
}

-(void)setPerformActionBlock:(UIDocumentInteractionControllerPerformActionBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setPerformActionBlock:block];
}

-(void)setWillBeginSendingToApplicationBlock:(UIDocumentInteractionControllerWillBeginSendingToApplicationBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setWillBeginSendingToApplicationBlock:block];
}

-(void)setDidDismissOpenInMenuBlock:(UIDocumentInteractionControllerDidDismissOpenInMenuBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidDismissOpenInMenuBlock:block];
}

-(void)setDidDismissOptionsMenuBlock:(UIDocumentInteractionControllerDidDismissOptionsMenuBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidDismissOptionsMenuBlock:block];
}

-(void)setDidEndPreviewBlock:(UIDocumentInteractionControllerDidEndPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setDidEndPreviewBlock:block];
}

-(void)setRectForPreviewBlock:(UIDocumentInteractionControllerRectForPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setRectForPreviewBlock:block];
}

-(void)setViewControllerForPreviewBlock:(UIDocumentInteractionControllerViewControllerForPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setViewControllerForPreviewBlock:block];
}

-(void)setViewForPreviewBlock:(UIDocumentInteractionControllerViewForPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setViewForPreviewBlock:block];
}

-(void)setWillBeginPreviewBlock:(UIDocumentInteractionControllerWillBeginPreviewBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setWillBeginPreviewBlock:block];
}

-(void)setWillPresentOpenInMenuBlock:(UIDocumentInteractionControllerWillPresentOpenInMenuBlock)block {
    [((UIDocumentInteractionControllerDelegateBlocks*)self.delegate) setWillPresentOpenInMenuBlock:block];
}

-(void)setWillPresentOptionsMenuBlock:(UIDocumentInteractionControllerWillPresentOptionsMenuBlock)block {
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

