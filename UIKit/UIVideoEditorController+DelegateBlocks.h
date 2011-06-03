//
// ProtocolBlocks: UIKit/UIVideoEditorController+DelegateBlocks.h
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

typedef void (^UIVideoEditorControllerDidFailWithErrorBlock)(UIVideoEditorController* editor, NSError* error);
typedef void (^UIVideoEditorControllerDidSaveEditedVideoToPathBlock)(UIVideoEditorController* editor, NSString* editedVideoPath);
typedef void (^UIVideoEditorControllerDidCancelBlock)(UIVideoEditorController* editor);
typedef void (^UIVideoEditorControllerDidShowViewControllerBlock)(UINavigationController* navigationController, UIViewController* viewController, BOOL animated);
typedef void (^UIVideoEditorControllerWillShowViewControllerBlock)(UINavigationController* navigationController, UIViewController* viewController, BOOL animated);

@interface UIVideoEditorController (DelegateBlocks)

-(id)delegateblocks;
-(void)setDidFailWithErrorBlock:(UIVideoEditorControllerDidFailWithErrorBlock)block;
-(void)setDidSaveEditedVideoToPathBlock:(UIVideoEditorControllerDidSaveEditedVideoToPathBlock)block;
-(void)setDidCancelBlock:(UIVideoEditorControllerDidCancelBlock)block;
-(void)setDidShowViewControllerBlock:(UIVideoEditorControllerDidShowViewControllerBlock)block;
-(void)setWillShowViewControllerBlock:(UIVideoEditorControllerWillShowViewControllerBlock)block;

@end

@interface UIVideoEditorControllerDelegateBlocks : NSObject <UIVideoEditorControllerDelegate, UINavigationControllerDelegate> {
    UIVideoEditorControllerDidFailWithErrorBlock _didFailWithErrorBlock;
    UIVideoEditorControllerDidSaveEditedVideoToPathBlock _didSaveEditedVideoToPathBlock;
    UIVideoEditorControllerDidCancelBlock _didCancelBlock;
    UIVideoEditorControllerDidShowViewControllerBlock _didShowViewControllerBlock;
    UIVideoEditorControllerWillShowViewControllerBlock _willShowViewControllerBlock;
}

@property(nonatomic, copy) UIVideoEditorControllerDidFailWithErrorBlock didFailWithErrorBlock;
@property(nonatomic, copy) UIVideoEditorControllerDidSaveEditedVideoToPathBlock didSaveEditedVideoToPathBlock;
@property(nonatomic, copy) UIVideoEditorControllerDidCancelBlock didCancelBlock;
@property(nonatomic, copy) UIVideoEditorControllerDidShowViewControllerBlock didShowViewControllerBlock;
@property(nonatomic, copy) UIVideoEditorControllerWillShowViewControllerBlock willShowViewControllerBlock;

@end

