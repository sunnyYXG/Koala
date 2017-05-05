//
//  MainBody.h
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MainTopBanner;

@interface MainBody : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *level2CategoryList;
@property (nonatomic, strong) MainTopBanner *topBanner;
@property (nonatomic, strong) NSArray *brandList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
