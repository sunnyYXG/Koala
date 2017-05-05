//
//  RightCollectionViewCell.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "RightCollectionViewCell.h"

#define Image_Width 140

@implementation RightCollectionViewCell


-(void)configureCellWithSection:(NSInteger)section row:(NSInteger)row data:(NSArray *)arr withCategoryDataType:(NSInteger)type{
    
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }
    
    _collectionView_imageview = [UIImageView new];
    if (section == arr.count - 1) {
        _collectionView_imageview.layer.borderWidth = 1;
        _collectionView_imageview.layer.borderColor = UIColorFromRGB(219, 219, 219).CGColor;
    }
    
    _collectionView_Label = [UILabel new];
    _collectionView_Label.textAlignment = NSTextAlignmentCenter;
    _collectionView_Label.textColor = UIColorFromRGB(115, 115, 115);
    [_collectionView_Label setFont:[UIFont systemFontOfSize:14.0f]];
    
    _line = [UIView new];
    _line.backgroundColor = UIColorFromRGB(219, 219, 219);
    _line.hidden = YES;
    
    [self addSubview:_collectionView_imageview];
    [self addSubview:_collectionView_Label];
    [self addSubview:_line];
    
//    CGFloat setLeft = 10;
//    if (row % 3 == 0) {
//        setLeft = 10;
//    }

    CGSize cellSize = CGSizeMake(self.width - 10, (SCREEN_WIDTH - Image_Width)/3);
    CGFloat label_width = cellSize.width;
    
    if (type == 1) {
        if (section == 0) {
            ForYouCommonCategoryList *common = (ForYouCommonCategoryList *)arr[section][row];
            self.commonList = common;
            
        }else if(section == 1){
            ForYouHotCategoryList *common = (ForYouHotCategoryList *)arr[section][row];
            self.hotList = common;
            
        }else if(section == 2){
            ForYouBrandList *common = (ForYouBrandList *)arr[section][row];
            self.brandList = common;
            
        }else if(section == 3){
            ForYouAlbumList *common = (ForYouAlbumList *)arr[section][row];
            self.albumList = common;
            
            cellSize = CGSizeMake((SCREEN_WIDTH - Image_Width)/3, (SCREEN_WIDTH - Image_Width)/3);
            label_width = self.width - 5;
            _collectionView_Label.textAlignment = NSTextAlignmentLeft;
            _line.hidden = NO;
            
        }

    }else{
        if (section == arr.count - 1) {
            MainBrandList *brandList = (MainBrandList *)arr[section][row];
            self.MainBrand = brandList;
        }else{
            MainChildCategoryViewList *List = (MainChildCategoryViewList *)arr[section][row];
            self.CategoryList = List;
        }
    }
    
    
    [_collectionView_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(cellSize);
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(0);
    }];
    [_collectionView_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(label_width, 20));
        make.left.equalTo(_collectionView_imageview.mas_left);
        make.top.equalTo(_collectionView_imageview.mas_bottom).with.offset(5);
    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.width - 10, 0.5));
        make.left.equalTo(self).offset(5);
        make.top.equalTo(_collectionView_Label.mas_bottom).with.offset(5);
        
    }];


}

/**
 主体数据
 */
-(void)setMainBrand:(MainBrandList *)MainBrand{
    self.collectionView_Label.text = MainBrand.keyWords;
    [self.collectionView_imageview sd_setImageWithURL:[NSURL URLWithString:MainBrand.brandLogo]];

}
-(void)setCategoryList:(MainChildCategoryViewList *)CategoryList{
    self.collectionView_Label.text = CategoryList.categoryName;
    [self.collectionView_imageview sd_setImageWithURL:[NSURL URLWithString:CategoryList.iconUrl]];

}

/**
 为你推荐
 */
-(void)setCommonList:(ForYouCommonCategoryList *)commonList{
    self.collectionView_Label.text = commonList.categoryName;
    [self.collectionView_imageview sd_setImageWithURL:[NSURL URLWithString:commonList.iconUrl]];
}
-(void)setHotList:(ForYouHotCategoryList *)hotList{
    self.collectionView_Label.text = hotList.categoryName;
    [self.collectionView_imageview sd_setImageWithURL:[NSURL URLWithString:hotList.iconUrl]];
}
-(void)setBrandList:(ForYouBrandList *)brandList{
    self.collectionView_Label.text = brandList.brandName;
    [self.collectionView_imageview sd_setImageWithURL:[NSURL URLWithString:brandList.brandLogo]];
}
-(void)setAlbumList:(ForYouAlbumList *)albumList{
    self.collectionView_Label.text = albumList.title;
    NSURL *url = [NSURL URLWithString:[albumList.goodsUrlList firstObject]];
    [self.collectionView_imageview sd_setImageWithURL:url];

}



@end
