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

-(id)delegateblocks {
    UITableViewDelegateBlocks* delegate = [[[UITableViewDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITableViewDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setAccessoryButtonTappedForRowWithIndexPathBlock:(UITableViewAccessoryButtonTappedForRowWithIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setAccessoryButtonTappedForRowWithIndexPathBlock:block];
}

-(void)setDidDeselectRowAtIndexPathBlock:(UITableViewDidDeselectRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setDidDeselectRowAtIndexPathBlock:block];
}

-(void)setDidEndEditingRowAtIndexPathBlock:(UITableViewDidEndEditingRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setDidEndEditingRowAtIndexPathBlock:block];
}

-(void)setDidSelectRowAtIndexPathBlock:(UITableViewDidSelectRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setDidSelectRowAtIndexPathBlock:block];
}

-(void)setEditingStyleForRowAtIndexPathBlock:(UITableViewEditingStyleForRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setEditingStyleForRowAtIndexPathBlock:block];
}

-(void)setHeightForFooterInSectionBlock:(UITableViewHeightForFooterInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setHeightForFooterInSectionBlock:block];
}

-(void)setHeightForHeaderInSectionBlock:(UITableViewHeightForHeaderInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setHeightForHeaderInSectionBlock:block];
}

-(void)setHeightForRowAtIndexPathBlock:(UITableViewHeightForRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setHeightForRowAtIndexPathBlock:block];
}

-(void)setShouldIndentWhileEditingRowAtIndexPathBlock:(UITableViewShouldIndentWhileEditingRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setShouldIndentWhileEditingRowAtIndexPathBlock:block];
}

-(void)setTargetIndexPathForMoveFromRowAtIndexPathBlock:(UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setTargetIndexPathForMoveFromRowAtIndexPathBlock:block];
}

-(void)setTitleForDeleteConfirmationButtonForRowAtIndexPathBlock:(UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setTitleForDeleteConfirmationButtonForRowAtIndexPathBlock:block];
}

-(void)setViewForFooterInSectionBlock:(UITableViewViewForFooterInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setViewForFooterInSectionBlock:block];
}

-(void)setViewForHeaderInSectionBlock:(UITableViewViewForHeaderInSectionBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setViewForHeaderInSectionBlock:block];
}

-(void)setWillBeginEditingRowAtIndexPathBlock:(UITableViewWillBeginEditingRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setWillBeginEditingRowAtIndexPathBlock:block];
}

-(void)setWillDeselectRowAtIndexPathBlock:(UITableViewWillDeselectRowAtIndexPathBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setWillDeselectRowAtIndexPathBlock:block];
}

-(void)setWillDisplayCellBlock:(UITableViewWillDisplayCellBlock)block {
    [((UITableViewDelegateBlocks*)self.delegate) setWillDisplayCellBlock:block];
}

-(void)setWillSelectRowAtIndexPathBlock:(UITableViewWillSelectRowAtIndexPathBlock)block {
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

