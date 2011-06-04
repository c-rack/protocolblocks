//
// protocolblocks: UIKit/UITableView+DelegateBlocks.h
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

typedef void (^UITableViewAccessoryButtonTappedForRowWithIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef void (^UITableViewDidDeselectRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef void (^UITableViewDidEndEditingRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef void (^UITableViewDidSelectRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef UITableViewCellEditingStyle (^UITableViewEditingStyleForRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef CGFloat (^UITableViewHeightForFooterInSectionBlock)(UITableView* tableView, NSInteger section);
typedef CGFloat (^UITableViewHeightForHeaderInSectionBlock)(UITableView* tableView, NSInteger section);
typedef CGFloat (^UITableViewHeightForRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef BOOL (^UITableViewShouldIndentWhileEditingRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef NSIndexPath* (^UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* sourceIndexPath, NSIndexPath* proposedDestinationIndexPath);
typedef NSString* (^UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef UIView* (^UITableViewViewForFooterInSectionBlock)(UITableView* tableView, NSInteger section);
typedef UIView* (^UITableViewViewForHeaderInSectionBlock)(UITableView* tableView, NSInteger section);
typedef void (^UITableViewWillBeginEditingRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef NSIndexPath* (^UITableViewWillDeselectRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef void (^UITableViewWillDisplayCellBlock)(UITableView* tableView, UITableViewCell* cell, NSIndexPath* indexPath);
typedef NSIndexPath* (^UITableViewWillSelectRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);

@interface UITableView (DelegateBlocks)

-(id)delegateBlocks;
-(void)onAccessoryButtonTappedForRowWithIndexPath:(UITableViewAccessoryButtonTappedForRowWithIndexPathBlock)block;
-(void)onDidDeselectRowAtIndexPath:(UITableViewDidDeselectRowAtIndexPathBlock)block;
-(void)onDidEndEditingRowAtIndexPath:(UITableViewDidEndEditingRowAtIndexPathBlock)block;
-(void)onDidSelectRowAtIndexPath:(UITableViewDidSelectRowAtIndexPathBlock)block;
-(void)onEditingStyleForRowAtIndexPath:(UITableViewEditingStyleForRowAtIndexPathBlock)block;
-(void)onHeightForFooterInSection:(UITableViewHeightForFooterInSectionBlock)block;
-(void)onHeightForHeaderInSection:(UITableViewHeightForHeaderInSectionBlock)block;
-(void)onHeightForRowAtIndexPath:(UITableViewHeightForRowAtIndexPathBlock)block;
-(void)onShouldIndentWhileEditingRowAtIndexPath:(UITableViewShouldIndentWhileEditingRowAtIndexPathBlock)block;
-(void)onTargetIndexPathForMoveFromRowAtIndexPath:(UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock)block;
-(void)onTitleForDeleteConfirmationButtonForRowAtIndexPath:(UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock)block;
-(void)onViewForFooterInSection:(UITableViewViewForFooterInSectionBlock)block;
-(void)onViewForHeaderInSection:(UITableViewViewForHeaderInSectionBlock)block;
-(void)onWillBeginEditingRowAtIndexPath:(UITableViewWillBeginEditingRowAtIndexPathBlock)block;
-(void)onWillDeselectRowAtIndexPath:(UITableViewWillDeselectRowAtIndexPathBlock)block;
-(void)onWillDisplayCell:(UITableViewWillDisplayCellBlock)block;
-(void)onWillSelectRowAtIndexPath:(UITableViewWillSelectRowAtIndexPathBlock)block;

@end

@interface UITableViewDelegateBlocks : NSObject <UITableViewDelegate> {
    UITableViewAccessoryButtonTappedForRowWithIndexPathBlock _accessoryButtonTappedForRowWithIndexPathBlock;
    UITableViewDidDeselectRowAtIndexPathBlock _didDeselectRowAtIndexPathBlock;
    UITableViewDidEndEditingRowAtIndexPathBlock _didEndEditingRowAtIndexPathBlock;
    UITableViewDidSelectRowAtIndexPathBlock _didSelectRowAtIndexPathBlock;
    UITableViewEditingStyleForRowAtIndexPathBlock _editingStyleForRowAtIndexPathBlock;
    UITableViewHeightForFooterInSectionBlock _heightForFooterInSectionBlock;
    UITableViewHeightForHeaderInSectionBlock _heightForHeaderInSectionBlock;
    UITableViewHeightForRowAtIndexPathBlock _heightForRowAtIndexPathBlock;
    UITableViewShouldIndentWhileEditingRowAtIndexPathBlock _shouldIndentWhileEditingRowAtIndexPathBlock;
    UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock _targetIndexPathForMoveFromRowAtIndexPathBlock;
    UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock _titleForDeleteConfirmationButtonForRowAtIndexPathBlock;
    UITableViewViewForFooterInSectionBlock _viewForFooterInSectionBlock;
    UITableViewViewForHeaderInSectionBlock _viewForHeaderInSectionBlock;
    UITableViewWillBeginEditingRowAtIndexPathBlock _willBeginEditingRowAtIndexPathBlock;
    UITableViewWillDeselectRowAtIndexPathBlock _willDeselectRowAtIndexPathBlock;
    UITableViewWillDisplayCellBlock _willDisplayCellBlock;
    UITableViewWillSelectRowAtIndexPathBlock _willSelectRowAtIndexPathBlock;
}

@property(nonatomic, copy) UITableViewAccessoryButtonTappedForRowWithIndexPathBlock accessoryButtonTappedForRowWithIndexPathBlock;
@property(nonatomic, copy) UITableViewDidDeselectRowAtIndexPathBlock didDeselectRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewDidEndEditingRowAtIndexPathBlock didEndEditingRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewDidSelectRowAtIndexPathBlock didSelectRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewEditingStyleForRowAtIndexPathBlock editingStyleForRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewHeightForFooterInSectionBlock heightForFooterInSectionBlock;
@property(nonatomic, copy) UITableViewHeightForHeaderInSectionBlock heightForHeaderInSectionBlock;
@property(nonatomic, copy) UITableViewHeightForRowAtIndexPathBlock heightForRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewShouldIndentWhileEditingRowAtIndexPathBlock shouldIndentWhileEditingRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock targetIndexPathForMoveFromRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock titleForDeleteConfirmationButtonForRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewViewForFooterInSectionBlock viewForFooterInSectionBlock;
@property(nonatomic, copy) UITableViewViewForHeaderInSectionBlock viewForHeaderInSectionBlock;
@property(nonatomic, copy) UITableViewWillBeginEditingRowAtIndexPathBlock willBeginEditingRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewWillDeselectRowAtIndexPathBlock willDeselectRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewWillDisplayCellBlock willDisplayCellBlock;
@property(nonatomic, copy) UITableViewWillSelectRowAtIndexPathBlock willSelectRowAtIndexPathBlock;

@end

