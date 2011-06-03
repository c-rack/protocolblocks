//
// ProtocolBlocks: UIKit/UITableView+DataSourceBlocks.h
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

typedef NSInteger (^UITableViewNumberOfSectionsInTableViewBlock)(UITableView* tableView);
typedef NSArray* (^UITableViewSectionIndexTitlesForTableViewBlock)(UITableView* tableView);
typedef BOOL (^UITableViewCanEditRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef BOOL (^UITableViewCanMoveRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef UITableViewCell* (^UITableViewCellForRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* indexPath);
typedef void (^UITableViewCommitEditingStyleBlock)(UITableView* tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath* indexPath);
typedef void (^UITableViewMoveRowAtIndexPathBlock)(UITableView* tableView, NSIndexPath* fromIndexPath, NSIndexPath* toIndexPath);
typedef NSInteger (^UITableViewNumberOfRowsInSectionBlock)(UITableView* tableView, NSInteger section);
typedef NSInteger (^UITableViewSectionForSectionIndexTitleBlock)(UITableView* tableView, NSString* title, NSInteger index);
typedef NSString* (^UITableViewTitleForFooterInSectionBlock)(UITableView* tableView, NSInteger section);
typedef NSString* (^UITableViewTitleForHeaderInSectionBlock)(UITableView* tableView, NSInteger section);

@interface UITableView (DataSourceBlocks)

-(id)datasourceblocks;
-(void)setNumberOfSectionsInTableViewBlock:(UITableViewNumberOfSectionsInTableViewBlock)block;
-(void)setSectionIndexTitlesForTableViewBlock:(UITableViewSectionIndexTitlesForTableViewBlock)block;
-(void)setCanEditRowAtIndexPathBlock:(UITableViewCanEditRowAtIndexPathBlock)block;
-(void)setCanMoveRowAtIndexPathBlock:(UITableViewCanMoveRowAtIndexPathBlock)block;
-(void)setCellForRowAtIndexPathBlock:(UITableViewCellForRowAtIndexPathBlock)block;
-(void)setCommitEditingStyleBlock:(UITableViewCommitEditingStyleBlock)block;
-(void)setMoveRowAtIndexPathBlock:(UITableViewMoveRowAtIndexPathBlock)block;
-(void)setNumberOfRowsInSectionBlock:(UITableViewNumberOfRowsInSectionBlock)block;
-(void)setSectionForSectionIndexTitleBlock:(UITableViewSectionForSectionIndexTitleBlock)block;
-(void)setTitleForFooterInSectionBlock:(UITableViewTitleForFooterInSectionBlock)block;
-(void)setTitleForHeaderInSectionBlock:(UITableViewTitleForHeaderInSectionBlock)block;

@end

@interface UITableViewDataSourceBlocks : NSObject <UITableViewDataSource> {
    UITableViewNumberOfSectionsInTableViewBlock _numberOfSectionsInTableViewBlock;
    UITableViewSectionIndexTitlesForTableViewBlock _sectionIndexTitlesForTableViewBlock;
    UITableViewCanEditRowAtIndexPathBlock _canEditRowAtIndexPathBlock;
    UITableViewCanMoveRowAtIndexPathBlock _canMoveRowAtIndexPathBlock;
    UITableViewCellForRowAtIndexPathBlock _cellForRowAtIndexPathBlock;
    UITableViewCommitEditingStyleBlock _commitEditingStyleBlock;
    UITableViewMoveRowAtIndexPathBlock _moveRowAtIndexPathBlock;
    UITableViewNumberOfRowsInSectionBlock _numberOfRowsInSectionBlock;
    UITableViewSectionForSectionIndexTitleBlock _sectionForSectionIndexTitleBlock;
    UITableViewTitleForFooterInSectionBlock _titleForFooterInSectionBlock;
    UITableViewTitleForHeaderInSectionBlock _titleForHeaderInSectionBlock;
}

@property(nonatomic, copy) UITableViewNumberOfSectionsInTableViewBlock numberOfSectionsInTableViewBlock;
@property(nonatomic, copy) UITableViewSectionIndexTitlesForTableViewBlock sectionIndexTitlesForTableViewBlock;
@property(nonatomic, copy) UITableViewCanEditRowAtIndexPathBlock canEditRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewCanMoveRowAtIndexPathBlock canMoveRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewCellForRowAtIndexPathBlock cellForRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewCommitEditingStyleBlock commitEditingStyleBlock;
@property(nonatomic, copy) UITableViewMoveRowAtIndexPathBlock moveRowAtIndexPathBlock;
@property(nonatomic, copy) UITableViewNumberOfRowsInSectionBlock numberOfRowsInSectionBlock;
@property(nonatomic, copy) UITableViewSectionForSectionIndexTitleBlock sectionForSectionIndexTitleBlock;
@property(nonatomic, copy) UITableViewTitleForFooterInSectionBlock titleForFooterInSectionBlock;
@property(nonatomic, copy) UITableViewTitleForHeaderInSectionBlock titleForHeaderInSectionBlock;

@end

