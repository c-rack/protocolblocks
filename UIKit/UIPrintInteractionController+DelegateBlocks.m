//
// protocolblocks: UIKit/UIPrintInteractionController+DelegateBlocks.m
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

#import "UIPrintInteractionController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UIPrintInteractionControllerDelegateBlocksKey = @"UIPrintInteractionControllerDelegateBlocksKey";

@implementation UIPrintInteractionController (DelegateBlocks)

-(id)useBlocksForDelegate {
    UIPrintInteractionControllerDelegateBlocks* delegate = [[[UIPrintInteractionControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UIPrintInteractionControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onChoosePaper:(UIPrintInteractionControllerChoosePaperBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setChoosePaperBlock:block];
}

-(void)onDidDismissPrinterOptions:(UIPrintInteractionControllerDidDismissPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setDidDismissPrinterOptionsBlock:block];
}

-(void)onDidFinishJob:(UIPrintInteractionControllerDidFinishJobBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setDidFinishJobBlock:block];
}

-(void)onDidPresentPrinterOptions:(UIPrintInteractionControllerDidPresentPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setDidPresentPrinterOptionsBlock:block];
}

-(void)onParentViewController:(UIPrintInteractionControllerParentViewControllerBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setParentViewControllerBlock:block];
}

-(void)onWillDismissPrinterOptions:(UIPrintInteractionControllerWillDismissPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setWillDismissPrinterOptionsBlock:block];
}

-(void)onWillPresentPrinterOptions:(UIPrintInteractionControllerWillPresentPrinterOptionsBlock)block {
    [((UIPrintInteractionControllerDelegateBlocks*)self.delegate) setWillPresentPrinterOptionsBlock:block];
}

-(void)onWillStartJob:(UIPrintInteractionControllerWillStartJobBlock)block {
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

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(printInteractionController:choosePaper:)) ) {
        return !!self.choosePaperBlock;
    } else if ( sel_isEqual(aSelector, @selector(printInteractionControllerDidDismissPrinterOptions:)) ) {
        return !!self.didDismissPrinterOptionsBlock;
    } else if ( sel_isEqual(aSelector, @selector(printInteractionControllerDidFinishJob:)) ) {
        return !!self.didFinishJobBlock;
    } else if ( sel_isEqual(aSelector, @selector(printInteractionControllerDidPresentPrinterOptions:)) ) {
        return !!self.didPresentPrinterOptionsBlock;
    } else if ( sel_isEqual(aSelector, @selector(printInteractionControllerParentViewController:)) ) {
        return !!self.parentViewControllerBlock;
    } else if ( sel_isEqual(aSelector, @selector(printInteractionControllerWillDismissPrinterOptions:)) ) {
        return !!self.willDismissPrinterOptionsBlock;
    } else if ( sel_isEqual(aSelector, @selector(printInteractionControllerWillPresentPrinterOptions:)) ) {
        return !!self.willPresentPrinterOptionsBlock;
    } else if ( sel_isEqual(aSelector, @selector(printInteractionControllerWillStartJob:)) ) {
        return !!self.willStartJobBlock;
    }
    return [super respondsToSelector:aSelector];
}

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

