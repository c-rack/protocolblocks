//
// protocolblocks: UIKit/UIImagePickerController+DelegateBlocks.m
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

#import "UIImagePickerController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIImagePickerControllerDelegateBlocksKey = @"UIImagePickerControllerDelegateBlocksKey";

@implementation UIImagePickerController (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIImagePickerControllerDelegateBlocks* delegate = [[[UIImagePickerControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIImagePickerControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidFinishPickingMediaWithInfo:(UIImagePickerControllerDidFinishPickingMediaWithInfoBlock)block {
    [((UIImagePickerControllerDelegateBlocks*)self.delegate) setDidFinishPickingMediaWithInfoBlock:block];
}

-(void)onDidCancel:(UIImagePickerControllerDidCancelBlock)block {
    [((UIImagePickerControllerDelegateBlocks*)self.delegate) setDidCancelBlock:block];
}

-(void)onDidShowViewController:(UIImagePickerControllerDidShowViewControllerBlock)block {
    [((UIImagePickerControllerDelegateBlocks*)self.delegate) setDidShowViewControllerBlock:block];
}

-(void)onWillShowViewController:(UIImagePickerControllerWillShowViewControllerBlock)block {
    [((UIImagePickerControllerDelegateBlocks*)self.delegate) setWillShowViewControllerBlock:block];
}

@end

@implementation UIImagePickerControllerDelegateBlocks

@synthesize didFinishPickingMediaWithInfoBlock = _didFinishPickingMediaWithInfoBlock;
@synthesize didCancelBlock = _didCancelBlock;
@synthesize didShowViewControllerBlock = _didShowViewControllerBlock;
@synthesize willShowViewControllerBlock = _willShowViewControllerBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(imagePickerController:didFinishPickingMediaWithInfo:)) ) {
        return !!self.didFinishPickingMediaWithInfoBlock;
    } else if ( sel_isEqual(aSelector, @selector(imagePickerControllerDidCancel:)) ) {
        return !!self.didCancelBlock;
    } else if ( sel_isEqual(aSelector, @selector(navigationController:didShowViewController:animated:)) ) {
        return !!self.didShowViewControllerBlock;
    } else if ( sel_isEqual(aSelector, @selector(navigationController:willShowViewController:animated:)) ) {
        return !!self.willShowViewControllerBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info  {
    UIImagePickerControllerDidFinishPickingMediaWithInfoBlock block = [self.didFinishPickingMediaWithInfoBlock copy];
    block(picker, info);
    [block release];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController*)picker  {
    UIImagePickerControllerDidCancelBlock block = [self.didCancelBlock copy];
    block(picker);
    [block release];
}

-(void)navigationController:(UINavigationController*)navigationController didShowViewController:(UIViewController*)viewController animated:(BOOL)animated  {
    UIImagePickerControllerDidShowViewControllerBlock block = [self.didShowViewControllerBlock copy];
    block(navigationController, viewController, animated);
    [block release];
}

-(void)navigationController:(UINavigationController*)navigationController willShowViewController:(UIViewController*)viewController animated:(BOOL)animated  {
    UIImagePickerControllerWillShowViewControllerBlock block = [self.willShowViewControllerBlock copy];
    block(navigationController, viewController, animated);
    [block release];
}

@end

