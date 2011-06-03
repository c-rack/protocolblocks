//
// ProtocolBlocks: UIKit/UITableView+DataSourceBlocks.m
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

#import "UITableView+DataSourceBlocks.h"
#import <objc/runtime.h>

static NSString* UITableViewDataSourceBlocksKey = @"UITableViewDataSourceBlocksKey";

@implementation UITableView (DataSourceBlocks)

-(id)datasourceblocks {
    UITableViewDataSourceBlocks* dataSource = [[[UITableViewDataSourceBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UITableViewDataSourceBlocksKey, dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dataSource = dataSource;
    return self;
}

-(void)setNumberOfSectionsInTableViewBlock:(UITableViewNumberOfSectionsInTableViewBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setNumberOfSectionsInTableViewBlock:block];
}

-(void)setSectionIndexTitlesForTableViewBlock:(UITableViewSectionIndexTitlesForTableViewBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setSectionIndexTitlesForTableViewBlock:block];
}

-(void)setCanEditRowAtIndexPathBlock:(UITableViewCanEditRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCanEditRowAtIndexPathBlock:block];
}

-(void)setCanMoveRowAtIndexPathBlock:(UITableViewCanMoveRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCanMoveRowAtIndexPathBlock:block];
}

-(void)setCellForRowAtIndexPathBlock:(UITableViewCellForRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCellForRowAtIndexPathBlock:block];
}

-(void)setCommitEditingStyleBlock:(UITableViewCommitEditingStyleBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setCommitEditingStyleBlock:block];
}

-(void)setMoveRowAtIndexPathBlock:(UITableViewMoveRowAtIndexPathBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setMoveRowAtIndexPathBlock:block];
}

-(void)setNumberOfRowsInSectionBlock:(UITableViewNumberOfRowsInSectionBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setNumberOfRowsInSectionBlock:block];
}

-(void)setSectionForSectionIndexTitleBlock:(UITableViewSectionForSectionIndexTitleBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setSectionForSectionIndexTitleBlock:block];
}

-(void)setTitleForFooterInSectionBlock:(UITableViewTitleForFooterInSectionBlock)block {
    [((UITableViewDataSourceBlocks*)self.dataSource) setTitleForFooterInSectionBlock:block];
}

-(void)setTitleForHeaderInSectionBlock:(UITableViewTitleForHeaderInSectionBlock)block {
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

