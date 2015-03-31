//
// protocolblocks: UIKit/UIVideoEditorController+DelegateBlocks.h
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

typedef void (^UIVideoEditorControllerDidFailWithErrorBlock)(UIVideoEditorController* editor, NSError* error);
typedef void (^UIVideoEditorControllerDidSaveEditedVideoToPathBlock)(UIVideoEditorController* editor, NSString* editedVideoPath);
typedef void (^UIVideoEditorControllerDidCancelBlock)(UIVideoEditorController* editor);
typedef void (^UIVideoEditorControllerDidShowViewControllerBlock)(UINavigationController* navigationController, UIViewController* viewController, BOOL animated);
typedef void (^UIVideoEditorControllerWillShowViewControllerBlock)(UINavigationController* navigationController, UIViewController* viewController, BOOL animated);

@interface UIVideoEditorController (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onDidFailWithError:(UIVideoEditorControllerDidFailWithErrorBlock)block;
-(void)onDidSaveEditedVideoToPath:(UIVideoEditorControllerDidSaveEditedVideoToPathBlock)block;
-(void)onDidCancel:(UIVideoEditorControllerDidCancelBlock)block;
-(void)onDidShowViewController:(UIVideoEditorControllerDidShowViewControllerBlock)block;
-(void)onWillShowViewController:(UIVideoEditorControllerWillShowViewControllerBlock)block;

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

