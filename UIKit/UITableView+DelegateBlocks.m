//
// protocolblocks: UIKit/UITableView+DelegateBlocks.m
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

#import "UITableView+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UITableViewDelegateBlocksKey = @"UITableViewDelegateBlocksKey";

@implementation UITableView (DelegateBlocks)

-(id)useBlocksForDelegate {
    UITableViewDelegateBlocks* delegate = [[[UITableViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITableViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onAccessoryButtonTappedForRowWithIndexPath:(UITableViewAccessoryButtonTappedForRowWithIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setAccessoryButtonTappedForRowWithIndexPathBlock:block];
}

-(void)onDidDeselectRowAtIndexPath:(UITableViewDidDeselectRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setDidDeselectRowAtIndexPathBlock:block];
}

-(void)onDidEndEditingRowAtIndexPath:(UITableViewDidEndEditingRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setDidEndEditingRowAtIndexPathBlock:block];
}

-(void)onDidSelectRowAtIndexPath:(UITableViewDidSelectRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setDidSelectRowAtIndexPathBlock:block];
}

-(void)onEditingStyleForRowAtIndexPath:(UITableViewEditingStyleForRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setEditingStyleForRowAtIndexPathBlock:block];
}

-(void)onHeightForFooterInSection:(UITableViewHeightForFooterInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setHeightForFooterInSectionBlock:block];
}

-(void)onHeightForHeaderInSection:(UITableViewHeightForHeaderInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setHeightForHeaderInSectionBlock:block];
}

-(void)onHeightForRowAtIndexPath:(UITableViewHeightForRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setHeightForRowAtIndexPathBlock:block];
}

-(void)onShouldIndentWhileEditingRowAtIndexPath:(UITableViewShouldIndentWhileEditingRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setShouldIndentWhileEditingRowAtIndexPathBlock:block];
}

-(void)onTargetIndexPathForMoveFromRowAtIndexPath:(UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setTargetIndexPathForMoveFromRowAtIndexPathBlock:block];
}

-(void)onTitleForDeleteConfirmationButtonForRowAtIndexPath:(UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setTitleForDeleteConfirmationButtonForRowAtIndexPathBlock:block];
}

-(void)onViewForFooterInSection:(UITableViewViewForFooterInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setViewForFooterInSectionBlock:block];
}

-(void)onViewForHeaderInSection:(UITableViewViewForHeaderInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setViewForHeaderInSectionBlock:block];
}

-(void)onWillBeginEditingRowAtIndexPath:(UITableViewWillBeginEditingRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setWillBeginEditingRowAtIndexPathBlock:block];
}

-(void)onWillDeselectRowAtIndexPath:(UITableViewWillDeselectRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setWillDeselectRowAtIndexPathBlock:block];
}

-(void)onWillDisplayCell:(UITableViewWillDisplayCellBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setWillDisplayCellBlock:block];
}

-(void)onWillSelectRowAtIndexPath:(UITableViewWillSelectRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setWillSelectRowAtIndexPathBlock:block];
}

@end

@implementation UITableViewDelegateBlocks

@synthesize accessoryButtonTappedForRowWithIndexPathBlock = _accessoryButtonTappedForRowWithIndexPathBlock;
@synthesize didDeselectRowAtIndexPathBlock = _didDeselectRowAtIndexPathBlock;
@synthesize didEndEditingRowAtIndexPathBlock = _didEndEditingRowAtIndexPathBlock;
@synthesize didSelectRowAtIndexPathBlock = _didSelectRowAtIndexPathBlock;
@synthesize editingStyleForRowAtIndexPathBlock = _editingStyleForRowAtIndexPathBlock;
@synthesize heightForFooterInSectionBlock = _heightForFooterInSectionBlock;
@synthesize heightForHeaderInSectionBlock = _heightForHeaderInSectionBlock;
@synthesize heightForRowAtIndexPathBlock = _heightForRowAtIndexPathBlock;
@synthesize shouldIndentWhileEditingRowAtIndexPathBlock = _shouldIndentWhileEditingRowAtIndexPathBlock;
@synthesize targetIndexPathForMoveFromRowAtIndexPathBlock = _targetIndexPathForMoveFromRowAtIndexPathBlock;
@synthesize titleForDeleteConfirmationButtonForRowAtIndexPathBlock = _titleForDeleteConfirmationButtonForRowAtIndexPathBlock;
@synthesize viewForFooterInSectionBlock = _viewForFooterInSectionBlock;
@synthesize viewForHeaderInSectionBlock = _viewForHeaderInSectionBlock;
@synthesize willBeginEditingRowAtIndexPathBlock = _willBeginEditingRowAtIndexPathBlock;
@synthesize willDeselectRowAtIndexPathBlock = _willDeselectRowAtIndexPathBlock;
@synthesize willDisplayCellBlock = _willDisplayCellBlock;
@synthesize willSelectRowAtIndexPathBlock = _willSelectRowAtIndexPathBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( aSelector == @selector(tableView:accessoryButtonTappedForRowWithIndexPath:) ) {
        return !!self.accessoryButtonTappedForRowWithIndexPathBlock;
    } else if ( aSelector == @selector(tableView:didDeselectRowAtIndexPath:) ) {
        return !!self.didDeselectRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:didEndEditingRowAtIndexPath:) ) {
        return !!self.didEndEditingRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:didSelectRowAtIndexPath:) ) {
        return !!self.didSelectRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:editingStyleForRowAtIndexPath:) ) {
        return !!self.editingStyleForRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:heightForFooterInSection:) ) {
        return !!self.heightForFooterInSectionBlock;
    } else if ( aSelector == @selector(tableView:heightForHeaderInSection:) ) {
        return !!self.heightForHeaderInSectionBlock;
    } else if ( aSelector == @selector(tableView:heightForRowAtIndexPath:) ) {
        return !!self.heightForRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:shouldIndentWhileEditingRowAtIndexPath:) ) {
        return !!self.shouldIndentWhileEditingRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:) ) {
        return !!self.targetIndexPathForMoveFromRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:) ) {
        return !!self.titleForDeleteConfirmationButtonForRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:viewForFooterInSection:) ) {
        return !!self.viewForFooterInSectionBlock;
    } else if ( aSelector == @selector(tableView:viewForHeaderInSection:) ) {
        return !!self.viewForHeaderInSectionBlock;
    } else if ( aSelector == @selector(tableView:willBeginEditingRowAtIndexPath:) ) {
        return !!self.willBeginEditingRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:willDeselectRowAtIndexPath:) ) {
        return !!self.willDeselectRowAtIndexPathBlock;
    } else if ( aSelector == @selector(tableView:willDisplayCell:forRowAtIndexPath:) ) {
        return !!self.willDisplayCellBlock;
    } else if ( aSelector == @selector(tableView:willSelectRowAtIndexPath:) ) {
        return !!self.willSelectRowAtIndexPathBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath  {
    UITableViewAccessoryButtonTappedForRowWithIndexPathBlock block = [self.accessoryButtonTappedForRowWithIndexPathBlock copy];
    block(tableView, indexPath);
    [block release];
}

-(void)tableView:(UITableView*)tableView didDeselectRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewDidDeselectRowAtIndexPathBlock block = [self.didDeselectRowAtIndexPathBlock copy];
    block(tableView, indexPath);
    [block release];
}

