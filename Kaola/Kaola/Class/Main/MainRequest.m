//
//  MainRequest.m
//  Kaola
//
//  Created by rongyun on 17/4/13.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "MainRequest.h"

@implementation MainRequest

+ (NSDictionary *)params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [HelperTools HTtimeStamp];
    return params;
}

+ (NSDictionary *)main_params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [HelperTools HTtimeStamp];
    params[@"idfa"] = @"00E327F1E9DB4BE09DE6A89D108D642F62394F0D8D9554A7C209D8A399ACCA3DDBB8AC13DD09F3CB415D6A0ADB250304";
    params[@"initial"] = @"1";
    params[@"messageToken"] = @"www.kaola.com-C76FC330-F1D0-4DBC-AF6F-74BA8D27F5B2";
    params[@"userAgent"] = @"Mozilla%2F5.0%20%28iPhone%3B%20CPU%20iPhone%20OS%2010_3_1%20like%20Mac%20OS%20X%29%20AppleWebKit%2F603.1.30%20%28KHTML%2C%20like%20Gecko%29%20Mobile%2F14E304";
    params[@"version"] = @"3.5.6";

    return params;

}

@end
