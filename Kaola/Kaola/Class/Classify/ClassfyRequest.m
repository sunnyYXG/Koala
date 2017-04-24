//
//  ClassfyRequest.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ClassfyRequest.h"

@implementation ClassfyRequest


-(NSDictionary *)paramsDic{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [HelperTools HTtimeStamp];
    return params;

}
@end
