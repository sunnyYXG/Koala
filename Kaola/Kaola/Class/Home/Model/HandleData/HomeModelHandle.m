//
//  HomeModelHandle.m
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeModelHandle.h"
#import "HomeTableViewCellFrame.h"
@implementation HomeModelHandle

+(NSDictionary *)HomeModelHandle:(BaseClass *)baseModel{
    
    NSMutableArray *HomeList = [[NSMutableArray alloc]init];
    NSArray *BannerLists = [[NSMutableArray alloc]init];
    NSMutableArray *BannerImages = [[NSMutableArray alloc]init];
    NSMutableArray *cellFrameArray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in baseModel.body.home) {
        Home *home = [Home modelObjectWithDictionary:dic];
        [HomeList addObject:home];
    }
    
    //广告
    Home *home = (Home *)[HomeList firstObject];
    BannerLists = home.bannerList;
    for (id obj in BannerLists) {
        BannerList *banner = (BannerList *)obj;
        [BannerImages addObject:banner.imgUrl];
    }
    
    [HomeList removeObjectAtIndex:0];
    for (NSInteger i = 0; i < HomeList.count; i ++) {
        HomeTableViewCellFrame *cellFrame = [[HomeTableViewCellFrame alloc] init];
        cellFrame.home = HomeList[i];
        [cellFrameArray addObject:cellFrame];
    }
    
    NSDictionary *dic = @{@"HomeList":HomeList,@"BannerImages":BannerImages,@"cellFrameArray":cellFrameArray};
    return dic;
}


@end
