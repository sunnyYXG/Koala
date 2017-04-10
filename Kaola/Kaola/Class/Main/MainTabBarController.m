//
//  MainTabBarController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTab];
    
    self.request = [BaseRequest yxg_request];
    self.request.yxg_url = openad_url;
    [self loadData];

}

- (void)loadData{
    
    if (!self.request) return;
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            DDLog(@"openad--success");
        }
    }];
    
}


- (void)createTab{
    [self addChildViewControllerWithClassname:[YXGHomeTabbarController description] imagename:@"Home" title:@"首页"];
    [self addChildViewControllerWithClassname:[YXGFindViewController description] imagename:@"Found" title:@"发现"];
    [self addChildViewControllerWithClassname:[YXGClassifyViewController description]imagename:@"Class" title:@"分类"];
    [self addChildViewControllerWithClassname:[YXGShoppingCartViewController description] imagename:@"ShoppingCart" title:@"购物车"];
    [self addChildViewControllerWithClassname:[YXGMineViewController description] imagename:@"Mine" title:@"我的"];

}
// 添加子控制器
- (void)addChildViewControllerWithClassname:(NSString *)classname
                                  imagename:(NSString *)imagename
                                      title:(NSString *)title {
    
    UIViewController *vc = [[NSClassFromString(classname) alloc] init];

    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imagename];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[imagename stringByAppendingString:@"_press"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
