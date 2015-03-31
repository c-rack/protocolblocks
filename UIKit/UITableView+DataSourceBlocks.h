//
// protocolblocks: UIKit/UITableView+DataSourceBlocks.h
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

-(id)useBlocksForDataSource;
-(void)onNumberOfSectionsInTableView:(UITableViewNumberOfSectionsInTableViewBlock)block;
-(void)onSectionIndexTitlesForTableView:(UITableViewSectionIndexTitlesForTableViewBlock)block;
-(void)onCanEditRowAtIndexPath:(UITableViewCanEditRowAtIndexPathBlock)block;
-(void)onCanMoveRowAtIndexPath:(UITableViewCanMoveRowAtIndexPathBlock)block;
-(void)onCellForRowAtIndexPath:(UITableViewCellForRowAtIndexPathBlock)block;
-(void)onCommitEditingStyle:(UITableViewCommitEditingStyleBlock)block;
-(void)onMoveRowAtIndexPath:(UITableViewMoveRowAtIndexPathBlock)block;
-(void)onNumberOfRowsInSection:(UITableViewNumberOfRowsInSectionBlock)block;
-(void)onSectionForSectionIndexTitle:(UITableViewSectionForSectionIndexTitleBlock)block;
-(void)onTitleForFooterInSection:(UITableViewTitleForFooterInSectionBlock)block;
-(void)onTitleForHeaderInSection:(UITableViewTitleForHeaderInSectionBlock)block;

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

