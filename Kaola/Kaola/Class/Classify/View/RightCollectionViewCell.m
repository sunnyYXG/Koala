//
//  RightCollectionViewCell.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "RightCollectionViewCell.h"

@implementation RightCollectionViewCell


-(id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    
    if (self)
    {
        NSArray *arrCell = [[NSBundle mainBundle]loadNibNamed:@"RightCollectionViewCell" owner:self options:nil];
        if (arrCell.count<1)
        {
            return nil;
        }
        if (![[arrCell objectAtIndex:0]isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        self = [arrCell objectAtIndex:0];
    }

    return self;
}

-(void)configureCellWithSection:(NSInteger)section row:(NSInteger)row data:(NSArray *)arr{
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
        
    }

}

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
}



@end
