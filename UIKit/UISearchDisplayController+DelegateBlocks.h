//
// ProtocolBlocks: UIKit/UISearchDisplayController+DelegateBlocks.h
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

-(id)delegateblocks;
-(void)setDidHideSearchResultsTableViewBlock:(UISearchDisplayControllerDidHideSearchResultsTableViewBlock)block;
-(void)setDidLoadSearchResultsTableViewBlock:(UISearchDisplayControllerDidLoadSearchResultsTableViewBlock)block;
-(void)setDidShowSearchResultsTableViewBlock:(UISearchDisplayControllerDidShowSearchResultsTableViewBlock)block;
-(void)setShouldReloadTableForSearchScopeBlock:(UISearchDisplayControllerShouldReloadTableForSearchScopeBlock)block;
-(void)setShouldReloadTableForSearchStringBlock:(UISearchDisplayControllerShouldReloadTableForSearchStringBlock)block;
-(void)setWillHideSearchResultsTableViewBlock:(UISearchDisplayControllerWillHideSearchResultsTableViewBlock)block;
-(void)setWillShowSearchResultsTableViewBlock:(UISearchDisplayControllerWillShowSearchResultsTableViewBlock)block;
-(void)setWillUnloadSearchResultsTableViewBlock:(UISearchDisplayControllerWillUnloadSearchResultsTableViewBlock)block;
-(void)setDidBeginSearchBlock:(UISearchDisplayControllerDidBeginSearchBlock)block;
-(void)setDidEndSearchBlock:(UISearchDisplayControllerDidEndSearchBlock)block;
-(void)setWillBeginSearchBlock:(UISearchDisplayControllerWillBeginSearchBlock)block;
-(void)setWillEndSearchBlock:(UISearchDisplayControllerWillEndSearchBlock)block;

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

