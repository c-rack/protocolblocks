//
// ProtocolBlocks: UIKit/UIDocumentInteractionController+DelegateBlocks.h
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

typedef BOOL (^UIDocumentInteractionControllerCanPerformActionBlock)(UIDocumentInteractionController* controller, SEL action);
typedef void (^UIDocumentInteractionControllerDidEndSendingToApplicationBlock)(UIDocumentInteractionController* controller, NSString* application);
typedef BOOL (^UIDocumentInteractionControllerPerformActionBlock)(UIDocumentInteractionController* controller, SEL action);
typedef void (^UIDocumentInteractionControllerWillBeginSendingToApplicationBlock)(UIDocumentInteractionController* controller, NSString* application);
typedef void (^UIDocumentInteractionControllerDidDismissOpenInMenuBlock)(UIDocumentInteractionController* controller);
typedef void (^UIDocumentInteractionControllerDidDismissOptionsMenuBlock)(UIDocumentInteractionController* controller);
typedef void (^UIDocumentInteractionControllerDidEndPreviewBlock)(UIDocumentInteractionController* controller);
typedef CGRect (^UIDocumentInteractionControllerRectForPreviewBlock)(UIDocumentInteractionController* controller);
typedef UIViewController* (^UIDocumentInteractionControllerViewControllerForPreviewBlock)(UIDocumentInteractionController* controller);
typedef UIView* (^UIDocumentInteractionControllerViewForPreviewBlock)(UIDocumentInteractionController* controller);
typedef void (^UIDocumentInteractionControllerWillBeginPreviewBlock)(UIDocumentInteractionController* controller);
typedef void (^UIDocumentInteractionControllerWillPresentOpenInMenuBlock)(UIDocumentInteractionController* controller);
typedef void (^UIDocumentInteractionControllerWillPresentOptionsMenuBlock)(UIDocumentInteractionController* controller);

@interface UIDocumentInteractionController (DelegateBlocks)

-(id)delegateblocks;
-(void)setCanPerformActionBlock:(UIDocumentInteractionControllerCanPerformActionBlock)block;
-(void)setDidEndSendingToApplicationBlock:(UIDocumentInteractionControllerDidEndSendingToApplicationBlock)block;
-(void)setPerformActionBlock:(UIDocumentInteractionControllerPerformActionBlock)block;
-(void)setWillBeginSendingToApplicationBlock:(UIDocumentInteractionControllerWillBeginSendingToApplicationBlock)block;
-(void)setDidDismissOpenInMenuBlock:(UIDocumentInteractionControllerDidDismissOpenInMenuBlock)block;
-(void)setDidDismissOptionsMenuBlock:(UIDocumentInteractionControllerDidDismissOptionsMenuBlock)block;
-(void)setDidEndPreviewBlock:(UIDocumentInteractionControllerDidEndPreviewBlock)block;
-(void)setRectForPreviewBlock:(UIDocumentInteractionControllerRectForPreviewBlock)block;
-(void)setViewControllerForPreviewBlock:(UIDocumentInteractionControllerViewControllerForPreviewBlock)block;
-(void)setViewForPreviewBlock:(UIDocumentInteractionControllerViewForPreviewBlock)block;
-(void)setWillBeginPreviewBlock:(UIDocumentInteractionControllerWillBeginPreviewBlock)block;
-(void)setWillPresentOpenInMenuBlock:(UIDocumentInteractionControllerWillPresentOpenInMenuBlock)block;
-(void)setWillPresentOptionsMenuBlock:(UIDocumentInteractionControllerWillPresentOptionsMenuBlock)block;

@end

@interface UIDocumentInteractionControllerDelegateBlocks : NSObject <UIDocumentInteractionControllerDelegate> {
    UIDocumentInteractionControllerCanPerformActionBlock _canPerformActionBlock;
    UIDocumentInteractionControllerDidEndSendingToApplicationBlock _didEndSendingToApplicationBlock;
    UIDocumentInteractionControllerPerformActionBlock _performActionBlock;
    UIDocumentInteractionControllerWillBeginSendingToApplicationBlock _willBeginSendingToApplicationBlock;
    UIDocumentInteractionControllerDidDismissOpenInMenuBlock _didDismissOpenInMenuBlock;
    UIDocumentInteractionControllerDidDismissOptionsMenuBlock _didDismissOptionsMenuBlock;
    UIDocumentInteractionControllerDidEndPreviewBlock _didEndPreviewBlock;
    UIDocumentInteractionControllerRectForPreviewBlock _rectForPreviewBlock;
    UIDocumentInteractionControllerViewControllerForPreviewBlock _viewControllerForPreviewBlock;
    UIDocumentInteractionControllerViewForPreviewBlock _viewForPreviewBlock;
    UIDocumentInteractionControllerWillBeginPreviewBlock _willBeginPreviewBlock;
    UIDocumentInteractionControllerWillPresentOpenInMenuBlock _willPresentOpenInMenuBlock;
    UIDocumentInteractionControllerWillPresentOptionsMenuBlock _willPresentOptionsMenuBlock;
}

@property(nonatomic, copy) UIDocumentInteractionControllerCanPerformActionBlock canPerformActionBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerDidEndSendingToApplicationBlock didEndSendingToApplicationBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerPerformActionBlock performActionBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerWillBeginSendingToApplicationBlock willBeginSendingToApplicationBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerDidDismissOpenInMenuBlock didDismissOpenInMenuBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerDidDismissOptionsMenuBlock didDismissOptionsMenuBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerDidEndPreviewBlock didEndPreviewBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerRectForPreviewBlock rectForPreviewBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerViewControllerForPreviewBlock viewControllerForPreviewBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerViewForPreviewBlock viewForPreviewBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerWillBeginPreviewBlock willBeginPreviewBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerWillPresentOpenInMenuBlock willPresentOpenInMenuBlock;
@property(nonatomic, copy) UIDocumentInteractionControllerWillPresentOptionsMenuBlock willPresentOptionsMenuBlock;

@end

