//
// ProtocolBlocks: UIKit/UISearchBar+DelegateBlocks.h
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

-(id)delegateblocks;
-(void)setSelectedScopeButtonIndexDidChangeBlock:(UISearchBarSelectedScopeButtonIndexDidChangeBlock)block;
-(void)setShouldChangeTextInRangeBlock:(UISearchBarShouldChangeTextInRangeBlock)block;
-(void)setTextDidChangeBlock:(UISearchBarTextDidChangeBlock)block;
-(void)setBookmarkButtonClickedBlock:(UISearchBarBookmarkButtonClickedBlock)block;
-(void)setCancelButtonClickedBlock:(UISearchBarCancelButtonClickedBlock)block;
-(void)setResultsListButtonClickedBlock:(UISearchBarResultsListButtonClickedBlock)block;
-(void)setSearchButtonClickedBlock:(UISearchBarSearchButtonClickedBlock)block;
-(void)setShouldBeginEditingBlock:(UISearchBarShouldBeginEditingBlock)block;
-(void)setShouldEndEditingBlock:(UISearchBarShouldEndEditingBlock)block;
-(void)setTextDidBeginEditingBlock:(UISearchBarTextDidBeginEditingBlock)block;
-(void)setTextDidEndEditingBlock:(UISearchBarTextDidEndEditingBlock)block;

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

