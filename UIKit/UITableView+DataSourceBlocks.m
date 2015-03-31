//
// protocolblocks: UIKit/UITableView+DataSourceBlocks.m
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

#import "UITableView+DataSourceBlocks.h"
#import <objc/runtime.h>

static NSString* UITableViewDataSourceBlocksKey = @"UITableViewDataSourceBlocksKey";

@implementation UITableView (DataSourceBlocks)

-(id)useBlocksForDataSource {
    UITableViewDataSourceBlocks* dataSource = [[[UITableViewDataSourceBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITableViewDataSourceBlocksKey, dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dataSource = dataSource;
    return self;
}

-(void)onNumberOfSectionsInTableView:(UITableViewNumberOfSectionsInTableViewBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setNumberOfSectionsInTableViewBlock:block];
}

-(void)onSectionIndexTitlesForTableView:(UITableViewSectionIndexTitlesForTableViewBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setSectionIndexTitlesForTableViewBlock:block];
}

-(void)onCanEditRowAtIndexPath:(UITableViewCanEditRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCanEditRowAtIndexPathBlock:block];
}

-(void)onCanMoveRowAtIndexPath:(UITableViewCanMoveRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCanMoveRowAtIndexPathBlock:block];
}

-(void)onCellForRowAtIndexPath:(UITableViewCellForRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCellForRowAtIndexPathBlock:block];
}

-(void)onCommitEditingStyle:(UITableViewCommitEditingStyleBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCommitEditingStyleBlock:block];
}

-(void)onMoveRowAtIndexPath:(UITableViewMoveRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setMoveRowAtIndexPathBlock:block];
}

-(void)onNumberOfRowsInSection:(UITableViewNumberOfRowsInSectionBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setNumberOfRowsInSectionBlock:block];
}

-(void)onSectionForSectionIndexTitle:(UITableViewSectionForSectionIndexTitleBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setSectionForSectionIndexTitleBlock:block];
}

-(void)onTitleForFooterInSection:(UITableViewTitleForFooterInSectionBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setTitleForFooterInSectionBlock:block];
}

-(void)onTitleForHeaderInSection:(UITableViewTitleForHeaderInSectionBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setTitleForHeaderInSectionBlock:block];
}

@end

@implementation UITableViewDataSourceBlocks

@synthesize numberOfSectionsInTableViewBlock = _numberOfSectionsInTableViewBlock;
@synthesize sectionIndexTitlesForTableViewBlock = _sectionIndexTitlesForTableViewBlock;
@synthesize canEditRowAtIndexPathBlock = _canEditRowAtIndexPathBlock;
@synthesize canMoveRowAtIndexPathBlock = _canMoveRowAtIndexPathBlock;
@synthesize cellForRowAtIndexPathBlock = _cellForRowAtIndexPathBlock;
@synthesize commitEditingStyleBlock = _commitEditingStyleBlock;
@synthesize moveRowAtIndexPathBlock = _moveRowAtIndexPathBlock;
@synthesize numberOfRowsInSectionBlock = _numberOfRowsInSectionBlock;
@synthesize sectionForSectionIndexTitleBlock = _sectionForSectionIndexTitleBlock;
@synthesize titleForFooterInSectionBlock = _titleForFooterInSectionBlock;
@synthesize titleForHeaderInSectionBlock = _titleForHeaderInSectionBlock;

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(numberOfSectionsInTableView:)) ) {
        return !!self.numberOfSectionsInTableViewBlock;
    } else if ( sel_isEqual(aSelector, @selector(sectionIndexTitlesForTableView:)) ) {
        return !!self.sectionIndexTitlesForTableViewBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:canEditRowAtIndexPath:)) ) {
        return !!self.canEditRowAtIndexPathBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:canMoveRowAtIndexPath:)) ) {
        return !!self.canMoveRowAtIndexPathBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:cellForRowAtIndexPath:)) ) {
        return !!self.cellForRowAtIndexPathBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:commitEditingStyle:forRowAtIndexPath:)) ) {
        return !!self.commitEditingStyleBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:moveRowAtIndexPath:toIndexPath:)) ) {
        return !!self.moveRowAtIndexPathBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:numberOfRowsInSection:)) ) {
        return !!self.numberOfRowsInSectionBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:sectionForSectionIndexTitle:atIndex:)) ) {
        return !!self.sectionForSectionIndexTitleBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:titleForFooterInSection:)) ) {
        return !!self.titleForFooterInSectionBlock;
    } else if ( sel_isEqual(aSelector, @selector(tableView:titleForHeaderInSection:)) ) {
        return !!self.titleForHeaderInSectionBlock;
    }
    return [super respondsToSelector:aSelector];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView  {
    UITableViewNumberOfSectionsInTableViewBlock block = [self.numberOfSectionsInTableViewBlock copy];
    NSInteger result = block(tableView);
    [block release];
    return result;
}

-(NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView  {
    UITableViewSectionIndexTitlesForTableViewBlock block = [self.sectionIndexTitlesForTableViewBlock copy];
    NSArray* result = block(tableView);
    [block release];
    return result;
}

-(BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewCanEditRowAtIndexPathBlock block = [self.canEditRowAtIndexPathBlock copy];
    BOOL result = block(tableView, indexPath);
    [block release];
    return result;
}

-(BOOL)tableView:(UITableView*)tableView canMoveRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewCanMoveRowAtIndexPathBlock block = [self.canMoveRowAtIndexPathBlock copy];
    BOOL result = block(tableView, indexPath);
    [block release];
    return result;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewCellForRowAtIndexPathBlock block = [self.cellForRowAtIndexPathBlock copy];
    UITableViewCell* result = block(tableView, indexPath);
    [block release];
    return result;
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath  {
    UITableViewCommitEditingStyleBlock block = [self.commitEditingStyleBlock copy];
    block(tableView, editingStyle, indexPath);
    [block release];
}

-(void)tableView:(UITableView*)tableView moveRowAtIndexPath:(NSIndexPath*)fromIndexPath toIndexPath:(NSIndexPath*)toIndexPath  {
    UITableViewMoveRowAtIndexPathBlock block = [self.moveRowAtIndexPathBlock copy];
    block(tableView, fromIndexPath, toIndexPath);
    [block release];
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section  {
    UITableViewNumberOfRowsInSectionBlock block = [self.numberOfRowsInSectionBlock copy];
    NSInteger result = block(tableView, section);
    [block release];
    return result;
}

-(NSInteger)tableView:(UITableView*)tableView sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index  {
    UITableViewSectionForSectionIndexTitleBlock block = [self.sectionForSectionIndexTitleBlock copy];
    NSInteger result = block(tableView, title, index);
    [block release];
    return result;
}

-(NSString*)tableView:(UITableView*)tableView titleForFooterInSection:(NSInteger)section  {
    UITableViewTitleForFooterInSectionBlock block = [self.titleForFooterInSectionBlock copy];
    NSString* result = block(tableView, section);
    [block release];
    return result;
}

-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section  {
    UITableViewTitleForHeaderInSectionBlock block = [self.titleForHeaderInSectionBlock copy];
    NSString* result = block(tableView, section);
    [block release];
    return result;
}

@end

