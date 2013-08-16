//
// protocolblocks: EventKitUI/EKEventEditViewController+EditViewDelegateBlocks.m
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

#import "EKEventEditViewController+EditViewDelegateBlocks.h"
#import <objc/runtime.h>

static NSString* EKEventEditViewControllerEditViewDelegateBlocksKey = @"EKEventEditViewControllerEditViewDelegateBlocksKey";

@implementation EKEventEditViewController (EditViewDelegateBlocks)

-(id)useBlocksForEditViewDelegate {
    EKEventEditViewControllerEditViewDelegateBlocks* editViewDelegate = [[[EKEventEditViewControllerEditViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &EKEventEditViewControllerEditViewDelegateBlocksKey, editViewDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.editViewDelegate = editViewDelegate;
    return self;
}

-(void)onDidCompleteWithAction:(EKEventEditViewControllerDidCompleteWithActionBlock)block {
    [((EKEventEditViewControllerEditViewDelegateBlocks*)self.editViewDelegate) setDidCompleteWithActionBlock:block];
}

-(void)onEventEditViewControllerDefaultCalendarForNewEvents:(EKEventEditViewControllerEventEditViewControllerDefaultCalendarForNewEventsBlock)block {
    [((EKEventEditViewControllerEditViewDelegateBlocks*)self.editViewDelegate) setEventEditViewControllerDefaultCalendarForNewEventsBlock:block];
}

@end

@implementation EKEventEditViewControllerEditViewDelegateBlocks

@synthesize didCompleteWithActionBlock = _didCompleteWithActionBlock;
@synthesize eventEditViewControllerDefaultCalendarForNewEventsBlock = _eventEditViewControllerDefaultCalendarForNewEventsBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( aSelector == @selector(eventEditViewController:didCompleteWithAction:) ) {
        return !!self.didCompleteWithActionBlock;
    } else if ( aSelector == @selector(defaultCalendarForNewEvents::) ) {
        return !!self.eventEditViewControllerDefaultCalendarForNewEventsBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)eventEditViewController:(EKEventEditViewController*)controller didCompleteWithAction:(EKEventEditViewAction)action  {
    EKEventEditViewControllerDidCompleteWithActionBlock block = [self.didCompleteWithActionBlock copy];
    block(controller, action);
    [block release];
}

-(EKCalendar*)defaultCalendarForNewEvents:(EKEventEditViewController*)controller  {
    EKEventEditViewControllerEventEditViewControllerDefaultCalendarForNewEventsBlock block = [self.eventEditViewControllerDefaultCalendarForNewEventsBlock copy];
    EKCalendar* result = block(controller);
    [block release];
    return result;
}

@end

