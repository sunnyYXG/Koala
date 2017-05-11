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
#import "HomeAusleseCellFrame.h"

#import "HomeTJMenuView.h"
#import "HomeModelHandle.h"

#import "homeTableViewCell.h"
#import "HomeAusleseCell.h"

#import "DataModels.h"
#import "HomeAusleseDataModels.h"
#import "HomeRecommendDataModels.h"

@interface YXGHomeViewController ()<homeTableViewCellDelegate,HomeTJMenuViewDelegate>{
    BOOL _isAuslessUpdata;//用来标记“今日精选”的数据是否请求过
}

@property (nonatomic)BaseClass *baseModel;
@property (nonatomic)HomeAuslese *AusleseBaseModel;
@property (nonatomic)RecommendBase *RecommendBaseModle;

@end

@implementation YXGHomeViewController

-(NSArray *)HomeList{
    if (!_HomeList) {
        _HomeList = [[NSArray alloc]init];
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
- (NSArray *)cellFrameArray {
    if (!_cellFrameArray) {
        _cellFrameArray = [NSArray new];
    }
    return _cellFrameArray;
}

-(NSMutableArray *)AusleseCellFrames{
    if (!_AusleseCellFrames) {
        _AusleseCellFrames = [NSMutableArray new];
    }
    return _AusleseCellFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
#pragma mark - 数据请求
- (void)loadDataType:(HomeServiceDataType)type withUrl:(NSString *)url{
    self.data_type = type;
    NSInteger pageNo = self.data_type;
    self.request.yxg_url = url;
    self.request.paramsDic = [HomeListRequest paramsWithPageNo:pageNo];
    [self loadData];
}

#pragma mark 首页轮播图
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
        //顶部
    }
    else if (self.tableView.contentSize.height - self.tableView.contentOffset.y-self.tableView.frame.size.height <=  0)
    {
        if (!_isAuslessUpdata) {
            _isAuslessUpdata = YES;
            [self loadDataType:HomeServiceDataTypeAuslese withUrl:home_url];

        }
        //底部
    }

}
- (CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeTableViewCellFrame *cellFrame = self.cellFrameArray[indexPath.row];
        return cellFrame.cellHeight;
    }else if (indexPath.section == 1){
        HomeAusleseCellFrame *cellFrame = self.AusleseCellFrames[indexPath.row];
        return cellFrame.cellHeight;

    }
    
    return 0;
}
-(CGFloat)yxg_sectionHeaderHeightAtSection:(NSInteger)section{
    if (section == 1) return 55;
    return 0;
}
-(UIView *)yxg_headerAtSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 55)];
    view.backgroundColor = UIColorFromRGB(234, 235, 237);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.view.width, 45)];
    label.text = self.ausleseSectionTitle;
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    return view;
}
#pragma mark - 主数据 创建cell
- (void)cellAtIndexPathWitCell:(homeTableViewCell *)cell HomeServiceDataTypeMain:(NSInteger)row{
    if (self.cellFrameArray.count == 0) return;
    
    HomeTableViewCellFrame *cellFrame = self.cellFrameArray[row];
    cell.cellFrame = cellFrame;
    cell.delegate =self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColorFromRGB(234, 235, 237);
    cell.userInteractionEnabled = YES;
}
#pragma mark - 今日精选 创建cell
- (void)cellAtIndexPathWitCell:(HomeAusleseCell *)cell HomeServiceDataTypeAuslese:(NSInteger)row{
    if (self.AusleseData.count == 0) return;
    HomeAusleseCellFrame *cellFrame = self.AusleseCellFrames[row];
    cell.cellFrame = cellFrame;
    
}
#pragma mark - 个性推荐 创建cell
- (void)cellAtIndexPathWitCell:(homeTableViewCell *)cell HomeServiceDataTypeRecommend:(NSInteger)row{
    
}

- (void)loadData{
    if (!self.request) return;
    WEAK_BLOCK_SELF(YXGHomeViewController);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            [self.tableView.mj_header endRefreshing];
            
            switch (block_self.data_type) {
                case HomeServiceDataTypeMain:
                    //主数据
                    [block_self handleModelHomeServiceDataTypeMain:response];
                    break;
                case HomeServiceDataTypeAuslese:
                    //今日精选
                    [block_self handleModelHomeServiceDataTypeAuslese:response];
                    break;
                case HomeServiceDataTypeRecommend:
                    //个性推荐
                    [block_self handleModelHomeServiceDataTypeRecommend:response];
                    break;
                default:
                    break;
            }
        }
    }];
}
#pragma mark - 个性推荐 数据处理
- (void)handleModelHomeServiceDataTypeRecommend:(id)response{
    self.RecommendBaseModle = (RecommendBase *)[RecommendBase yy_modelWithJSON:response];
}
#pragma mark - 今日精选 数据处理
- (void)handleModelHomeServiceDataTypeAuslese:(id)response{
    
    self.AusleseBaseModel = (HomeAuslese *)[HomeAuslese yy_modelWithJSON:response];
    NSDictionary *dic = [HomeModelHandle HomeAuslessModelHandle:self.AusleseBaseModel];

    self.AusleseData = [dic objectForKey:@"ausleseList"];
    self.AusleseCellFrames = [dic objectForKey:@"AusleseCellFrame"];
    self.ausleseSectionTitle = [dic objectForKey:@"title"];
    
    //section刷新
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self loadDataType:HomeServiceDataTypeRecommend withUrl:home_url];

    //cell刷新
//    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:3 inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}
#pragma mark - 主数据 处理
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
