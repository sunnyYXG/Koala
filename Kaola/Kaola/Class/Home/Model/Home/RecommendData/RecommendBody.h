//
//  RecommendBody.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendBody : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isLogin;
@property (nonatomic, assign) double hasMore;
@property (nonatomic, strong) NSArray *home;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
