//
// protocolblocks: UIKit/UIDocumentInteractionController+DelegateBlocks.h
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

-(id)useBlocksForDelegate;
-(void)onCanPerformAction:(UIDocumentInteractionControllerCanPerformActionBlock)block;
-(void)onDidEndSendingToApplication:(UIDocumentInteractionControllerDidEndSendingToApplicationBlock)block;
-(void)onPerformAction:(UIDocumentInteractionControllerPerformActionBlock)block;
-(void)onWillBeginSendingToApplication:(UIDocumentInteractionControllerWillBeginSendingToApplicationBlock)block;
-(void)onDidDismissOpenInMenu:(UIDocumentInteractionControllerDidDismissOpenInMenuBlock)block;
-(void)onDidDismissOptionsMenu:(UIDocumentInteractionControllerDidDismissOptionsMenuBlock)block;
-(void)onDidEndPreview:(UIDocumentInteractionControllerDidEndPreviewBlock)block;
-(void)onRectForPreview:(UIDocumentInteractionControllerRectForPreviewBlock)block;
-(void)onViewControllerForPreview:(UIDocumentInteractionControllerViewControllerForPreviewBlock)block;
-(void)onViewForPreview:(UIDocumentInteractionControllerViewForPreviewBlock)block;
-(void)onWillBeginPreview:(UIDocumentInteractionControllerWillBeginPreviewBlock)block;
-(void)onWillPresentOpenInMenu:(UIDocumentInteractionControllerWillPresentOpenInMenuBlock)block;
-(void)onWillPresentOptionsMenu:(UIDocumentInteractionControllerWillPresentOptionsMenuBlock)block;

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

