//
//  YXGHomeViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGHomeViewController.h"
#import "HomeListRequest.h"
#import "BannerViewController.h"
#import "HomeTableViewCellFrame.h"

#import "HomeTJMenuView.h"
#import "HomeModelHandle.h"

#import "homeTableViewCell.h"
#import "HomeAusleseCell.h"

#import "DataModels.h"
#import "HomeAusleseDataModels.h"

@interface YXGHomeViewController ()<homeTableViewCellDelegate,HomeTJMenuViewDelegate>{
    BOOL _isAuslessUpdata;//用来标记“今日精选”的数据是否请求过
}

@property (nonatomic)BaseClass *baseModel;
@property (nonatomic)HomeAuslese *AusleseBaseModel;

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
//    self.AusleseData = @[@"",@"",@""];
    _isAuslessUpdata = NO;
    self.data_type = HomeServiceDataTypeMain;
    HomeListRequest *request = [HomeListRequest yxg_request];
    self.request = request;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataType:HomeServiceDataTypeMain withUrl:home_url];
    }];
    
    [self.tableView.mj_header beginRefreshing];
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, self.view.height - 152);
    self.tableView.frame = frame;

    [self initBannerView];
    
}

- (void)loadDataType:(HomeServiceDataType)type withUrl:(NSString *)url{
    self.data_type = type;
    NSInteger pageNo = self.data_type;
    self.request.yxg_url = url;
    self.request.paramsDic = [HomeListRequest paramsWithPageNo:pageNo];
    [self loadData];
}

- (void)initBannerView
{
    CycleBannerView *bannerView = [[CycleBannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.55)];
    bannerView.bgImg = [UIImage imageNamed:@"shadow.png"];
    
    WEAK_BLOCK_SELF(YXGHomeViewController);
    bannerView.clickItemBlock = ^(NSInteger index) {
        
        BannerList *banner = block_self.BannerList[index];
        
        [block_self pushVc:[BannerViewController new] userInfo:@{@"bannerUrl":banner.linkUrl}];
    };
    
    /*
    _TJMenuView = [[HomeTJMenuView alloc]initWithFrame:CGRectMake(headView.left, bannerView.bottom, SCREEN_WIDTH, bannerView.height/3)];
    _TJMenuView.delegate = self;
    self.TJMenuView.menus = @[@"point",@"onsale",@"index",@"list",@"introduce"];
    self.TJMenuView.h5_urls = @[point_url,onsale_url,index_url,list_url,introduce_url];
    [headView addSubview:self.TJMenuView];
    */
    
    self.tableView.tableHeaderView = bannerView;
    self.bannerView = bannerView;
}

#pragma mark - UITableViewDelegate
- (NSInteger)yxg_numberOfSections {
    return 2;
}

- (NSInteger)yxg_numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return self.HomeList.count;
    
    return self.AusleseData.count;
}

- (BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        homeTableViewCell *cell = [homeTableViewCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellAtIndexPathWitCell:cell HomeServiceDataTypeMain:indexPath.row];
        return cell;
        
    }
    else if (indexPath.section == 1){
        HomeAusleseCell *cell = [HomeAusleseCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
        [self cellAtIndexPathWitCell:cell HomeServiceDataTypeAuslese:indexPath.row];
        return cell;
        
    }
    else if (indexPath.section == 2){
        
    }
    return nil;
}

- (void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell {
    DDLog(@"只是打印");
}

-(void)yxg_scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.tableView.contentOffset.y <= 0)
    {
        DDLog(@"顶部");
        //顶部
    }
    else if (self.tableView.contentSize.height - self.tableView.contentOffset.y-self.tableView.frame.size.height <=  0)
    {
        if (!_isAuslessUpdata) {
            _isAuslessUpdata = YES;
            [self loadDataType:HomeServiceDataTypeAuslese withUrl:home_url];
            
        }
        
        DDLog(@"底部");
        //底部
    }

}

- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeTableViewCellFrame *cellFrame = self.cellFrameArray[indexPath.row];
        return cellFrame.cellHeight;
    }
    
    return 40;
}

#pragma mark - 主数据
- (void)cellAtIndexPathWitCell:(homeTableViewCell *)cell HomeServiceDataTypeMain:(NSInteger)row{
    if (self.cellFrameArray.count == 0) return;
    
    HomeTableViewCellFrame *cellFrame = self.cellFrameArray[row];
    cell.cellFrame = cellFrame;
    cell.delegate =self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColorFromRGB(234, 235, 237);
    cell.userInteractionEnabled = YES;
}
#pragma mark - 今日精选
- (void)cellAtIndexPathWitCell:(HomeAusleseCell *)cell HomeServiceDataTypeAuslese:(NSInteger)row{
    if (self.AusleseData.count == 0) return;
    
    [cell createView:@"nihao"];
    
}
#pragma mark - 个性推荐
- (void)cellAtIndexPathWitCell:(homeTableViewCell *)cell HomeServiceDataTypeRecommend:(NSInteger)row{
    
}

- (void)loadData{
    if (!self.request) return;
    WEAK_BLOCK_SELF(YXGHomeViewController);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            [self.tableView.mj_header endRefreshing];
            //主数据
            if (block_self.data_type == 1) {
                [block_self handleModelHomeServiceDataTypeMain:response];
            }
            //今日精选
            else if (block_self.data_type == 2){
                [block_self handleModelHomeServiceDataTypeAuslese:response];
            }
            //个性推荐
        }
    }];
    /*
     //一个section刷新
     
     NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
     
     [tableview reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
     
     
     
     //一个cell刷新
     
     NSIndexPath *indexPath=[NSIndexPath indexPathForRow:3 inSection:0];
     
     [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
     

     */
}

#pragma mark - 今日精选
- (void)handleModelHomeServiceDataTypeAuslese:(id)response{
    
    self.AusleseBaseModel = (HomeAuslese *)[HomeAuslese yy_modelWithJSON:response];
    NSDictionary *dic = [HomeModelHandle HomeAuslessModelHandle:self.AusleseBaseModel];

    self.AusleseData = [dic objectForKey:@"ausleseList"];
    
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark - 主数据处理
- (void)handleModelHomeServiceDataTypeMain:(id)response{
    self.baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:response];
    NSDictionary *dic = [HomeModelHandle HomeModelHandle:self.baseModel];
    self.HomeList = [dic objectForKey:@"HomeList"];
    self.cellFrameArray = [dic objectForKey:@"cellFrameArray"];
    self.bannerView.aryImg = [dic objectForKey:@"BannerImages"];
    self.BannerList = [dic objectForKey:@"BannerList"];
    [self yxg_reloadData];
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
