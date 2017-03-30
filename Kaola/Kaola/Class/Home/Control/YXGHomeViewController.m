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
#import "HomeListRequest.h"
#import "BannerList.h"
@interface YXGHomeViewController ()

@property (nonatomic)BaseClass *baseModel;

@end

@implementation YXGHomeViewController

-(NSArray *)List{
    if (!_List) {
        _List = [[NSArray alloc]init];
    }
    return _List;
}
-(BaseClass *)baseModel{
    if (!_baseModel) {
        _baseModel = [[BaseClass alloc]init];
    }
    return _baseModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    HomeListRequest *request = [HomeListRequest yxg_request];
    request.yxg_url = home_url;
    self.request = request;

    [self loadData];
}

#pragma mark - UITableViewDelegate
- (NSInteger)yxg_numberOfSections {
    return 1;
}

- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section {
    return self.List.count;
}

- (BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 创建cell
    homeTableViewCell *cell = [homeTableViewCell cellWithTableView:self.tableView];
    NSDictionary *dic = self.List[indexPath.row];
//    BannerList *list = self.List[indexPath.row];
//    DDLog(@"ddd:%@",list.biMark);
    [cell initConfigWithData:[dic objectForKey:@"biMark"]];
    
    // 3. 返回cell
    return cell;
}

- (void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell {
    DDLog(@"只是打印");
}

- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)loadData{
    
    if (!self.request) return;
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            self.baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:response];
//            DDLog(@"yymodel:%@",self.baseModel.body);
            for (NSInteger i = 0; i<self.baseModel.body.home.count; i++) {
                Home *home = self.baseModel.body.home[i];
//                BannerList *list = home.bannerList[];
//                DDLog(@"homeList:%@",home.bannerList);
            }
            Home *home = self.baseModel.body.home[0];
            DDLog(@"homedata:%@",home);
            self.List = [self.baseModel.body.home[0] objectForKey:@"bannerList"];
            [self yxg_reloadData];

        }


    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
