//
//  YXGClassfyTableView.h
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseRequest.h"

//typedef void (^CollectionViewReloadBlock)(NSInteger selectedIndex);

@protocol YXGClassfyTableViewDelegate <NSObject>

- (void)CollectionReloadBlockWithID:(NSInteger)row;

@end

@interface YXGClassfyTableView : BaseTableViewController

@property (nonatomic)BaseRequest *request;
@property (nonatomic)NSArray *data;
@property (nonatomic)NSArray *cellFrameArray;
@property (nonatomic)BOOL select_first_cell;


@property (nonatomic)id<YXGClassfyTableViewDelegate>delegate;

//@property (nonatomic, copy) CollectionViewReloadBlock Block;
//- (void)CollectionReloadBlock:(CollectionViewReloadBlock)block;
//@property (nonatomic)NSInteger num;

@end
