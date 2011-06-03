//
// ProtocolBlocks: UIKit/UIPrintInteractionController+DelegateBlocks.h
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

typedef UIPrintPaper* (^UIPrintInteractionControllerChoosePaperBlock)(UIPrintInteractionController* printInteractionController, NSArray* paperList);
typedef void (^UIPrintInteractionControllerDidDismissPrinterOptionsBlock)(UIPrintInteractionController* printInteractionController);
typedef void (^UIPrintInteractionControllerDidFinishJobBlock)(UIPrintInteractionController* printInteractionController);
typedef void (^UIPrintInteractionControllerDidPresentPrinterOptionsBlock)(UIPrintInteractionController* printInteractionController);
typedef UIViewController* (^UIPrintInteractionControllerParentViewControllerBlock)(UIPrintInteractionController* printInteractionController);
typedef void (^UIPrintInteractionControllerWillDismissPrinterOptionsBlock)(UIPrintInteractionController* printInteractionController);
typedef void (^UIPrintInteractionControllerWillPresentPrinterOptionsBlock)(UIPrintInteractionController* printInteractionController);
typedef void (^UIPrintInteractionControllerWillStartJobBlock)(UIPrintInteractionController* printInteractionController);

@interface UIPrintInteractionController (DelegateBlocks)

-(id)delegateblocks;
-(void)setChoosePaperBlock:(UIPrintInteractionControllerChoosePaperBlock)block;
-(void)setDidDismissPrinterOptionsBlock:(UIPrintInteractionControllerDidDismissPrinterOptionsBlock)block;
-(void)setDidFinishJobBlock:(UIPrintInteractionControllerDidFinishJobBlock)block;
-(void)setDidPresentPrinterOptionsBlock:(UIPrintInteractionControllerDidPresentPrinterOptionsBlock)block;
-(void)setParentViewControllerBlock:(UIPrintInteractionControllerParentViewControllerBlock)block;
-(void)setWillDismissPrinterOptionsBlock:(UIPrintInteractionControllerWillDismissPrinterOptionsBlock)block;
-(void)setWillPresentPrinterOptionsBlock:(UIPrintInteractionControllerWillPresentPrinterOptionsBlock)block;
-(void)setWillStartJobBlock:(UIPrintInteractionControllerWillStartJobBlock)block;

@end

@interface UIPrintInteractionControllerDelegateBlocks : NSObject <UIPrintInteractionControllerDelegate> {
    UIPrintInteractionControllerChoosePaperBlock _choosePaperBlock;
    UIPrintInteractionControllerDidDismissPrinterOptionsBlock _didDismissPrinterOptionsBlock;
    UIPrintInteractionControllerDidFinishJobBlock _didFinishJobBlock;
    UIPrintInteractionControllerDidPresentPrinterOptionsBlock _didPresentPrinterOptionsBlock;
    UIPrintInteractionControllerParentViewControllerBlock _parentViewControllerBlock;
    UIPrintInteractionControllerWillDismissPrinterOptionsBlock _willDismissPrinterOptionsBlock;
    UIPrintInteractionControllerWillPresentPrinterOptionsBlock _willPresentPrinterOptionsBlock;
    UIPrintInteractionControllerWillStartJobBlock _willStartJobBlock;
}

@property(nonatomic, copy) UIPrintInteractionControllerChoosePaperBlock choosePaperBlock;
@property(nonatomic, copy) UIPrintInteractionControllerDidDismissPrinterOptionsBlock didDismissPrinterOptionsBlock;
@property(nonatomic, copy) UIPrintInteractionControllerDidFinishJobBlock didFinishJobBlock;
@property(nonatomic, copy) UIPrintInteractionControllerDidPresentPrinterOptionsBlock didPresentPrinterOptionsBlock;
@property(nonatomic, copy) UIPrintInteractionControllerParentViewControllerBlock parentViewControllerBlock;
@property(nonatomic, copy) UIPrintInteractionControllerWillDismissPrinterOptionsBlock willDismissPrinterOptionsBlock;
@property(nonatomic, copy) UIPrintInteractionControllerWillPresentPrinterOptionsBlock willPresentPrinterOptionsBlock;
@property(nonatomic, copy) UIPrintInteractionControllerWillStartJobBlock willStartJobBlock;

@end

