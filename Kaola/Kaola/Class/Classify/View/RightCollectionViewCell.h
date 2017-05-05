//
//  RightCollectionViewCell.h
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForYouDataModels.h"
#import "MainDataModels.h"
#import "YXGClassifyViewController.h"

@interface RightCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic)  UIImageView *collectionView_imageview;
@property (strong, nonatomic)  UILabel *collectionView_Label;
@property (strong, nonatomic)  UIView *line;

@property (nonatomic) NSInteger section;
@property (nonatomic) YXGClassifyViewController *classfyCtr;

- (void)configureCellWithSection:(NSInteger)section row:(NSInteger)row data:(NSArray *)arr withCategoryDataType:(NSInteger)type;

/**
 为你推荐
 */
@property (nonatomic) ForYouCommonCategoryList *commonList;
@property (nonatomic) ForYouHotCategoryList *hotList;
@property (nonatomic) ForYouBrandList *brandList;
@property (nonatomic) ForYouAlbumList *albumList;

/**
 主体数据
 */
@property (nonatomic) MainChildCategoryViewList *CategoryList;
@property (nonatomic) MainBrandList *MainBrand;

@end
