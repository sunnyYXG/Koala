//
//  ClassfyRequest.h
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseRequest.h"

@interface ClassfyRequest : BaseRequest

/** 参数 */
+ (NSDictionary *)params;

/** 分类参数 */
+ (NSDictionary *)categoryParamsWithCategoryID:(NSString *)CategoryID;

@end
