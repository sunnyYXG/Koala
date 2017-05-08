//
//  KLNavBarList.h
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface KLNavBarList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double showType;
@property (nonatomic, assign) double startTime;
@property (nonatomic, assign) double endTime;
@property (nonatomic, strong) NSString *iconURL;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double iconIsShow;
@property (nonatomic, assign) double isDefault;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *guidanceId;
@property (nonatomic, assign) double locationOrder;
@property (nonatomic, strong) NSString *apiTail;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
