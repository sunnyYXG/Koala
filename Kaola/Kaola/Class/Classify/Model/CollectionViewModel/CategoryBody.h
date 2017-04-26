//
//  CategoryBody.h
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CategoryTopBanner;

@interface CategoryBody : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *level2CategoryList;
@property (nonatomic, strong) NSArray *brandList;
@property (nonatomic, strong) CategoryTopBanner *topBanner;
@property (nonatomic, strong) NSArray *hotActivityList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
