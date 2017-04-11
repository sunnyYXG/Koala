//
//  YXGHomeViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGHomeViewController.h"
#import "homeTableViewCell.h"
#import "HomeListRequest.h"
#import "BannerViewController.h"
#import "HomeTableViewCellFrame.h"
#import "HomeTJMenuView.h"
#import "HomeModelHandle.h"
#import "HomeSectionCell1.h"
@interface YXGHomeViewController ()<homeTableViewCellDelegate,HomeTJMenuViewDelegate>

@property (nonatomic)BaseClass *baseModel;

@end

@implementation YXGHomeViewController

-(NSMutableArray *)HomeList{
    if (!_HomeList) {
        _HomeList = [[NSMutableArray alloc]init];
    }
    return _HomeList;
}
-(NSArray *)BannerList{
    if (!_BannerList) {
        _BannerList = [[NSArray array]init];
    }
    return _BannerList;
}
-(BaseClass *)baseModel{
    if (!_baseModel) {
        _baseModel = [[BaseClass alloc]init];
    }
    return _baseModel;
}
- (NSMutableArray *)cellFrameArray {
    if (!_cellFrameArray) {
        _cellFrameArray = [NSMutableArray new];
    }
    return _cellFrameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeListRequest *request = [HomeListRequest yxg_request];
    self.request = request;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataType:HomeServiceDataTypeMain withUrl:home_url];
    }];
    [self.tableView.mj_header beginRefreshing];

    [self initBannerView];
    
}

- (void)loadDataType:(HomeServiceDataType)type withUrl:(NSString *)url{
    self.request.yxg_url = url;
    self.data_type = type;
    [self loadData];

}
- (void)initBannerView
{
    CycleBannerView *bannerView = [[CycleBannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.55)];
    bannerView.bgImg = [UIImage imageNamed:@"shadow.png"];
    
    IMP_BLOCK_SELF(YXGHomeViewController);
    bannerView.clickItemBlock = ^(NSInteger index) {
        
        BannerList *banner = block_self.BannerList[index];
        
        [block_self pushVc:[BannerViewController new] userInfo:@{@"bannerUrl":banner.linkUrl}];
    };
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, bannerView.height + bannerView.height/3)];
    [headView addSubview:bannerView];

    _TJMenuView = [[HomeTJMenuView alloc]initWithFrame:CGRectMake(headView.left, bannerView.bottom, SCREEN_WIDTH, bannerView.height/3)];
    _TJMenuView.delegate = self;
    self.TJMenuView.menus = @[@"point",@"onsale",@"index",@"list",@"introduce"];
    self.TJMenuView.h5_urls = @[point_url,onsale_url,index_url,list_url,introduce_url];
    [headView addSubview:self.TJMenuView];
    self.tableView.tableHeaderView = headView;
    self.bannerView = bannerView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)yxg_numberOfSections {
    return 1;
}

- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section {
    return self.HomeList.count;
}

- (BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath {
    
        homeTableViewCell *cell = [homeTableViewCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        
        HomeTableViewCellFrame *cellFrame = self.cellFrameArray[indexPath.row];
        cell.cellFrame = cellFrame;
        cell.delegate =self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = ColorFromRGB(234, 235, 237);
        cell.userInteractionEnabled = YES;
        return cell;
}

- (void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell {
    DDLog(@"只是打印");
}

- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCellFrame *cellFrame = self.cellFrameArray[indexPath.row];
    return cellFrame.cellHeight;
}

- (void)loadData{

    [self startProgress];
    if (!self.request) return;
    IMP_BLOCK_SELF(YXGHomeViewController);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            [self stopProgress];
            [self.tableView.mj_header endRefreshing];

            DDLog(@"moedlaaaaaa:%@",response);
                block_self.baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:response];
                NSDictionary *dic = [HomeModelHandle HomeModelHandle:block_self.baseModel];
                block_self.HomeList = [dic objectForKey:@"HomeList"];
                block_self.cellFrameArray = [dic objectForKey:@"cellFrameArray"];
                block_self.bannerView.aryImg = [dic objectForKey:@"BannerImages"];
                block_self.BannerList = [dic objectForKey:@"BannerList"];
        }
        [block_self yxg_reloadData];
    }];
}

#pragma mark - homeTableViewCellDelegate
-(void)pushBannerWebViewWithURL:(NSString *)url{
    [self pushVc:[BannerViewController new] userInfo:@{@"bannerUrl":url}];

}
#pragma mark - HomeTJMenuViewDelegate
-(void)pushWebViewWithURL:(NSString *)url{
    [self pushVc:[BannerViewController new] userInfo:@{@"bannerUrl":url}];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
