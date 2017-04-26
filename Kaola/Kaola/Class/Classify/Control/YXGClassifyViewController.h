//
//  ClassifyViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseViewController.h"

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
@property (nonatomic,strong) NSArray *myData;
@property (nonatomic,assign) NSInteger categoryId;

@end
