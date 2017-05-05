//
//  ClassfyHandleData.h
//  Kaola
//
//  Created by sunny_FX on 2017/5/3.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ForYouCategory,ForYouTopBanner,MainCategory;

@interface ClassfyHandleData : NSObject


/**
 对请求成功的数据进行解析
 */
-(void)handleWithResponse:(id)response withCategoryDataType:(NSInteger)type;

@property (nonatomic)ForYouCategory *baseModel;
@property (nonatomic)MainCategory *MainBaseModel;

@property (nonatomic, copy) void (^HandleBlock)(ForYouTopBanner *banner,NSArray *Datas,NSArray *SectionTitles);

@end
