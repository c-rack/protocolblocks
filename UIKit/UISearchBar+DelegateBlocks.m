//
// ProtocolBlocks: UIKit/UISearchBar+DelegateBlocks.m
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

#import "UISearchBar+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UISearchBarDelegateBlocksKey = @"UISearchBarDelegateBlocksKey";

@implementation UISearchBar (DelegateBlocks)

-(id)delegateblocks {
    UISearchBarDelegateBlocks* delegate = [[[UISearchBarDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UISearchBarDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)setSelectedScopeButtonIndexDidChangeBlock:(UISearchBarSelectedScopeButtonIndexDidChangeBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setSelectedScopeButtonIndexDidChangeBlock:block];
}

-(void)setShouldChangeTextInRangeBlock:(UISearchBarShouldChangeTextInRangeBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setShouldChangeTextInRangeBlock:block];
}

-(void)setTextDidChangeBlock:(UISearchBarTextDidChangeBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setTextDidChangeBlock:block];
}

-(void)setBookmarkButtonClickedBlock:(UISearchBarBookmarkButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setBookmarkButtonClickedBlock:block];
}

-(void)setCancelButtonClickedBlock:(UISearchBarCancelButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setCancelButtonClickedBlock:block];
}

-(void)setResultsListButtonClickedBlock:(UISearchBarResultsListButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setResultsListButtonClickedBlock:block];
}

-(void)setSearchButtonClickedBlock:(UISearchBarSearchButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setSearchButtonClickedBlock:block];
}

-(void)setShouldBeginEditingBlock:(UISearchBarShouldBeginEditingBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setShouldBeginEditingBlock:block];
}

-(void)setShouldEndEditingBlock:(UISearchBarShouldEndEditingBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setShouldEndEditingBlock:block];
}

-(void)setTextDidBeginEditingBlock:(UISearchBarTextDidBeginEditingBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setTextDidBeginEditingBlock:block];
}

-(void)setTextDidEndEditingBlock:(UISearchBarTextDidEndEditingBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setTextDidEndEditingBlock:block];
}

@end

@implementation UISearchBarDelegateBlocks

@synthesize selectedScopeButtonIndexDidChangeBlock = _selectedScopeButtonIndexDidChangeBlock;
@synthesize shouldChangeTextInRangeBlock = _shouldChangeTextInRangeBlock;
@synthesize textDidChangeBlock = _textDidChangeBlock;
@synthesize bookmarkButtonClickedBlock = _bookmarkButtonClickedBlock;
@synthesize cancelButtonClickedBlock = _cancelButtonClickedBlock;
@synthesize resultsListButtonClickedBlock = _resultsListButtonClickedBlock;
@synthesize searchButtonClickedBlock = _searchButtonClickedBlock;
@synthesize shouldBeginEditingBlock = _shouldBeginEditingBlock;
@synthesize shouldEndEditingBlock = _shouldEndEditingBlock;
@synthesize textDidBeginEditingBlock = _textDidBeginEditingBlock;
@synthesize textDidEndEditingBlock = _textDidEndEditingBlock;

-(void)searchBar:(UISearchBar*)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope  {
    UISearchBarSelectedScopeButtonIndexDidChangeBlock block = [self.selectedScopeButtonIndexDidChangeBlock copy];
    block(searchBar, selectedScope);
    [block release];
}

-(BOOL)searchBar:(UISearchBar*)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text  {
    UISearchBarShouldChangeTextInRangeBlock block = [self.shouldChangeTextInRangeBlock copy];
    BOOL result = block(searchBar, range, text);
    [block release];
    return result;
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText  {
    UISearchBarTextDidChangeBlock block = [self.textDidChangeBlock copy];
    block(searchBar, searchText);
    [block release];
}

-(void)searchBarBookmarkButtonClicked:(UISearchBar*)searchBar  {
    UISearchBarBookmarkButtonClickedBlock block = [self.bookmarkButtonClickedBlock copy];
    block(searchBar);
    [block release];
}

-(void)searchBarCancelButtonClicked:(UISearchBar*)searchBar  {
    UISearchBarCancelButtonClickedBlock block = [self.cancelButtonClickedBlock copy];
    block(searchBar);
    [block release];
}

-(void)searchBarResultsListButtonClicked:(UISearchBar*)searchBar  {
    UISearchBarResultsListButtonClickedBlock block = [self.resultsListButtonClickedBlock copy];
    block(searchBar);
    [block release];
}

-(void)searchBarSearchButtonClicked:(UISearchBar*)searchBar  {
    UISearchBarSearchButtonClickedBlock block = [self.searchButtonClickedBlock copy];
    block(searchBar);
    [block release];
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar*)searchBar  {
    UISearchBarShouldBeginEditingBlock block = [self.shouldBeginEditingBlock copy];
    BOOL result = block(searchBar);
    [block release];
    return result;
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar*)searchBar  {
    UISearchBarShouldEndEditingBlock block = [self.shouldEndEditingBlock copy];
    BOOL result = block(searchBar);
    [block release];
    return result;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar*)searchBar  {
    UISearchBarTextDidBeginEditingBlock block = [self.textDidBeginEditingBlock copy];
    block(searchBar);
    [block release];
}

-(void)searchBarTextDidEndEditing:(UISearchBar*)searchBar  {
    UISearchBarTextDidEndEditingBlock block = [self.textDidEndEditingBlock copy];
    block(searchBar);
    [block release];
}


@end

