//
//  FindViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseViewController.h"

@interface YXGFindViewController : BaseViewController

@property (nonatomic, assign)   BOOL        scrollAnimation;            // Default value: NO
@property (nonatomic, assign)   BOOL        mainViewBounces;            // Default value: NO

@property (nonatomic, strong)UIColor  *navTabBarColor;
@property (nonatomic, strong)UIColor  *navTabBarLineColor;

@property (nonatomic, strong)NSArray *subViewControllers;

@property (nonatomic, strong) UIScrollView *mainView;


@end
