//
//  CategoryChildCategoryViewList.h
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CategoryChildCategoryViewList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double categoryId;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) double parentId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
