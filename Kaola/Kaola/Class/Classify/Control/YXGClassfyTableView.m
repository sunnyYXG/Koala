//
//  YXGClassfyTableView.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "YXGClassfyTableView.h"
#import "ClassfyTableViewCell.h"
#import "ClassfyRequest.h"

@interface YXGClassfyTableView ()


@end

@implementation YXGClassfyTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ClassfyRequest *request = [ClassfyRequest yxg_request];
    self.request = request;
    [self loadDataWithUrl:classfy_url];
    // Do any additional setup after loading the view.
}

- (void)loadDataWithUrl:(NSString *)url{
    self.request.yxg_url = url;
    self.request.paramsDic = [ClassfyRequest params];
    [self loadData];
}
-(NSInteger)yxg_numberOfSections{
    return 10;
}
-(NSInteger)yxg_numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
-(BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath{
    ClassfyTableViewCell *cell = [ClassfyTableViewCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)loadData{
    if (!self.request) return;
    IMP_BLOCK_SELF(YXGClassfyTableView);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            [self.tableView.mj_header endRefreshing];
            
            DDLog(@"moedlaaaaaa:%@",response);
//            block_self.baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:response];
//            NSDictionary *dic = [HomeModelHandle HomeModelHandle:block_self.baseModel];
//            block_self.HomeList = [dic objectForKey:@"HomeList"];
//            block_self.cellFrameArray = [dic objectForKey:@"cellFrameArray"];
//            block_self.bannerView.aryImg = [dic objectForKey:@"BannerImages"];
//            block_self.BannerList = [dic objectForKey:@"BannerList"];
        }
        [block_self yxg_reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
