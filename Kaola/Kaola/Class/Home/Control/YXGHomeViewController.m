//
//  YXGHomeViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGHomeViewController.h"
#import "BaseTableViewCell.h"
#import "homeTableViewCell.h"

@interface YXGHomeViewController ()

@end

@implementation YXGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData{
    [self yxg_reloadData];
}
#pragma mark - UITableViewDelegate
- (NSInteger)yxg_numberOfSections {
    return 1;
}

- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 创建cell
    homeTableViewCell *cell = [homeTableViewCell cellWithTableView:self.tableView];
    [cell initConfigWithData:indexPath.row];
    
    // 3. 返回cell
    return cell;
}

- (void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell {
    DDLog(@"只是打印");
}

- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
