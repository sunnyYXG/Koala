//
//  YXGHomeViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseRequest.h"
#import "CycleBannerView.h"
@interface YXGHomeViewController : BaseTableViewController

@property (nonatomic, strong) BaseRequest *request;
@property (nonatomic)NSString *URLString;
@property (nonatomic)NSMutableArray *cellFrameArray;
/**
 *  首页数据源
 */
@property (nonatomic)NSMutableArray *HomeList;
/**
 *  顶部广告图片轮播
 */
@property (nonatomic)NSArray *BannerList;

/**
 *  顶部广告轮播视图
 */
@property (nonatomic , strong) CycleBannerView *bannerView;
@end
