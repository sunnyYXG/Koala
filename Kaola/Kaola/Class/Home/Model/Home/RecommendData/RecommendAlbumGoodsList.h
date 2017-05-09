//
//  RecommendAlbumGoodsList.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendAlbumGoodsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double goodsId;
@property (nonatomic, strong) NSString *imageUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
