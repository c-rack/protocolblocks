//
// ProtocolBlocks: UIKit/UISplitViewController+DelegateBlocks.h
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

typedef void (^UISplitViewControllerWillPresentViewControllerBlock)(UISplitViewController* svc, UIPopoverController* pc, UIViewController* aViewController);
typedef void (^UISplitViewControllerWillHideViewControllerBlock)(UISplitViewController* svc, UIViewController* aViewController, UIBarButtonItem* barButtonItem, UIPopoverController* pc);
typedef void (^UISplitViewControllerWillShowViewControllerBlock)(UISplitViewController* svc, UIViewController* aViewController, UIBarButtonItem* button);

@interface UISplitViewController (DelegateBlocks)

-(id)delegateblocks;
-(void)setWillPresentViewControllerBlock:(UISplitViewControllerWillPresentViewControllerBlock)block;
-(void)setWillHideViewControllerBlock:(UISplitViewControllerWillHideViewControllerBlock)block;
-(void)setWillShowViewControllerBlock:(UISplitViewControllerWillShowViewControllerBlock)block;

@end

@interface UISplitViewControllerDelegateBlocks : NSObject <UISplitViewControllerDelegate> {
    UISplitViewControllerWillPresentViewControllerBlock _willPresentViewControllerBlock;
    UISplitViewControllerWillHideViewControllerBlock _willHideViewControllerBlock;
    UISplitViewControllerWillShowViewControllerBlock _willShowViewControllerBlock;
}

@property(nonatomic, copy) UISplitViewControllerWillPresentViewControllerBlock willPresentViewControllerBlock;
@property(nonatomic, copy) UISplitViewControllerWillHideViewControllerBlock willHideViewControllerBlock;
@property(nonatomic, copy) UISplitViewControllerWillShowViewControllerBlock willShowViewControllerBlock;

@end

