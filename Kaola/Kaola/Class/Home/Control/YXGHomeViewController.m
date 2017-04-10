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
@interface YXGHomeViewController ()<homeTableViewCellDelegate>

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
    [self loadDataType:HomeServiceDataTypeMain withUrl:home_recommend_url];
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

    [headView addSubview:self.TJMenuView];
    
    self.tableView.tableHeaderView = headView;
    self.bannerView = bannerView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)yxg_numberOfSections {
//    return 1;
    return 2;

}

- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.HomeList.count;

    }else{
        return 20;
    }
}

- (BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        homeTableViewCell *cell = [homeTableViewCell cellWithTableView:self.tableView];
        
        HomeTableViewCellFrame *cellFrame = self.cellFrameArray[indexPath.row];
        cell.cellFrame = cellFrame;
        cell.delegate =self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = ColorFromRGB(234, 235, 237);
        cell.userInteractionEnabled = YES;
        return cell;
    }else{
        
        HomeSectionCell1 *cell = [HomeSectionCell1 cellWithTableView:self.tableView];
//        cell.backgroundColor = [UIColor orangeColor];
        [cell createView:indexPath.row];
        return cell;
    }
}

- (void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell {
    DDLog(@"只是打印");
}

- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        HomeTableViewCellFrame *cellFrame = self.cellFrameArray[indexPath.row];
        return cellFrame.cellHeight;

    }else{
        return 50.0f;
    }
}

- (void)loadData{

    [self startProgress];
//    NSMutableArray *BannerImages = [[NSMutableArray alloc]init];
    if (!self.request) return;
    IMP_BLOCK_SELF(YXGHomeViewController);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            [self stopProgress];
            
            DDLog(@"moedlaaaaaa:%@",response);
            if (self.data_type == 1) {
                block_self.baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:response];
                NSDictionary *dic = [HomeModelHandle HomeModelHandle:block_self.baseModel];
                block_self.HomeList = [dic objectForKey:@"HomeList"];
                block_self.cellFrameArray = [dic objectForKey:@"cellFrameArray"];
                block_self.bannerView.aryImg = [dic objectForKey:@"BannerImages"];
            }

            
            
            /*
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
             */
        }
        [block_self yxg_reloadData];
    }];
}

#pragma mark - homeTableViewCellDelegate
-(void)pushBannerWebViewWithURL:(NSString *)url{
    [self pushVc:[BannerViewController new] userInfo:@{@"bannerUrl":url}];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
