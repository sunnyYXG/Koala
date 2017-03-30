//
//  Home.h
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LocationInfo;

@interface Home : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *biMark;
@property (nonatomic, strong) NSString *linkUrl;
@property (nonatomic, strong) NSString *viewCode;
@property (nonatomic, assign) double styleType;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSArray *bannerList;
@property (nonatomic, strong) LocationInfo *locationInfo;
@property (nonatomic, strong) NSArray *itemList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
