//
//  MainBrandList.h
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainBrandList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isFocus;
@property (nonatomic, strong) NSString *keyWords;
@property (nonatomic, assign) double brandId;
@property (nonatomic, assign) double favorCount;
@property (nonatomic, strong) NSString *brandLogo;
@property (nonatomic, strong) NSString *brandName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
