//
//  ForYouBrandList.h
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ForYouBrandList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isFocus;
@property (nonatomic, strong) NSString *brandLogo;
@property (nonatomic, assign) double brandId;
@property (nonatomic, strong) NSString *recReason;
@property (nonatomic, assign) double favorCount;
@property (nonatomic, strong) NSString *brandName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
