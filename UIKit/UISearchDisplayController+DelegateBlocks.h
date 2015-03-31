//
// protocolblocks: UIKit/UISearchDisplayController+DelegateBlocks.h
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

typedef void (^UISearchDisplayControllerDidHideSearchResultsTableViewBlock)(UISearchDisplayController* controller, UITableView* tableView);
typedef void (^UISearchDisplayControllerDidLoadSearchResultsTableViewBlock)(UISearchDisplayController* controller, UITableView* tableView);
typedef void (^UISearchDisplayControllerDidShowSearchResultsTableViewBlock)(UISearchDisplayController* controller, UITableView* tableView);
typedef BOOL (^UISearchDisplayControllerShouldReloadTableForSearchScopeBlock)(UISearchDisplayController* controller, NSInteger searchOption);
typedef BOOL (^UISearchDisplayControllerShouldReloadTableForSearchStringBlock)(UISearchDisplayController* controller, NSString* searchString);
typedef void (^UISearchDisplayControllerWillHideSearchResultsTableViewBlock)(UISearchDisplayController* controller, UITableView* tableView);
typedef void (^UISearchDisplayControllerWillShowSearchResultsTableViewBlock)(UISearchDisplayController* controller, UITableView* tableView);
typedef void (^UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock)(UISearchDisplayController* controller, UITableView* tableView);
typedef void (^UISearchDisplayControllerDidBeginSearchBlock)(UISearchDisplayController* controller);
typedef void (^UISearchDisplayControllerDidEndSearchBlock)(UISearchDisplayController* controller);
typedef void (^UISearchDisplayControllerWillBeginSearchBlock)(UISearchDisplayController* controller);
typedef void (^UISearchDisplayControllerWillEndSearchBlock)(UISearchDisplayController* controller);

@interface UISearchDisplayController (DelegateBlocks)

-(id)useBlocksForDelegate;
-(void)onDidHideSearchResultsTableView:(UISearchDisplayControllerDidHideSearchResultsTableViewBlock)block;
-(void)onDidLoadSearchResultsTableView:(UISearchDisplayControllerDidLoadSearchResultsTableViewBlock)block;
-(void)onDidShowSearchResultsTableView:(UISearchDisplayControllerDidShowSearchResultsTableViewBlock)block;
-(void)onShouldReloadTableForSearchScope:(UISearchDisplayControllerShouldReloadTableForSearchScopeBlock)block;
-(void)onShouldReloadTableForSearchString:(UISearchDisplayControllerShouldReloadTableForSearchStringBlock)block;
-(void)onWillHideSearchResultsTableView:(UISearchDisplayControllerWillHideSearchResultsTableViewBlock)block;
-(void)onWillShowSearchResultsTableView:(UISearchDisplayControllerWillShowSearchResultsTableViewBlock)block;
-(void)onWillUnloadSearchResultsTableView:(UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock)block;
-(void)onDidBeginSearch:(UISearchDisplayControllerDidBeginSearchBlock)block;
-(void)onDidEndSearch:(UISearchDisplayControllerDidEndSearchBlock)block;
-(void)onWillBeginSearch:(UISearchDisplayControllerWillBeginSearchBlock)block;
-(void)onWillEndSearch:(UISearchDisplayControllerWillEndSearchBlock)block;

@end

@interface UISearchDisplayControllerDelegateBlocks : NSObject <UISearchDisplayDelegate> {
    UISearchDisplayControllerDidHideSearchResultsTableViewBlock _didHideSearchResultsTableViewBlock;
    UISearchDisplayControllerDidLoadSearchResultsTableViewBlock _didLoadSearchResultsTableViewBlock;
    UISearchDisplayControllerDidShowSearchResultsTableViewBlock _didShowSearchResultsTableViewBlock;
    UISearchDisplayControllerShouldReloadTableForSearchScopeBlock _shouldReloadTableForSearchScopeBlock;
    UISearchDisplayControllerShouldReloadTableForSearchStringBlock _shouldReloadTableForSearchStringBlock;
    UISearchDisplayControllerWillHideSearchResultsTableViewBlock _willHideSearchResultsTableViewBlock;
    UISearchDisplayControllerWillShowSearchResultsTableViewBlock _willShowSearchResultsTableViewBlock;
    UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock _willUnloadSearchResultsTableViewBlock;
    UISearchDisplayControllerDidBeginSearchBlock _didBeginSearchBlock;
    UISearchDisplayControllerDidEndSearchBlock _didEndSearchBlock;
    UISearchDisplayControllerWillBeginSearchBlock _willBeginSearchBlock;
    UISearchDisplayControllerWillEndSearchBlock _willEndSearchBlock;
}

@property(nonatomic, copy) UISearchDisplayControllerDidHideSearchResultsTableViewBlock didHideSearchResultsTableViewBlock;
@property(nonatomic, copy) UISearchDisplayControllerDidLoadSearchResultsTableViewBlock didLoadSearchResultsTableViewBlock;
@property(nonatomic, copy) UISearchDisplayControllerDidShowSearchResultsTableViewBlock didShowSearchResultsTableViewBlock;
@property(nonatomic, copy) UISearchDisplayControllerShouldReloadTableForSearchScopeBlock shouldReloadTableForSearchScopeBlock;
@property(nonatomic, copy) UISearchDisplayControllerShouldReloadTableForSearchStringBlock shouldReloadTableForSearchStringBlock;
@property(nonatomic, copy) UISearchDisplayControllerWillHideSearchResultsTableViewBlock willHideSearchResultsTableViewBlock;
@property(nonatomic, copy) UISearchDisplayControllerWillShowSearchResultsTableViewBlock willShowSearchResultsTableViewBlock;
@property(nonatomic, copy) UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock willUnloadSearchResultsTableViewBlock;
@property(nonatomic, copy) UISearchDisplayControllerDidBeginSearchBlock didBeginSearchBlock;
@property(nonatomic, copy) UISearchDisplayControllerDidEndSearchBlock didEndSearchBlock;
@property(nonatomic, copy) UISearchDisplayControllerWillBeginSearchBlock willBeginSearchBlock;
@property(nonatomic, copy) UISearchDisplayControllerWillEndSearchBlock willEndSearchBlock;

@end

