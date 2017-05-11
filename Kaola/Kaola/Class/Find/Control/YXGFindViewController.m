//
//  FindViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGFindViewController.h"
#import "YXGFindBuyChildVC.h"
#import "YXGFindVideoChildVC.h"

@interface YXGFindViewController ()<SCNavTabBarDelegate,UIScrollViewDelegate>{
    UIScrollView    *_mainView;
    NSInteger       _currentIndex;
    NSMutableArray  *_titles;
}

@end

@implementation YXGFindViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addERCodeSearchNavBar:NavBarViewType ERcodeSearchType:ERcodeAndMessageType];
    [self configView];
}
- (void)configView{
    [self initView];
    
    //首先加载第一个视图
    UIViewController *viewController = (UIViewController *)_subViewControllers[0];
    viewController.view.frame = CGRectMake(0 , 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [_mainView addSubview:viewController.view];
    [self addChildViewController:viewController];
}
- (void)initView{
    self.ERcodeSearchView.segmentView.delegate = self;
    self.ERcodeSearchView.segmentView.lineColor = _navTabBarLineColor;
    self.ERcodeSearchView.segmentView.itemTitles = @[@"值得买",@"视频"];
    [self.ERcodeSearchView.segmentView updateData];
    
    _subViewControllers = @[[YXGFindBuyChildVC new],[YXGFindVideoChildVC new]];
    [self.view addSubview:self.mainView];
}

#pragma mark - Scroll View Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _currentIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
    self.ERcodeSearchView.segmentView.currentItemIndex = _currentIndex;
    
    /** 当scrollview滚动的时候加载当前视图 */
    UIViewController *viewController = (UIViewController *)_subViewControllers[_currentIndex];
    viewController.view.frame = CGRectMake(_currentIndex * SCREEN_WIDTH, 0, SCREEN_WIDTH, _mainView.frame.size.height);
    [_mainView addSubview:viewController.view];
    [self addChildViewController:viewController];
}
- (void)itemDidSelectedWithIndex:(NSInteger)index withCurrentIndex:(NSInteger)currentIndex
{
    if (currentIndex-index>=2 || currentIndex-index<=-2) {
        [_mainView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0) animated:NO];
    }else{
        [_mainView setContentOffset:CGPointMake(index * SCREEN_WIDTH, 0) animated:YES];
    }
}


-(UIScrollView *)mainView{
    if (!_mainView) {
        _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 108)];
        _mainView.delegate = self;
        _mainView.pagingEnabled = YES;
        _mainView.bounces = _mainViewBounces;
        _mainView.showsHorizontalScrollIndicator = NO;
        _mainView.showsVerticalScrollIndicator = NO;
        _mainView.contentSize = CGSizeMake(SCREEN_WIDTH * _subViewControllers.count, 0);
    }
    return _mainView;
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
