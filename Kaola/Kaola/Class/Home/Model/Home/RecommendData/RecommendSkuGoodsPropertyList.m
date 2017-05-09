//
//  RecommendSkuGoodsPropertyList.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendSkuGoodsPropertyList.h"
#import "RecommendPropertyValues.h"


NSString *const kRecommendSkuGoodsPropertyListPropertyNameId = @"propertyNameId";
NSString *const kRecommendSkuGoodsPropertyListIsSku = @"isSku";
NSString *const kRecommendSkuGoodsPropertyListIsNecessary = @"isNecessary";
NSString *const kRecommendSkuGoodsPropertyListIsFilter = @"isFilter";
NSString *const kRecommendSkuGoodsPropertyListShowArea = @"showArea";
NSString *const kRecommendSkuGoodsPropertyListPropertyValues = @"propertyValues";
NSString *const kRecommendSkuGoodsPropertyListPropertyNameCn = @"propertyNameCn";
NSString *const kRecommendSkuGoodsPropertyListIsColor = @"isColor";
NSString *const kRecommendSkuGoodsPropertyListInputType = @"inputType";
NSString *const kRecommendSkuGoodsPropertyListShowOrder = @"showOrder";
NSString *const kRecommendSkuGoodsPropertyListIsLogistics = @"isLogistics";
NSString *const kRecommendSkuGoodsPropertyListIsDisplay = @"isDisplay";
NSString *const kRecommendSkuGoodsPropertyListSearchBoost = @"searchBoost";


@interface RecommendSkuGoodsPropertyList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendSkuGoodsPropertyList

