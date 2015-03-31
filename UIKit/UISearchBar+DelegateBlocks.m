//
// protocolblocks: UIKit/UISearchBar+DelegateBlocks.m
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

#import "UISearchBar+DelegateBlocks.h"
#import <objc/runtime.h>

static NSString* UISearchBarDelegateBlocksKey = @"UISearchBarDelegateBlocksKey";

@implementation UISearchBar (DelegateBlocks)

-(id)useBlocksForDelegate {
    UISearchBarDelegateBlocks* delegate = [[[UISearchBarDelegateBlocks alloc] init] autorelease];
    objc_setAssociatedObject (self, &UISearchBarDelegateBlocksKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = delegate;
    return self;
}

-(void)onSelectedScopeButtonIndexDidChange:(UISearchBarSelectedScopeButtonIndexDidChangeBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setSelectedScopeButtonIndexDidChangeBlock:block];
}

-(void)onShouldChangeTextInRange:(UISearchBarShouldChangeTextInRangeBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setShouldChangeTextInRangeBlock:block];
}

-(void)onTextDidChange:(UISearchBarTextDidChangeBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setTextDidChangeBlock:block];
}

-(void)onBookmarkButtonClicked:(UISearchBarBookmarkButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setBookmarkButtonClickedBlock:block];
}

-(void)onCancelButtonClicked:(UISearchBarCancelButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setCancelButtonClickedBlock:block];
}

-(void)onResultsListButtonClicked:(UISearchBarResultsListButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setResultsListButtonClickedBlock:block];
}

-(void)onSearchButtonClicked:(UISearchBarSearchButtonClickedBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setSearchButtonClickedBlock:block];
}

-(void)onShouldBeginEditing:(UISearchBarShouldBeginEditingBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setShouldBeginEditingBlock:block];
}

-(void)onShouldEndEditing:(UISearchBarShouldEndEditingBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setShouldEndEditingBlock:block];
}

-(void)onTextDidBeginEditing:(UISearchBarTextDidBeginEditingBlock)block {
    [((UISearchBarDelegateBlocks*)self.delegate) setTextDidBeginEditingBlock:block];
}

-(void)onTextDidEndEditing:(UISearchBarTextDidEndEditingBlock)block {
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

-(BOOL)respondsToSelector:(SEL)aSelector {
    if ( sel_isEqual(aSelector, @selector(searchBar:selectedScopeButtonIndexDidChange:)) ) {
        return !!self.selectedScopeButtonIndexDidChangeBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBar:shouldChangeTextInRange:replacementText:)) ) {
        return !!self.shouldChangeTextInRangeBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBar:textDidChange:)) ) {
        return !!self.textDidChangeBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarBookmarkButtonClicked:)) ) {
        return !!self.bookmarkButtonClickedBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarCancelButtonClicked:)) ) {
        return !!self.cancelButtonClickedBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarResultsListButtonClicked:)) ) {
        return !!self.resultsListButtonClickedBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarSearchButtonClicked:)) ) {
        return !!self.searchButtonClickedBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarShouldBeginEditing:)) ) {
        return !!self.shouldBeginEditingBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarShouldEndEditing:)) ) {
        return !!self.shouldEndEditingBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarTextDidBeginEditing:)) ) {
        return !!self.textDidBeginEditingBlock;
    } else if ( sel_isEqual(aSelector, @selector(searchBarTextDidEndEditing:)) ) {
        return !!self.textDidEndEditingBlock;
    }
    return [super respondsToSelector:aSelector];
}

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

