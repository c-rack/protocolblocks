//
// ProtocolBlocks: UIKit/UISearchDisplayController+DelegateBlocks.m
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

#import "UISearchDisplayController+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UISearchDisplayControllerDelegateBlocksKey = @"UISearchDisplayControllerDelegateBlocksKey";

@implementation UISearchDisplayController (DelegateBlocks)

-(id)delegateblocks {
    UISearchDisplayControllerDelegateBlocks* delegate = [[[UISearchDisplayControllerDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UISearchDisplayControllerDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setDidHideSearchResultsTableViewBlock:(UISearchDisplayControllerDidHideSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidHideSearchResultsTableViewBlock:block];
}

-(void)setDidLoadSearchResultsTableViewBlock:(UISearchDisplayControllerDidLoadSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidLoadSearchResultsTableViewBlock:block];
}

-(void)setDidShowSearchResultsTableViewBlock:(UISearchDisplayControllerDidShowSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidShowSearchResultsTableViewBlock:block];
}

-(void)setShouldReloadTableForSearchScopeBlock:(UISearchDisplayControllerShouldReloadTableForSearchScopeBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setShouldReloadTableForSearchScopeBlock:block];
}

-(void)setShouldReloadTableForSearchStringBlock:(UISearchDisplayControllerShouldReloadTableForSearchStringBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setShouldReloadTableForSearchStringBlock:block];
}

-(void)setWillHideSearchResultsTableViewBlock:(UISearchDisplayControllerWillHideSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillHideSearchResultsTableViewBlock:block];
}

-(void)setWillShowSearchResultsTableViewBlock:(UISearchDisplayControllerWillShowSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillShowSearchResultsTableViewBlock:block];
}

-(void)setWillUnloadSearchResultsTableViewBlock:(UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillUnloadSearchResultsTableViewBlock:block];
}

-(void)setDidBeginSearchBlock:(UISearchDisplayControllerDidBeginSearchBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidBeginSearchBlock:block];
}

-(void)setDidEndSearchBlock:(UISearchDisplayControllerDidEndSearchBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setDidEndSearchBlock:block];
}

-(void)setWillBeginSearchBlock:(UISearchDisplayControllerWillBeginSearchBlock)block {
    [((UISearchDisplayControllerDelegateBlocks*)self.delegate) setWillBeginSearchBlock:block];
}

-(void)setWillEndSearchBlock:(UISearchDisplayControllerWillEndSearchBlock)block {
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