@synthesize propertyNameId = _propertyNameId;
@synthesize isSku = _isSku;
@synthesize isNecessary = _isNecessary;
@synthesize isFilter = _isFilter;
@synthesize showArea = _showArea;
@synthesize propertyValues = _propertyValues;
@synthesize propertyNameCn = _propertyNameCn;
@synthesize isColor = _isColor;
@synthesize inputType = _inputType;
@synthesize showOrder = _showOrder;
@synthesize isLogistics = _isLogistics;
@synthesize isDisplay = _isDisplay;
@synthesize searchBoost = _searchBoost;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.propertyNameId = [self objectOrNilForKey:kRecommendSkuGoodsPropertyListPropertyNameId fromDictionary:dict];
            self.isSku = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListIsSku fromDictionary:dict] doubleValue];
            self.isNecessary = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListIsNecessary fromDictionary:dict] doubleValue];
            self.isFilter = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListIsFilter fromDictionary:dict] doubleValue];
            self.showArea = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListShowArea fromDictionary:dict] doubleValue];
    NSObject *receivedRecommendPropertyValues = [dict objectForKey:kRecommendSkuGoodsPropertyListPropertyValues];
    NSMutableArray *parsedRecommendPropertyValues = [NSMutableArray array];
    if ([receivedRecommendPropertyValues isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecommendPropertyValues) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecommendPropertyValues addObject:[RecommendPropertyValues modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecommendPropertyValues isKindOfClass:[NSDictionary class]]) {
       [parsedRecommendPropertyValues addObject:[RecommendPropertyValues modelObjectWithDictionary:(NSDictionary *)receivedRecommendPropertyValues]];
    }

    self.propertyValues = [NSArray arrayWithArray:parsedRecommendPropertyValues];
            self.propertyNameCn = [self objectOrNilForKey:kRecommendSkuGoodsPropertyListPropertyNameCn fromDictionary:dict];
            self.isColor = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListIsColor fromDictionary:dict] doubleValue];
            self.inputType = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListInputType fromDictionary:dict] doubleValue];
            self.showOrder = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListShowOrder fromDictionary:dict] doubleValue];
            self.isLogistics = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListIsLogistics fromDictionary:dict] doubleValue];
            self.isDisplay = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListIsDisplay fromDictionary:dict] doubleValue];
            self.searchBoost = [[self objectOrNilForKey:kRecommendSkuGoodsPropertyListSearchBoost fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.propertyNameId forKey:kRecommendSkuGoodsPropertyListPropertyNameId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSku] forKey:kRecommendSkuGoodsPropertyListIsSku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isNecessary] forKey:kRecommendSkuGoodsPropertyListIsNecessary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFilter] forKey:kRecommendSkuGoodsPropertyListIsFilter];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showArea] forKey:kRecommendSkuGoodsPropertyListShowArea];
    NSMutableArray *tempArrayForPropertyValues = [NSMutableArray array];
    for (NSObject *subArrayObject in self.propertyValues) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPropertyValues addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPropertyValues addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPropertyValues] forKey:kRecommendSkuGoodsPropertyListPropertyValues];
    [mutableDict setValue:self.propertyNameCn forKey:kRecommendSkuGoodsPropertyListPropertyNameCn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isColor] forKey:kRecommendSkuGoodsPropertyListIsColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inputType] forKey:kRecommendSkuGoodsPropertyListInputType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showOrder] forKey:kRecommendSkuGoodsPropertyListShowOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isLogistics] forKey:kRecommendSkuGoodsPropertyListIsLogistics];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isDisplay] forKey:kRecommendSkuGoodsPropertyListIsDisplay];
    [mutableDict setValue:[NSNumber numberWithDouble:self.searchBoost] forKey:kRecommendSkuGoodsPropertyListSearchBoost];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.propertyNameId = [aDecoder decodeObjectForKey:kRecommendSkuGoodsPropertyListPropertyNameId];
    self.isSku = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListIsSku];
    self.isNecessary = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListIsNecessary];
    self.isFilter = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListIsFilter];
    self.showArea = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListShowArea];
    self.propertyValues = [aDecoder decodeObjectForKey:kRecommendSkuGoodsPropertyListPropertyValues];
    self.propertyNameCn = [aDecoder decodeObjectForKey:kRecommendSkuGoodsPropertyListPropertyNameCn];
    self.isColor = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListIsColor];
    self.inputType = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListInputType];
    self.showOrder = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListShowOrder];
    self.isLogistics = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListIsLogistics];
    self.isDisplay = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListIsDisplay];
    self.searchBoost = [aDecoder decodeDoubleForKey:kRecommendSkuGoodsPropertyListSearchBoost];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_propertyNameId forKey:kRecommendSkuGoodsPropertyListPropertyNameId];
    [aCoder encodeDouble:_isSku forKey:kRecommendSkuGoodsPropertyListIsSku];
    [aCoder encodeDouble:_isNecessary forKey:kRecommendSkuGoodsPropertyListIsNecessary];
    [aCoder encodeDouble:_isFilter forKey:kRecommendSkuGoodsPropertyListIsFilter];
    [aCoder encodeDouble:_showArea forKey:kRecommendSkuGoodsPropertyListShowArea];
    [aCoder encodeObject:_propertyValues forKey:kRecommendSkuGoodsPropertyListPropertyValues];
    [aCoder encodeObject:_propertyNameCn forKey:kRecommendSkuGoodsPropertyListPropertyNameCn];
    [aCoder encodeDouble:_isColor forKey:kRecommendSkuGoodsPropertyListIsColor];
    [aCoder encodeDouble:_inputType forKey:kRecommendSkuGoodsPropertyListInputType];
    [aCoder encodeDouble:_showOrder forKey:kRecommendSkuGoodsPropertyListShowOrder];
    [aCoder encodeDouble:_isLogistics forKey:kRecommendSkuGoodsPropertyListIsLogistics];
    [aCoder encodeDouble:_isDisplay forKey:kRecommendSkuGoodsPropertyListIsDisplay];
    [aCoder encodeDouble:_searchBoost forKey:kRecommendSkuGoodsPropertyListSearchBoost];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendSkuGoodsPropertyList *copy = [[RecommendSkuGoodsPropertyList alloc] init];
    
    if (copy) {

        copy.propertyNameId = [self.propertyNameId copyWithZone:zone];
        copy.isSku = self.isSku;
        copy.isNecessary = self.isNecessary;
        copy.isFilter = self.isFilter;
        copy.showArea = self.showArea;
        copy.propertyValues = [self.propertyValues copyWithZone:zone];
        copy.propertyNameCn = [self.propertyNameCn copyWithZone:zone];
        copy.isColor = self.isColor;
        copy.inputType = self.inputType;
        copy.showOrder = self.showOrder;
        copy.isLogistics = self.isLogistics;
        copy.isDisplay = self.isDisplay;
        copy.searchBoost = self.searchBoost;
    }
    
    return copy;
}


@end
