//
//  BaseTableViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/26.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseViewController.h"
@class BaseTableView;
@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) BaseTableView *tableView;

@end
