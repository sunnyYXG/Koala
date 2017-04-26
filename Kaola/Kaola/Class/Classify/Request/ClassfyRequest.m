//
//  ClassfyRequest.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ClassfyRequest.h"

@implementation ClassfyRequest


+(NSDictionary *)params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [HelperTools HTtimeStamp];
    return params;

}

+(NSDictionary *)categoryParamsWithCategoryID:(NSString *)CategoryID{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [HelperTools HTtimeStamp];
    params[@"categoryId"] = CategoryID;
    return params;
}

@end
