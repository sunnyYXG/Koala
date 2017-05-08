//
//  BannerList.h
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BannerList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *linkUrl;
@property (nonatomic, strong) NSString *biMark;
@property (nonatomic, strong) NSString *imgUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
