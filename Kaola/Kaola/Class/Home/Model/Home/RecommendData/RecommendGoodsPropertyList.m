//
//  RecommendGoodsPropertyList.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendGoodsPropertyList.h"
#import "RecommendPropertyValues.h"


NSString *const kRecommendGoodsPropertyListIsSku = @"isSku";
NSString *const kRecommendGoodsPropertyListPropertyNameId = @"propertyNameId";
NSString *const kRecommendGoodsPropertyListIsNecessary = @"isNecessary";
NSString *const kRecommendGoodsPropertyListIsFilter = @"isFilter";
NSString *const kRecommendGoodsPropertyListShowArea = @"showArea";
NSString *const kRecommendGoodsPropertyListPropertyValues = @"propertyValues";
NSString *const kRecommendGoodsPropertyListPropertyNameCn = @"propertyNameCn";
NSString *const kRecommendGoodsPropertyListIsColor = @"isColor";
NSString *const kRecommendGoodsPropertyListInputType = @"inputType";
NSString *const kRecommendGoodsPropertyListIsLogistics = @"isLogistics";
NSString *const kRecommendGoodsPropertyListShowOrder = @"showOrder";
NSString *const kRecommendGoodsPropertyListIsDisplay = @"isDisplay";
NSString *const kRecommendGoodsPropertyListSearchBoost = @"searchBoost";


@interface RecommendGoodsPropertyList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendGoodsPropertyList

