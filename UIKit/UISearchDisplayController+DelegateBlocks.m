//
// protocolblocks: UIKit/UISearchDisplayController+DelegateBlocks.m
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

#import "UISearchDisplayController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UISearchDisplayControllerDelegateBlocksKey = @"UISearchDisplayControllerDelegateBlocksKey";

@implementation UISearchDisplayController (DelegateBlocks)

-(id)delegateBlocks {
    UISearchDisplayControllerDelegateBlocks* delegate = [[[UISearchDisplayControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UISearchDisplayControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onDidHideSearchResultsTableView:(UISearchDisplayControllerDidHideSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidHideSearchResultsTableViewBlock:block];
}

-(void)onDidLoadSearchResultsTableView:(UISearchDisplayControllerDidLoadSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidLoadSearchResultsTableViewBlock:block];
}

-(void)onDidShowSearchResultsTableView:(UISearchDisplayControllerDidShowSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidShowSearchResultsTableViewBlock:block];
}

-(void)onShouldReloadTableForSearchScope:(UISearchDisplayControllerShouldReloadTableForSearchScopeBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setShouldReloadTableForSearchScopeBlock:block];
}

-(void)onShouldReloadTableForSearchString:(UISearchDisplayControllerShouldReloadTableForSearchStringBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setShouldReloadTableForSearchStringBlock:block];
}

-(void)onWillHideSearchResultsTableView:(UISearchDisplayControllerWillHideSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillHideSearchResultsTableViewBlock:block];
}

-(void)onWillShowSearchResultsTableView:(UISearchDisplayControllerWillShowSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillShowSearchResultsTableViewBlock:block];
}

-(void)onWillUnloadSearchResultsTableView:(UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillUnloadSearchResultsTableViewBlock:block];
}

-(void)onDidBeginSearch:(UISearchDisplayControllerDidBeginSearchBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidBeginSearchBlock:block];
}

-(void)onDidEndSearch:(UISearchDisplayControllerDidEndSearchBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidEndSearchBlock:block];
}

-(void)onWillBeginSearch:(UISearchDisplayControllerWillBeginSearchBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillBeginSearchBlock:block];
}

-(void)onWillEndSearch:(UISearchDisplayControllerWillEndSearchBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillEndSearchBlock:block];
}

@end

@implementation UISearchDisplayControllerDelegateBlocks

@synthesize didHideSearchResultsTableViewBlock = _didHideSearchResultsTableViewBlock;
@synthesize didLoadSearchResultsTableViewBlock = _didLoadSearchResultsTableViewBlock;
@synthesize didShowSearchResultsTableViewBlock = _didShowSearchResultsTableViewBlock;
@synthesize shouldReloadTableForSearchScopeBlock = _shouldReloadTableForSearchScopeBlock;
@synthesize shouldReloadTableForSearchStringBlock = _shouldReloadTableForSearchStringBlock;
@synthesize willHideSearchResultsTableViewBlock = _willHideSearchResultsTableViewBlock;
@synthesize willShowSearchResultsTableViewBlock = _willShowSearchResultsTableViewBlock;
@synthesize willUnloadSearchResultsTableViewBlock = _willUnloadSearchResultsTableViewBlock;
@synthesize didBeginSearchBlock = _didBeginSearchBlock;
@synthesize didEndSearchBlock = _didEndSearchBlock;
@synthesize willBeginSearchBlock = _willBeginSearchBlock;
@synthesize willEndSearchBlock = _willEndSearchBlock;

-(void)searchDisplayController:(UISearchDisplayController*)controller didHideSearchResultsTableView:(UITableView*)tableView  {
    UISearchDisplayControllerDidHideSearchResultsTableViewBlock block = [self.didHideSearchResultsTableViewBlock copy];
    block(controller, tableView);
    [block release];
}

-(void)searchDisplayController:(UISearchDisplayController*)controller didLoadSearchResultsTableView:(UITableView*)tableView  {
    UISearchDisplayControllerDidLoadSearchResultsTableViewBlock block = [self.didLoadSearchResultsTableViewBlock copy];
    block(controller, tableView);
    [block release];
}

-(void)searchDisplayController:(UISearchDisplayController*)controller didShowSearchResultsTableView:(UITableView*)tableView  {
    UISearchDisplayControllerDidShowSearchResultsTableViewBlock block = [self.didShowSearchResultsTableViewBlock copy];
    block(controller, tableView);
    [block release];
}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchScope:(NSInteger)searchOption  {
    UISearchDisplayControllerShouldReloadTableForSearchScopeBlock block = [self.shouldReloadTableForSearchScopeBlock copy];
    BOOL result = block(controller, searchOption);
    [block release];
    return result;
}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString*)searchString  {
    UISearchDisplayControllerShouldReloadTableForSearchStringBlock block = [self.shouldReloadTableForSearchStringBlock copy];
    BOOL result = block(controller, searchString);
    [block release];
    return result;
}

-(void)searchDisplayController:(UISearchDisplayController*)controller willHideSearchResultsTableView:(UITableView*)tableView  {
    UISearchDisplayControllerWillHideSearchResultsTableViewBlock block = [self.willHideSearchResultsTableViewBlock copy];
    block(controller, tableView);
    [block release];
}

-(void)searchDisplayController:(UISearchDisplayController*)controller willShowSearchResultsTableView:(UITableView*)tableView  {
    UISearchDisplayControllerWillShowSearchResultsTableViewBlock block = [self.willShowSearchResultsTableViewBlock copy];
    block(controller, tableView);
    [block release];
}

-(void)searchDisplayController:(UISearchDisplayController*)controller willUnloadSearchResultsTableView:(UITableView*)tableView  {
    UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock block = [self.willUnloadSearchResultsTableViewBlock copy];
    block(controller, tableView);
    [block release];
}

-(void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController*)controller  {
    UISearchDisplayControllerDidBeginSearchBlock block = [self.didBeginSearchBlock copy];
    block(controller);
    [block release];
}

-(void)searchDisplayControllerDidEndSearch:(UISearchDisplayController*)controller  {
    UISearchDisplayControllerDidEndSearchBlock block = [self.didEndSearchBlock copy];
    block(controller);
    [block release];
}

-(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController*)controller  {
    UISearchDisplayControllerWillBeginSearchBlock block = [self.willBeginSearchBlock copy];
    block(controller);
    [block release];
}

-(void)searchDisplayControllerWillEndSearch:(UISearchDisplayController*)controller  {
    UISearchDisplayControllerWillEndSearchBlock block = [self.willEndSearchBlock copy];
    block(controller);
    [block release];
}

@end

