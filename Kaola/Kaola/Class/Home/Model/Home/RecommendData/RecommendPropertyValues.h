//
//  RecommendPropertyValues.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendPropertyValues : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *propertyValueId;
@property (nonatomic, strong) NSString *propertyValue;
@property (nonatomic, strong) NSString *propertyValueIcon;
@property (nonatomic, strong) NSString *propertyNameId;
@property (nonatomic, strong) NSString *nameAlias;
@property (nonatomic, assign) double showOrder;
@property (nonatomic, assign) double hasIntroduce;
@property (nonatomic, assign) double isSysProperty;
@property (nonatomic, assign) double isSelected;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
