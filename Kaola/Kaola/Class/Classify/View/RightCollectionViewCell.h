//
//  RightCollectionViewCell.h
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForYouDataModels.h"
#import "YXGClassifyViewController.h"

@interface RightCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *collectionView_imageview;
@property (strong, nonatomic) IBOutlet UILabel *collectionView_Label;

@property (nonatomic) NSInteger section;
@property (nonatomic) YXGClassifyViewController *classfyCtr;

- (void)configureCellWithSection:(NSInteger)section row:(NSInteger)row data:(NSArray *)arr;

@property (nonatomic) ForYouCommonCategoryList *commonList;
@property (nonatomic) ForYouHotCategoryList *hotList;
@property (nonatomic) ForYouBrandList *brandList;
@property (nonatomic) ForYouAlbumList *albumList;

@end
