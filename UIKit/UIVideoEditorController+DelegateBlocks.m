//
// protocolblocks: UIKit/UIVideoEditorController+DelegateBlocks.m
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

#import "UIVideoEditorController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIVideoEditorControllerDelegateBlocksKey = @"UIVideoEditorControllerDelegateBlocksKey";

@implementation UIVideoEditorController (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIVideoEditorControllerDelegateBlocks* delegate = [[[UIVideoEditorControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIVideoEditorControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidFailWithError:(UIVideoEditorControllerDidFailWithErrorBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidFailWithErrorBlock:block];
}

-(void)onDidSaveEditedVideoToPath:(UIVideoEditorControllerDidSaveEditedVideoToPathBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidSaveEditedVideoToPathBlock:block];
}

-(void)onDidCancel:(UIVideoEditorControllerDidCancelBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidCancelBlock:block];
}

-(void)onDidShowViewController:(UIVideoEditorControllerDidShowViewControllerBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidShowViewControllerBlock:block];
}

-(void)onWillShowViewController:(UIVideoEditorControllerWillShowViewControllerBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setWillShowViewControllerBlock:block];
}

@end

@implementation UIVideoEditorControllerDelegateBlocks

@synthesize didFailWithErrorBlock = _didFailWithErrorBlock;
@synthesize didSaveEditedVideoToPathBlock = _didSaveEditedVideoToPathBlock;
@synthesize didCancelBlock = _didCancelBlock;
@synthesize didShowViewControllerBlock = _didShowViewControllerBlock;
@synthesize willShowViewControllerBlock = _willShowViewControllerBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(videoEditorController:didFailWithError:)) ) {
        return !!self.didFailWithErrorBlock;
    } else if ( sel_isEqual(aSelector, @selector(videoEditorController:didSaveEditedVideoToPath:)) ) {
        return !!self.didSaveEditedVideoToPathBlock;
    } else if ( sel_isEqual(aSelector, @selector(videoEditorControllerDidCancel:)) ) {
        return !!self.didCancelBlock;
    } else if ( sel_isEqual(aSelector, @selector(navigationController:didShowViewController:animated:)) ) {
        return !!self.didShowViewControllerBlock;
    } else if ( sel_isEqual(aSelector, @selector(navigationController:willShowViewController:animated:)) ) {
        return !!self.willShowViewControllerBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)videoEditorController:(UIVideoEditorController*)editor didFailWithError:(NSError*)error  {
    UIVideoEditorControllerDidFailWithErrorBlock block = [self.didFailWithErrorBlock copy];
    block(editor, error);
    [block release];
}

-(void)videoEditorController:(UIVideoEditorController*)editor didSaveEditedVideoToPath:(NSString*)editedVideoPath  {
    UIVideoEditorControllerDidSaveEditedVideoToPathBlock block = [self.didSaveEditedVideoToPathBlock copy];
    block(editor, editedVideoPath);
    [block release];
}

-(void)videoEditorControllerDidCancel:(UIVideoEditorController*)editor  {
    UIVideoEditorControllerDidCancelBlock block = [self.didCancelBlock copy];
    block(editor);
    [block release];
}

-(void)navigationController:(UINavigationController*)navigationController didShowViewController:(UIViewController*)viewController animated:(BOOL)animated  {
    UIVideoEditorControllerDidShowViewControllerBlock block = [self.didShowViewControllerBlock copy];
    block(navigationController, viewController, animated);
    [block release];
}

-(void)navigationController:(UINavigationController*)navigationController willShowViewController:(UIViewController*)viewController animated:(BOOL)animated  {
    UIVideoEditorControllerWillShowViewControllerBlock block = [self.willShowViewControllerBlock copy];
    block(navigationController, viewController, animated);
    [block release];
}

@end

