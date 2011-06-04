//
// protocolblocks: UIKit/UIPrintInteractionController+DelegateBlocks.h
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

-(id)delegateBlocks;
-(void)onChoosePaper:(UIPrintInteractionControllerChoosePaperBlock)block;
-(void)onDidDismissPrinterOptions:(UIPrintInteractionControllerDidDismissPrinterOptionsBlock)block;
-(void)onDidFinishJob:(UIPrintInteractionControllerDidFinishJobBlock)block;
-(void)onDidPresentPrinterOptions:(UIPrintInteractionControllerDidPresentPrinterOptionsBlock)block;
-(void)onParentViewController:(UIPrintInteractionControllerParentViewControllerBlock)block;
-(void)onWillDismissPrinterOptions:(UIPrintInteractionControllerWillDismissPrinterOptionsBlock)block;
-(void)onWillPresentPrinterOptions:(UIPrintInteractionControllerWillPresentPrinterOptionsBlock)block;
-(void)onWillStartJob:(UIPrintInteractionControllerWillStartJobBlock)block;

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

