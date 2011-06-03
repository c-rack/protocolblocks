//
// ProtocolBlocks: UIKit/UIPrintInteractionController+DelegateBlocks.m
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

#import "UIPrintInteractionController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIPrintInteractionControllerDelegateBlocksKey = @"UIPrintInteractionControllerDelegateBlocksKey";

@implementation UIPrintInteractionController (DelegateBlocks)

-(id)delegateblocks {
    UIPrintInteractionControllerDelegateBlocks* delegate = [[[UIPrintInteractionControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIPrintInteractionControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setChoosePaperBlock:(UIPrintInteractionControllerChoosePaperBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setChoosePaperBlock:block];
}

-(void)setDidDismissPrinterOptionsBlock:(UIPrintInteractionControllerDidDismissPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setDidDismissPrinterOptionsBlock:block];
}

-(void)setDidFinishJobBlock:(UIPrintInteractionControllerDidFinishJobBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setDidFinishJobBlock:block];
}

-(void)setDidPresentPrinterOptionsBlock:(UIPrintInteractionControllerDidPresentPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setDidPresentPrinterOptionsBlock:block];
}

-(void)setParentViewControllerBlock:(UIPrintInteractionControllerParentViewControllerBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setParentViewControllerBlock:block];
}

-(void)setWillDismissPrinterOptionsBlock:(UIPrintInteractionControllerWillDismissPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setWillDismissPrinterOptionsBlock:block];
}

-(void)setWillPresentPrinterOptionsBlock:(UIPrintInteractionControllerWillPresentPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setWillPresentPrinterOptionsBlock:block];
}

-(void)setWillStartJobBlock:(UIPrintInteractionControllerWillStartJobBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setWillStartJobBlock:block];
}

@end

@implementation UIPrintInteractionControllerDelegateBlocks

@synthesize choosePaperBlock = _choosePaperBlock;
@synthesize didDismissPrinterOptionsBlock = _didDismissPrinterOptionsBlock;
@synthesize didFinishJobBlock = _didFinishJobBlock;
@synthesize didPresentPrinterOptionsBlock = _didPresentPrinterOptionsBlock;
@synthesize parentViewControllerBlock = _parentViewControllerBlock;
@synthesize willDismissPrinterOptionsBlock = _willDismissPrinterOptionsBlock;
@synthesize willPresentPrinterOptionsBlock = _willPresentPrinterOptionsBlock;
@synthesize willStartJobBlock = _willStartJobBlock;

-(UIPrintPaper*)printInteractionController:(UIPrintInteractionController*)printInteractionController choosePaper:(NSArray*)paperList  {
    UIPrintInteractionControllerChoosePaperBlock block = [self.choosePaperBlock copy];
    UIPrintPaper* result = block(printInteractionController, paperList);
    [block release];
    return result;
}

-(void)printInteractionControllerDidDismissPrinterOptions:(UIPrintInteractionController*)printInteractionController  {
    UIPrintInteractionControllerDidDismissPrinterOptionsBlock block = [self.didDismissPrinterOptionsBlock copy];
    block(printInteractionController);
    [block release];
}

-(void)printInteractionControllerDidFinishJob:(UIPrintInteractionController*)printInteractionController  {
    UIPrintInteractionControllerDidFinishJobBlock block = [self.didFinishJobBlock copy];
    block(printInteractionController);
    [block release];
}

-(void)printInteractionControllerDidPresentPrinterOptions:(UIPrintInteractionController*)printInteractionController  {
    UIPrintInteractionControllerDidPresentPrinterOptionsBlock block = [self.didPresentPrinterOptionsBlock copy];
    block(printInteractionController);
    [block release];
}

-(UIViewController*)printInteractionControllerParentViewController:(UIPrintInteractionController*)printInteractionController  {
    UIPrintInteractionControllerParentViewControllerBlock block = [self.parentViewControllerBlock copy];
    UIViewController* result = block(printInteractionController);
    [block release];
    return result;
}

-(void)printInteractionControllerWillDismissPrinterOptions:(UIPrintInteractionController*)printInteractionController  {
    UIPrintInteractionControllerWillDismissPrinterOptionsBlock block = [self.willDismissPrinterOptionsBlock copy];
    block(printInteractionController);
    [block release];
}

-(void)printInteractionControllerWillPresentPrinterOptions:(UIPrintInteractionController*)printInteractionController  {
    UIPrintInteractionControllerWillPresentPrinterOptionsBlock block = [self.willPresentPrinterOptionsBlock copy];
    block(printInteractionController);
    [block release];
}

-(void)printInteractionControllerWillStartJob:(UIPrintInteractionController*)printInteractionController  {
    UIPrintInteractionControllerWillStartJobBlock block = [self.willStartJobBlock copy];
    block(printInteractionController);
    [block release];
}


@end

