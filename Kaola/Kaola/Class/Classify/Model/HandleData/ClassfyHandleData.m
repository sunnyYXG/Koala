//
//  ClassfyHandleData.m
//  Kaola
//
//  Created by sunny_FX on 2017/5/3.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ClassfyHandleData.h"
#import "ForYouDataModels.h"

@implementation ClassfyHandleData

+(NSArray *)ClassfyModelHandle:(ForYouCategory *)baseModel withCategoryDataType:(CategoryDataType)type{

    NSMutableArray *commonList = [NSMutableArray new];
    NSMutableArray *hotList = [NSMutableArray new];
    NSMutableArray *brandList = [NSMutableArray new];
    NSMutableArray *albumList = [NSMutableArray new];
    NSArray *SectionTitles = [NSArray new];
    if (type == 1) {
        SectionTitles = @[@"常用分类",@"热门分类",@"推荐品牌",@"精选专辑"];

        for (NSDictionary *dic in baseModel.body.commonCategoryList) {
            ForYouCommonCategoryList *common = [ForYouCommonCategoryList modelObjectWithDictionary:dic];
            [commonList addObject:common];
        }
        
        for (NSDictionary *dic in baseModel.body.hotCategoryList) {
            ForYouHotCategoryList *hot = [ForYouHotCategoryList modelObjectWithDictionary:dic];
            [hotList addObject:hot];
        }
        
        for (NSDictionary *dic in baseModel.body.brandList) {
            ForYouBrandList *common = [ForYouBrandList modelObjectWithDictionary:dic];
            [brandList addObject:common];
        }
        
        for (NSDictionary *dic in baseModel.body.albumList) {
            ForYouAlbumList *hot = [ForYouAlbumList modelObjectWithDictionary:dic];
            [albumList addObject:hot];
        }

    }

    return @[commonList,hotList,brandList,albumList,SectionTitles];
//    return @{@"commonList":commonList,@"hotList":hotList,@"brandList":brandList,@"albumList":albumList,@"SectionTitles":SectionTitles};

}
@end
