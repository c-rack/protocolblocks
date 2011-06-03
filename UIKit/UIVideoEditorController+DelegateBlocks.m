//
// ProtocolBlocks: UIKit/UIVideoEditorController+DelegateBlocks.m
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

#import "UIVideoEditorController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIVideoEditorControllerDelegateBlocksKey = @"UIVideoEditorControllerDelegateBlocksKey";

@implementation UIVideoEditorController (DelegateBlocks)

-(id)delegateblocks {
    UIVideoEditorControllerDelegateBlocks* delegate = [[[UIVideoEditorControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIVideoEditorControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidFailWithErrorBlock:(UIVideoEditorControllerDidFailWithErrorBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidFailWithErrorBlock:block];
}

-(void)setDidSaveEditedVideoToPathBlock:(UIVideoEditorControllerDidSaveEditedVideoToPathBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidSaveEditedVideoToPathBlock:block];
}

-(void)setDidCancelBlock:(UIVideoEditorControllerDidCancelBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidCancelBlock:block];
}

-(void)setDidShowViewControllerBlock:(UIVideoEditorControllerDidShowViewControllerBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setDidShowViewControllerBlock:block];
}

-(void)setWillShowViewControllerBlock:(UIVideoEditorControllerWillShowViewControllerBlock)block {
    [((UIVideoEditorControllerDelegateBlocks*)self.delegate) setWillShowViewControllerBlock:block];
}

@end

@implementation UIVideoEditorControllerDelegateBlocks

@synthesize didFailWithErrorBlock = _didFailWithErrorBlock;
@synthesize didSaveEditedVideoToPathBlock = _didSaveEditedVideoToPathBlock;
@synthesize didCancelBlock = _didCancelBlock;
@synthesize didShowViewControllerBlock = _didShowViewControllerBlock;
@synthesize willShowViewControllerBlock = _willShowViewControllerBlock;

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
