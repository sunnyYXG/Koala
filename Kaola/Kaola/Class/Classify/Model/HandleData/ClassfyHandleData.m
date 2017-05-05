//
//  ClassfyHandleData.m
//  Kaola
//
//  Created by sunny_FX on 2017/5/3.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ClassfyHandleData.h"
#import "ForYouDataModels.h"
#import "MainDataModels.h"


@implementation ClassfyHandleData

-(void)handleWithResponse:(id)response withCategoryDataType:(NSInteger)type{
    NSArray *arr;
    ForYouTopBanner *topBanner;
    switch (type) {
        case 1:
            self.baseModel = (ForYouCategory *)[ForYouCategory yy_modelWithJSON:response];
            arr = [self ClassfyModelHandleForYou:self.baseModel];
            topBanner = self.baseModel.body.topBanner;
            break;
            
            case 2:
            self.MainBaseModel = (MainCategory *)[MainCategory yy_modelWithJSON:response];
            arr = [self ClassfyModelHandleMain:self.MainBaseModel];
            topBanner = (ForYouTopBanner *)self.MainBaseModel.body.topBanner;
            break;
        default:
            break;
    }
    NSArray *Datas = [arr subarrayWithRange:NSMakeRange(0, arr.count - 1)];
    NSArray *SectionTitles = [arr lastObject];
    
    self.HandleBlock(topBanner,Datas,SectionTitles);
}

/**
 主体数据
 */
-(NSArray *)ClassfyModelHandleMain:(MainCategory *)baseModel{
    
    NSMutableArray *CategoryList = [NSMutableArray new];
    NSMutableArray *SectionTitles = [NSMutableArray new];
    NSMutableArray *brandList = [NSMutableArray new];

    for (NSDictionary *dic in baseModel.body.level2CategoryList) {
        MainLevel2CategoryList *leve = [MainLevel2CategoryList modelObjectWithDictionary:dic];
        [SectionTitles addObject:leve.categoryName];
        
        NSMutableArray *marr = [NSMutableArray new];
        for (NSDictionary *dic in leve.childCategoryViewList) {
            MainChildCategoryViewList *childLeve = (MainChildCategoryViewList *)dic;
            [marr addObject:childLeve];
        }
        [CategoryList addObject:marr];
    }
    
    [SectionTitles addObject:@"热门品牌"];

    for (NSDictionary *dic in baseModel.body.brandList) {
        MainBrandList *brand = [MainBrandList modelObjectWithDictionary:dic];
        [brandList addObject:brand];
    }
    [CategoryList addObject:brandList];
    
    [CategoryList addObject:SectionTitles];
    
    return CategoryList;
}
/**
 为你推荐
 */
-(NSArray *)ClassfyModelHandleForYou:(ForYouCategory *)baseModel{
    NSMutableArray *commonList = [NSMutableArray new];
    NSMutableArray *hotList = [NSMutableArray new];
    NSMutableArray *brandList = [NSMutableArray new];
    NSMutableArray *albumList = [NSMutableArray new];
    NSArray *SectionTitles = [NSArray new];
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
    return @[commonList,hotList,brandList,albumList,SectionTitles];
}

@end
