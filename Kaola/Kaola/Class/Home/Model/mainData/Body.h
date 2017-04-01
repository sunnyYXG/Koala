//
//  Body.h
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Body : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isLogin;
@property (nonatomic, strong) NSArray *home;
@property (nonatomic, assign) double refresh;
@property (nonatomic, assign) double hasMore;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
