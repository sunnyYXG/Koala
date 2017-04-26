//
//  YXGClassfyTableView.h
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseRequest.h"
@class ClassfyCategoryTreeMenuList;

//typedef void (^CollectionViewReloadBlock)(NSInteger selectedIndex);


@interface YXGClassfyTableView : BaseTableViewController

@property (nonatomic)BaseRequest *request;
@property (nonatomic)NSArray *data;
@property (nonatomic)NSArray *cellFrameArray;
@property (nonatomic)BOOL select_first_cell;



@property (nonatomic, copy) void (^clickCellBlock)(ClassfyCategoryTreeMenuList *treeMenu);

//@property (nonatomic, copy) CollectionViewReloadBlock Block;

@end
