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

@class HomeTJMenuView;

/**
 *  数据类型
 */
typedef NS_ENUM(NSUInteger, HomeServiceDataType) {
    /** 主要数据*/
    HomeServiceDataTypeMain = 1,
    /** 今日精选*/
    HomeServiceDataTypeAuslese = 2,
    /** 个性推荐*/
    HomeServiceDataTypeRecommend = 3,
    
};


@interface YXGHomeViewController : BaseTableViewController

/** 请求的数据类型*/
@property (nonatomic, assign) HomeServiceDataType data_type;

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

@property (nonatomic , strong) HomeTJMenuView *TJMenuView;


@property (nonatomic) NSArray *AusleseData;
@end