@synthesize isSku = _isSku;
@synthesize propertyNameId = _propertyNameId;
@synthesize isNecessary = _isNecessary;
@synthesize isFilter = _isFilter;
@synthesize showArea = _showArea;
@synthesize propertyValues = _propertyValues;
@synthesize propertyNameCn = _propertyNameCn;
@synthesize isColor = _isColor;
@synthesize inputType = _inputType;
@synthesize isLogistics = _isLogistics;
@synthesize showOrder = _showOrder;
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
            self.isSku = [[self objectOrNilForKey:kRecommendGoodsPropertyListIsSku fromDictionary:dict] doubleValue];
            self.propertyNameId = [self objectOrNilForKey:kRecommendGoodsPropertyListPropertyNameId fromDictionary:dict];
            self.isNecessary = [[self objectOrNilForKey:kRecommendGoodsPropertyListIsNecessary fromDictionary:dict] doubleValue];
            self.isFilter = [[self objectOrNilForKey:kRecommendGoodsPropertyListIsFilter fromDictionary:dict] doubleValue];
            self.showArea = [[self objectOrNilForKey:kRecommendGoodsPropertyListShowArea fromDictionary:dict] doubleValue];
    NSObject *receivedRecommendPropertyValues = [dict objectForKey:kRecommendGoodsPropertyListPropertyValues];
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
            self.propertyNameCn = [self objectOrNilForKey:kRecommendGoodsPropertyListPropertyNameCn fromDictionary:dict];
            self.isColor = [[self objectOrNilForKey:kRecommendGoodsPropertyListIsColor fromDictionary:dict] doubleValue];
            self.inputType = [[self objectOrNilForKey:kRecommendGoodsPropertyListInputType fromDictionary:dict] doubleValue];
            self.isLogistics = [[self objectOrNilForKey:kRecommendGoodsPropertyListIsLogistics fromDictionary:dict] doubleValue];
            self.showOrder = [[self objectOrNilForKey:kRecommendGoodsPropertyListShowOrder fromDictionary:dict] doubleValue];
            self.isDisplay = [[self objectOrNilForKey:kRecommendGoodsPropertyListIsDisplay fromDictionary:dict] doubleValue];
            self.searchBoost = [[self objectOrNilForKey:kRecommendGoodsPropertyListSearchBoost fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSku] forKey:kRecommendGoodsPropertyListIsSku];
    [mutableDict setValue:self.propertyNameId forKey:kRecommendGoodsPropertyListPropertyNameId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isNecessary] forKey:kRecommendGoodsPropertyListIsNecessary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFilter] forKey:kRecommendGoodsPropertyListIsFilter];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showArea] forKey:kRecommendGoodsPropertyListShowArea];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPropertyValues] forKey:kRecommendGoodsPropertyListPropertyValues];
    [mutableDict setValue:self.propertyNameCn forKey:kRecommendGoodsPropertyListPropertyNameCn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isColor] forKey:kRecommendGoodsPropertyListIsColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inputType] forKey:kRecommendGoodsPropertyListInputType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isLogistics] forKey:kRecommendGoodsPropertyListIsLogistics];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showOrder] forKey:kRecommendGoodsPropertyListShowOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isDisplay] forKey:kRecommendGoodsPropertyListIsDisplay];
    [mutableDict setValue:[NSNumber numberWithDouble:self.searchBoost] forKey:kRecommendGoodsPropertyListSearchBoost];

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

    self.isSku = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListIsSku];
    self.propertyNameId = [aDecoder decodeObjectForKey:kRecommendGoodsPropertyListPropertyNameId];
    self.isNecessary = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListIsNecessary];
    self.isFilter = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListIsFilter];
    self.showArea = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListShowArea];
    self.propertyValues = [aDecoder decodeObjectForKey:kRecommendGoodsPropertyListPropertyValues];
    self.propertyNameCn = [aDecoder decodeObjectForKey:kRecommendGoodsPropertyListPropertyNameCn];
    self.isColor = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListIsColor];
    self.inputType = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListInputType];
    self.isLogistics = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListIsLogistics];
    self.showOrder = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListShowOrder];
    self.isDisplay = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListIsDisplay];
    self.searchBoost = [aDecoder decodeDoubleForKey:kRecommendGoodsPropertyListSearchBoost];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isSku forKey:kRecommendGoodsPropertyListIsSku];
    [aCoder encodeObject:_propertyNameId forKey:kRecommendGoodsPropertyListPropertyNameId];
    [aCoder encodeDouble:_isNecessary forKey:kRecommendGoodsPropertyListIsNecessary];
    [aCoder encodeDouble:_isFilter forKey:kRecommendGoodsPropertyListIsFilter];
    [aCoder encodeDouble:_showArea forKey:kRecommendGoodsPropertyListShowArea];
    [aCoder encodeObject:_propertyValues forKey:kRecommendGoodsPropertyListPropertyValues];
    [aCoder encodeObject:_propertyNameCn forKey:kRecommendGoodsPropertyListPropertyNameCn];
    [aCoder encodeDouble:_isColor forKey:kRecommendGoodsPropertyListIsColor];
    [aCoder encodeDouble:_inputType forKey:kRecommendGoodsPropertyListInputType];
    [aCoder encodeDouble:_isLogistics forKey:kRecommendGoodsPropertyListIsLogistics];
    [aCoder encodeDouble:_showOrder forKey:kRecommendGoodsPropertyListShowOrder];
    [aCoder encodeDouble:_isDisplay forKey:kRecommendGoodsPropertyListIsDisplay];
    [aCoder encodeDouble:_searchBoost forKey:kRecommendGoodsPropertyListSearchBoost];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendGoodsPropertyList *copy = [[RecommendGoodsPropertyList alloc] init];
    
    if (copy) {

        copy.isSku = self.isSku;
        copy.propertyNameId = [self.propertyNameId copyWithZone:zone];
        copy.isNecessary = self.isNecessary;
        copy.isFilter = self.isFilter;
        copy.showArea = self.showArea;
        copy.propertyValues = [self.propertyValues copyWithZone:zone];
        copy.propertyNameCn = [self.propertyNameCn copyWithZone:zone];
        copy.isColor = self.isColor;
        copy.inputType = self.inputType;
        copy.isLogistics = self.isLogistics;
        copy.showOrder = self.showOrder;
        copy.isDisplay = self.isDisplay;
        copy.searchBoost = self.searchBoost;
    }
    
    return copy;
}


@end
