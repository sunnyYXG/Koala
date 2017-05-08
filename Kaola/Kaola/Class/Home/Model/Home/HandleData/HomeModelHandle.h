//
//  HomeModelHandle.h
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseClass,HomeAuslese;


@interface HomeModelHandle : NSObject


+(NSDictionary *)HomeModelHandle:(BaseClass *)baseModel;

+(NSDictionary *)HomeAuslessModelHandle:(HomeAuslese *)baseModel;

@end
