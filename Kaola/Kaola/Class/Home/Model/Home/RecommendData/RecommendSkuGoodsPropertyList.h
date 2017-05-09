//
//  RecommendSkuGoodsPropertyList.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendSkuGoodsPropertyList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *propertyNameId;
@property (nonatomic, assign) double isSku;
@property (nonatomic, assign) double isNecessary;
@property (nonatomic, assign) double isFilter;
@property (nonatomic, assign) double showArea;
@property (nonatomic, strong) NSArray *propertyValues;
@property (nonatomic, strong) NSString *propertyNameCn;
@property (nonatomic, assign) double isColor;
@property (nonatomic, assign) double inputType;
@property (nonatomic, assign) double showOrder;
@property (nonatomic, assign) double isLogistics;
@property (nonatomic, assign) double isDisplay;
@property (nonatomic, assign) double searchBoost;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
