//
//  KLBody.h
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KLBottomNavBar, KLTopNavBar;

@interface KLBody : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) KLBottomNavBar *bottomNavBar;
@property (nonatomic, strong) NSArray *discoveryTabView;
@property (nonatomic, assign) double styleType;
@property (nonatomic, strong) KLTopNavBar *topNavBar;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
