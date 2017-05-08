//
//  YXGHomeTabbarController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGHomeTabbarController.h"
#import "HomeNavTabBar.h"
#import "navBarRequest.h"
#import "KLNavBarDataModels.h"
//#import "ThemeManager.h"
#import <AVFoundation/AVFoundation.h>
#import "QRCodeGenerateVC.h"
#import "QRCodeScanningVC.h"

@interface YXGHomeTabbarController ()<UIScrollViewDelegate,SCNavTabBarDelegate,UISearchBarDelegate>
{
    NSInteger       _currentIndex;
    NSMutableArray  *_titles;
    HomeNavTabBar     *_navTabBar;
    UIScrollView    *_mainView;
}
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UIButton *ERCodeBtn;
@property (nonatomic) KLNavBar *baseModle;



@end

@implementation YXGHomeTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.ERCodeBtn];
    navBarRequest *request = [navBarRequest yxg_request];
    self.request = request;
    self.request.yxg_url = navBar_url;
    self.request.paramsDic = [navBarRequest params];
    [self reloadData];
    

}

- (void)reloadData{
    if (!self.request) return;
    WEAK_BLOCK_SELF(YXGHomeTabbarController);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            block_self.baseModle = (KLNavBar *)[KLNavBar yy_modelWithJSON:response];
            block_self.navBars = [navBarHandleModel navBarHandleModel:block_self.baseModle];
            
            [block_self initControl];
            [block_self initConfig];
            [block_self viewConfig];

        }
    }];
    
}
-(void)initControl
{
    
    
    NSMutableArray *viewArray = [NSMutableArray array];
    
    YXGHomeViewController *oneViewController = [[YXGHomeViewController alloc] init];
    oneViewController.title = @"推荐";
    [viewArray addObject:oneViewController];
    
    for(int i = 0; i < self.navBars.count; i++)
    {
        YXGHomeOtherController *otherViewController = [[YXGHomeOtherController alloc] init];
        otherViewController.title = self.navBars[i];
//        otherViewController.content = contentarray[i];
//        otherViewController.view.backgroundColor = [UIColor redColor];
        [viewArray addObject:otherViewController];
    }
    
    _subViewControllers = [NSArray array];
    _subViewControllers = viewArray;
}

- (void)initConfig
{
    _currentIndex = 1;
    
    _titles = [[NSMutableArray alloc] initWithCapacity:_subViewControllers.count];
    
    for (UIViewController *viewController in _subViewControllers)
    {
        [_titles addObject:viewController.title];
    }
}

- (void)viewConfig
{
    [self viewInit];
    
    //首先加载第一个视图
    UIViewController *viewController = (UIViewController *)_subViewControllers[0];
    viewController.view.frame = CGRectMake(0 , 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [_mainView addSubview:viewController.view];
    [self addChildViewController:viewController];
}

- (void)viewInit
{
    _navTabBar = [[HomeNavTabBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , 44)];
//    _navTabBar.backgroundColor = [[ThemeManager sharedInstance] themeColor];
    _navTabBar.backgroundColor = [UIColor whiteColor];

    _navTabBar.delegate = self;
    _navTabBar.lineColor = _navTabBarLineColor;
    _navTabBar.itemTitles = _titles;
    [_navTabBar updateData];
    [self.view addSubview:_navTabBar];
    
    _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _mainView.delegate = self;
    _mainView.pagingEnabled = YES;
    _mainView.bounces = _mainViewBounces;
    _mainView.showsHorizontalScrollIndicator = NO;
    _mainView.showsVerticalScrollIndicator = NO;
    _mainView.contentSize = CGSizeMake(SCREEN_WIDTH * _subViewControllers.count, 0);
    [self.view addSubview:_mainView];
    
    UIView *linev = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 1)];
    linev.backgroundColor = [UIColor colorWithRed:216/255.0f green:216/255.0f blue:216/255.0f alpha:1];
    [self.view addSubview:linev];
    
    
}

#pragma mark - Scroll View Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _currentIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
    _navTabBar.currentItemIndex = _currentIndex;
    
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
-(void)handleThemeChanged
{
//    ThemeManager *defaultManager = [ThemeManager sharedInstance];
//    _navTabBar.backgroundColor = [defaultManager themeColor];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - 搜索框
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(47, 20, SCREEN_WIDTH - 94, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"搜索";
        _searchBar.showsCancelButton = NO;
        _searchBar.searchBarStyle=UISearchBarStyleMinimal;
        [_searchBar setContentMode:UIViewContentModeLeft];

    }
    return _searchBar;
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [UIView animateWithDuration:0.3 animations:^{
        _ERCodeBtn.hidden = YES;
        self.navigationController.navigationBarHidden = YES;
        _searchBar.frame = CGRectMake(0, 20, SCREEN_WIDTH, 44);
        _searchBar.showsCancelButton = YES;
    }];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _ERCodeBtn.hidden = NO;
    _searchBar.frame = CGRectMake(47, 20, SCREEN_WIDTH - 94, 44);
    _searchBar.showsCancelButton = NO;
    [_searchBar resignFirstResponder];
    _searchBar.text = @"";
}


#pragma mark - 二维码
- (UIButton *)ERCodeBtn{
    if (!_ERCodeBtn) {
        _ERCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 31, 22, 22)];
//        _ERCodeBtn.backgroundColor = [UIColor orangeColor];
//        [_ERCodeBtn setBackgroundImage:[UIImage imageNamed:@"ERCode"] forState:UIControlStateNormal];
        [_ERCodeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_ERCodeBtn setTitle:@"+" forState:UIControlStateNormal];
        [_ERCodeBtn addTarget:self action:@selector(scanningQRCode:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _ERCodeBtn;
}
#pragma mark - 生成二维码方法
- (void)generateQRCode:(id)sender {
    QRCodeGenerateVC *VC = [[QRCodeGenerateVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}

#pragma mark - 扫描二维码方法
- (void)scanningQRCode:(id)sender {
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        QRCodeScanningVC *vc = [[QRCodeScanningVC alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                    });
                    
                    NSLog(@"当前线程 - - %@", [NSThread currentThread]);
                    // 用户第一次同意了访问相机权限
                    NSLog(@"用户第一次同意了访问相机权限");
                    
                } else {
                    
                    // 用户第一次拒绝了访问相机权限
                    NSLog(@"用户第一次拒绝了访问相机权限");
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            QRCodeScanningVC *vc = [[QRCodeScanningVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
            
        } else if (status == AVAuthorizationStatusRestricted) {
            NSLog(@"因为系统原因, 无法访问相册");
        }
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alertA];
        [self presentViewController:alertC animated:YES completion:nil];
    } 
    
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
