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
@interface YXGHomeViewController ()

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
    request.yxg_url = home_url;
    self.request = request;
    [self loadData];
    [self initBannerView];
    
}

- (void)initBannerView
{
    CycleBannerView *bannerView = [[CycleBannerView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH * 0.55)];
    bannerView.bgImg = [UIImage imageNamed:@"shadow.png"];
    
    IMP_BLOCK_SELF(YXGHomeViewController);
    bannerView.clickItemBlock = ^(NSInteger index) {
        
        BannerList *banner = block_self.BannerList[index];
        
        [block_self pushVc:[BannerViewController new] userInfo:@{@"banner":banner}];
    };
    self.tableView.tableHeaderView = bannerView;
    self.bannerView = bannerView;
    [self yxg_reloadData];
}

#pragma mark - UITableViewDelegate
- (NSInteger)yxg_numberOfSections {
    return 1;
}

- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section {
    return self.HomeList.count;
}

- (BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 创建cell
    homeTableViewCell *cell = [homeTableViewCell cellWithTableView:self.tableView];
//    Home *home = self.HomeList[indexPath.row];
//    [cell initConfigWithData:home.viewCode];
    
    
    HomeTableViewCellFrame *cellFrame = self.cellFrameArray[indexPath.row];
    cell.cellFrame = cellFrame;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    // 3. 返回cell
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
    NSMutableArray *BannerImages = [[NSMutableArray alloc]init];
    if (!self.request) return;
    IMP_BLOCK_SELF(YXGHomeViewController);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            [self stopProgress];
            block_self.baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:response];
            
            for (NSDictionary *dic in block_self.baseModel.body.home) {
                Home *home = [Home modelObjectWithDictionary:dic];
                [block_self.HomeList addObject:home];
            }
            //广告
            Home *home = (Home *)[block_self.HomeList firstObject];
            block_self.BannerList = home.bannerList;
            for (id obj in block_self.BannerList) {
                BannerList *banner = (BannerList *)obj;
                [BannerImages addObject:banner.imgUrl];
            }

            block_self.bannerView.aryImg = [BannerImages copy];
//            block_self.bannerView.aryText = [titles copy];

            [block_self.HomeList removeObjectAtIndex:0];
            for (NSInteger i = 0; i < block_self.HomeList.count; i ++) {
                    HomeTableViewCellFrame *cellFrame = [[HomeTableViewCellFrame alloc] init];
                    cellFrame.home = block_self.HomeList[i];
                    [self.cellFrameArray addObject:cellFrame];
            }

        }
        [block_self yxg_reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
