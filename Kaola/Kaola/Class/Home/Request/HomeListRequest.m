//
//  HomeListRequest.m
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeListRequest.h"

@implementation HomeListRequest

+ (NSDictionary *)paramsWithPageNo:(NSInteger)pageNo{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [HelperTools HTtimeStamp];
    params[@"lastActivityPos"] = @"0";
    params[@"lastBrandPos"] = @"0";
    params[@"lastGoodsPos"] = @"0";
    params[@"pageNo"] = [NSString stringWithFormat:@"%ld",pageNo];
    return params;
}

@end
