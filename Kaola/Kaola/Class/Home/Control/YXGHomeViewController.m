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

@property (nonatomic)BaseClass *baseModel;

@end

@implementation YXGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reqData];
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

- (void)reqData{
    NSString *path = @"http://sp.kaola.com/api/home?_httimestamp=1490856927&lastActivityPos=0&lastBrandPos=0&lastGoodsPos=0&pageNo=1";
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];

    
    [mgr GET:path parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"responseObject:%@",responseObject);
        _baseModel = [[BaseClass alloc]init];
        _baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:responseObject];
        DDLog(@"yymodel:%@",_baseModel.body);
        

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
