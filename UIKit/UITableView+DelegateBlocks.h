//
// ProtocolBlocks: UIKit/UITableView+DelegateBlocks.h
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

-(id)delegateblocks;
-(void)setAccessoryButtonTappedForRowWithIndexPathBlock:(UITableViewAccessoryButtonTappedForRowWithIndexPathBlock)block;
-(void)setDidDeselectRowAtIndexPathBlock:(UITableViewDidDeselectRowAtIndexPathBlock)block;
-(void)setDidEndEditingRowAtIndexPathBlock:(UITableViewDidEndEditingRowAtIndexPathBlock)block;
-(void)setDidSelectRowAtIndexPathBlock:(UITableViewDidSelectRowAtIndexPathBlock)block;
-(void)setEditingStyleForRowAtIndexPathBlock:(UITableViewEditingStyleForRowAtIndexPathBlock)block;
-(void)setHeightForFooterInSectionBlock:(UITableViewHeightForFooterInSectionBlock)block;
-(void)setHeightForHeaderInSectionBlock:(UITableViewHeightForHeaderInSectionBlock)block;
-(void)setHeightForRowAtIndexPathBlock:(UITableViewHeightForRowAtIndexPathBlock)block;
-(void)setShouldIndentWhileEditingRowAtIndexPathBlock:(UITableViewShouldIndentWhileEditingRowAtIndexPathBlock)block;
-(void)setTargetIndexPathForMoveFromRowAtIndexPathBlock:(UITableViewTargetIndexPathForMoveFromRowAtIndexPathBlock)block;
-(void)setTitleForDeleteConfirmationButtonForRowAtIndexPathBlock:(UITableViewTitleForDeleteConfirmationButtonForRowAtIndexPathBlock)block;
-(void)setViewForFooterInSectionBlock:(UITableViewViewForFooterInSectionBlock)block;
-(void)setViewForHeaderInSectionBlock:(UITableViewViewForHeaderInSectionBlock)block;
-(void)setWillBeginEditingRowAtIndexPathBlock:(UITableViewWillBeginEditingRowAtIndexPathBlock)block;
-(void)setWillDeselectRowAtIndexPathBlock:(UITableViewWillDeselectRowAtIndexPathBlock)block;
-(void)setWillDisplayCellBlock:(UITableViewWillDisplayCellBlock)block;
-(void)setWillSelectRowAtIndexPathBlock:(UITableViewWillSelectRowAtIndexPathBlock)block;

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