-(void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewDidEndEditingRowAtIndexPathBlock block = [self.didEndEditingRowAtIndexPathBlock copy];
    block(tableView, indexPath);
    [block release];
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewDidSelectRowAtIndexPathBlock block = [self.didSelectRowAtIndexPathBlock copy];
    block(tableView, indexPath);
    [block release];
}

-(UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewEditingStyleForRowAtIndexPathBlock block = [self.editingStyleForRowAtIndexPathBlock copy];
    UITableViewCellEditingStyle result = block(tableView, indexPath);
    [block release];
    return result;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section  {
    UITableViewHeightForFooterInSectionBlock block = [self.heightForFooterInSectionBlock copy];
    CGFloat result = block(tableView, section);
    [block release];
    return result;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section  {
    UITableViewHeightForHeaderInSectionBlock block = [self.heightForHeaderInSectionBlock copy];
    CGFloat result = block(tableView, section);
    [block release];
    return result;
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewHeightForRowAtIndexPathBlock block = [self.heightForRowAtIndexPathBlock copy];
    CGFloat result = block(tableView, indexPath);
    [block release];
    return result;
}

-(BOOL)tableView:(UITableView*)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewShouldIndentWhileEditingRowAtIndexPathBlock block = [self.shouldIndentWhileEditingRowAtIndexPathBlock copy];
    BOOL result = block(tableView, indexPath);
    [block release];
    return result;
}

-(NSIndexPath*)tableView:(UITableView*)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath*)sourceIndexPath toProposedIndexPath:(NSIndexPath*)proposedDestinationIndexPath  {
    UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock block = [self.targetIndexPathForMoveFromRowAtIndexPathBlock copy];
    NSIndexPath* result = block(tableView, sourceIndexPath, proposedDestinationIndexPath);
    [block release];
    return result;
}

-(NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock block = [self.titleForDeleteConfirmationButtonForRowAtIndexPathBlock copy];
    NSString* result = block(tableView, indexPath);
    [block release];
    return result;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section  {
    UITableViewViewForFooterInSectionBlock block = [self.viewForFooterInSectionBlock copy];
    UIView* result = block(tableView, section);
    [block release];
    return result;
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section  {
    UITableViewViewForHeaderInSectionBlock block = [self.viewForHeaderInSectionBlock copy];
    UIView* result = block(tableView, section);
    [block release];
    return result;
}

-(void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewWillBeginEditingRowAtIndexPathBlock block = [self.willBeginEditingRowAtIndexPathBlock copy];
    block(tableView, indexPath);
    [block release];
}

-(NSIndexPath*)tableView:(UITableView*)tableView willDeselectRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewWillDeselectRowAtIndexPathBlock block = [self.willDeselectRowAtIndexPathBlock copy];
    NSIndexPath* result = block(tableView, indexPath);
    [block release];
    return result;
}

-(void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewWillDisplayCellBlock block = [self.willDisplayCellBlock copy];
    block(tableView, cell, indexPath);
    [block release];
}

-(NSIndexPath*)tableView:(UITableView*)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewWillSelectRowAtIndexPathBlock block = [self.willSelectRowAtIndexPathBlock copy];
    NSIndexPath* result = block(tableView, indexPath);
    [block release];
    return result;
}

@end

