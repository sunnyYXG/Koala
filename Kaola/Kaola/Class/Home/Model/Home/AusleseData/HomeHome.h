//
//  HomeHome.h
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeLocationInfo;

@interface HomeHome : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *viewCode;
@property (nonatomic, assign) double styleType;
@property (nonatomic, strong) HomeLocationInfo *locationInfo;
@property (nonatomic, strong) NSArray *itemList;
@property (nonatomic, strong) NSArray *guidanceViewList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
