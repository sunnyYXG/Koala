//
//  ClassifyViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseViewController.h"
@class ForYouCategory,YXGClassfyTableView,HeaderCRView;

/**
 *  数据类型
 */
typedef NS_ENUM(NSUInteger, CategoryDataType) {
    /** 为你推荐*/
    CategoryDataTypeRecForYou = 1,
    /** 主题数据*/
    CategoryDataTypeMain = 2,
    /** 品牌墙*/
    CategoryDataTypeBrandWall = 3,
    /** 国家馆*/
    CategoryDataTypePavilion = 4,

    
};


@interface YXGClassifyViewController : BaseViewController

@property (nonatomic)BaseRequest *request;
@property (nonatomic)CategoryDataType type_category;

@property (nonatomic, strong) UICollectionView *rightCollectionView;

/**
 数据源
 */
@property (nonatomic,strong) NSArray *Datas;

/**
 分组title
 */
@property (nonatomic) NSArray *SectionTitles;
@property (nonatomic,assign) NSInteger categoryId;

@property (nonatomic)ForYouCategory *baseModel;
@property (nonatomic)YXGClassfyTableView *iTableview;
@property (nonatomic)HeaderCRView *muneView;

@end
