//
//  navBarRequest.m
//  Kaola
//
//  Created by rongyun on 17/5/8.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "navBarRequest.h"

@implementation navBarRequest

+ (NSDictionary *)params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [HelperTools HTtimeStamp];
    return params;
}

@end
