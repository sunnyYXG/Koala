//
//  ForYouBody.h
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForYouTopBanner;

@interface ForYouBody : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *hotSaleLink;
@property (nonatomic, strong) NSArray *commonCategoryList;
@property (nonatomic, strong) NSArray *brandList;
@property (nonatomic, strong) ForYouTopBanner *topBanner;
@property (nonatomic, strong) NSArray *hotCategoryList;
@property (nonatomic, strong) NSString *moreAlbumLink;
@property (nonatomic, strong) NSArray *albumList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
