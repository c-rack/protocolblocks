//
// protocolblocks: UIKit/UISearchBar+DelegateBlocks.h
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

typedef void (^UISearchBarSelectedScopeButtonIndexDidChangeBlock)(UISearchBar* searchBar, NSInteger selectedScope);
typedef BOOL (^UISearchBarShouldChangeTextInRangeBlock)(UISearchBar* searchBar, NSRange range, NSString* text);
typedef void (^UISearchBarTextDidChangeBlock)(UISearchBar* searchBar, NSString* searchText);
typedef void (^UISearchBarBookmarkButtonClickedBlock)(UISearchBar* searchBar);
typedef void (^UISearchBarCancelButtonClickedBlock)(UISearchBar* searchBar);
typedef void (^UISearchBarResultsListButtonClickedBlock)(UISearchBar* searchBar);
typedef void (^UISearchBarSearchButtonClickedBlock)(UISearchBar* searchBar);
typedef BOOL (^UISearchBarShouldBeginEditingBlock)(UISearchBar* searchBar);
typedef BOOL (^UISearchBarShouldEndEditingBlock)(UISearchBar* searchBar);
typedef void (^UISearchBarTextDidBeginEditingBlock)(UISearchBar* searchBar);
typedef void (^UISearchBarTextDidEndEditingBlock)(UISearchBar* searchBar);

@interface UISearchBar (DelegateBlocks)

-(id)delegateBlocks;
-(void)onSelectedScopeButtonIndexDidChange:(UISearchBarSelectedScopeButtonIndexDidChangeBlock)block;
-(void)onShouldChangeTextInRange:(UISearchBarShouldChangeTextInRangeBlock)block;
-(void)onTextDidChange:(UISearchBarTextDidChangeBlock)block;
-(void)onBookmarkButtonClicked:(UISearchBarBookmarkButtonClickedBlock)block;
-(void)onCancelButtonClicked:(UISearchBarCancelButtonClickedBlock)block;
-(void)onResultsListButtonClicked:(UISearchBarResultsListButtonClickedBlock)block;
-(void)onSearchButtonClicked:(UISearchBarSearchButtonClickedBlock)block;
-(void)onShouldBeginEditing:(UISearchBarShouldBeginEditingBlock)block;
-(void)onShouldEndEditing:(UISearchBarShouldEndEditingBlock)block;
-(void)onTextDidBeginEditing:(UISearchBarTextDidBeginEditingBlock)block;
-(void)onTextDidEndEditing:(UISearchBarTextDidEndEditingBlock)block;

@end

@interface UISearchBarDelegateBlocks : NSObject <UISearchBarDelegate> {
    UISearchBarSelectedScopeButtonIndexDidChangeBlock _selectedScopeButtonIndexDidChangeBlock;
    UISearchBarShouldChangeTextInRangeBlock _shouldChangeTextInRangeBlock;
    UISearchBarTextDidChangeBlock _textDidChangeBlock;
    UISearchBarBookmarkButtonClickedBlock _bookmarkButtonClickedBlock;
    UISearchBarCancelButtonClickedBlock _cancelButtonClickedBlock;
    UISearchBarResultsListButtonClickedBlock _resultsListButtonClickedBlock;
    UISearchBarSearchButtonClickedBlock _searchButtonClickedBlock;
    UISearchBarShouldBeginEditingBlock _shouldBeginEditingBlock;
    UISearchBarShouldEndEditingBlock _shouldEndEditingBlock;
    UISearchBarTextDidBeginEditingBlock _textDidBeginEditingBlock;
    UISearchBarTextDidEndEditingBlock _textDidEndEditingBlock;
}

@property(nonatomic, copy) UISearchBarSelectedScopeButtonIndexDidChangeBlock selectedScopeButtonIndexDidChangeBlock;
@property(nonatomic, copy) UISearchBarShouldChangeTextInRangeBlock shouldChangeTextInRangeBlock;
@property(nonatomic, copy) UISearchBarTextDidChangeBlock textDidChangeBlock;
@property(nonatomic, copy) UISearchBarBookmarkButtonClickedBlock bookmarkButtonClickedBlock;
@property(nonatomic, copy) UISearchBarCancelButtonClickedBlock cancelButtonClickedBlock;
@property(nonatomic, copy) UISearchBarResultsListButtonClickedBlock resultsListButtonClickedBlock;
@property(nonatomic, copy) UISearchBarSearchButtonClickedBlock searchButtonClickedBlock;
@property(nonatomic, copy) UISearchBarShouldBeginEditingBlock shouldBeginEditingBlock;
@property(nonatomic, copy) UISearchBarShouldEndEditingBlock shouldEndEditingBlock;
@property(nonatomic, copy) UISearchBarTextDidBeginEditingBlock textDidBeginEditingBlock;
@property(nonatomic, copy) UISearchBarTextDidEndEditingBlock textDidEndEditingBlock;

@end

