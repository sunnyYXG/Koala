//
//  ForYouCommonCategoryList.h
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ForYouCommonCategoryList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double parentId;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *iconUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
