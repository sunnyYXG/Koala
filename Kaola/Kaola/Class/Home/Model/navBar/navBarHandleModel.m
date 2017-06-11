//
//  navBarHandleModel.m
//  Kaola
//
//  Created by rongyun on 17/5/8.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "navBarHandleModel.h"
#import "KLNavBarDataModels.h"
@implementation navBarHandleModel

+ (NSArray *)navBarHandleModel:(KLNavBar *)baseModel{
    NSMutableArray *navBars = [NSMutableArray new];
    for (NSDictionary *dic in baseModel.body.topNavBar.navBarList) {
        KLNavBarList *list = (KLNavBarList *)[KLNavBarList modelObjectWithDictionary:dic];
        if (list.title) {
            [navBars addObject:list.title];

        }

    }
    [navBars removeObjectAtIndex:0];
    return navBars;
}



@end
