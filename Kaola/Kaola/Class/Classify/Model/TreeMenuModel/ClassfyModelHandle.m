//
//  ClassfyModelHandle.m
//  Kaola
//
//  Created by rongyun on 17/4/25.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ClassfyModelHandle.h"
#import "ClassfyCategoryTreeMenuList.h"
@implementation ClassfyModelHandle

+(NSArray *)ClassfyModelHandle:(NSArray *)datas{
    
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in datas) {
        ClassfyCategoryTreeMenuList *home = [ClassfyCategoryTreeMenuList modelObjectWithDictionary:dic];
        [dataArray addObject:home];

    }
    return dataArray;


}

@end
