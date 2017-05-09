//
//  RecommendPropertyValues.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendPropertyValues.h"


NSString *const kRecommendPropertyValuesPropertyValueId = @"propertyValueId";
NSString *const kRecommendPropertyValuesPropertyValue = @"propertyValue";
NSString *const kRecommendPropertyValuesPropertyValueIcon = @"propertyValueIcon";
NSString *const kRecommendPropertyValuesPropertyNameId = @"propertyNameId";
NSString *const kRecommendPropertyValuesNameAlias = @"nameAlias";
NSString *const kRecommendPropertyValuesShowOrder = @"showOrder";
NSString *const kRecommendPropertyValuesHasIntroduce = @"hasIntroduce";
NSString *const kRecommendPropertyValuesIsSysProperty = @"isSysProperty";
NSString *const kRecommendPropertyValuesIsSelected = @"isSelected";


@interface RecommendPropertyValues ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendPropertyValues

@synthesize propertyValueId = _propertyValueId;
@synthesize propertyValue = _propertyValue;
@synthesize propertyValueIcon = _propertyValueIcon;
@synthesize propertyNameId = _propertyNameId;
@synthesize nameAlias = _nameAlias;
@synthesize showOrder = _showOrder;
@synthesize hasIntroduce = _hasIntroduce;
@synthesize isSysProperty = _isSysProperty;
@synthesize isSelected = _isSelected;


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
            self.propertyValueId = [self objectOrNilForKey:kRecommendPropertyValuesPropertyValueId fromDictionary:dict];
            self.propertyValue = [self objectOrNilForKey:kRecommendPropertyValuesPropertyValue fromDictionary:dict];
            self.propertyValueIcon = [self objectOrNilForKey:kRecommendPropertyValuesPropertyValueIcon fromDictionary:dict];
            self.propertyNameId = [self objectOrNilForKey:kRecommendPropertyValuesPropertyNameId fromDictionary:dict];
            self.nameAlias = [self objectOrNilForKey:kRecommendPropertyValuesNameAlias fromDictionary:dict];
            self.showOrder = [[self objectOrNilForKey:kRecommendPropertyValuesShowOrder fromDictionary:dict] doubleValue];
            self.hasIntroduce = [[self objectOrNilForKey:kRecommendPropertyValuesHasIntroduce fromDictionary:dict] doubleValue];
            self.isSysProperty = [[self objectOrNilForKey:kRecommendPropertyValuesIsSysProperty fromDictionary:dict] doubleValue];
            self.isSelected = [[self objectOrNilForKey:kRecommendPropertyValuesIsSelected fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.propertyValueId forKey:kRecommendPropertyValuesPropertyValueId];
    [mutableDict setValue:self.propertyValue forKey:kRecommendPropertyValuesPropertyValue];
    [mutableDict setValue:self.propertyValueIcon forKey:kRecommendPropertyValuesPropertyValueIcon];
    [mutableDict setValue:self.propertyNameId forKey:kRecommendPropertyValuesPropertyNameId];
    [mutableDict setValue:self.nameAlias forKey:kRecommendPropertyValuesNameAlias];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showOrder] forKey:kRecommendPropertyValuesShowOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasIntroduce] forKey:kRecommendPropertyValuesHasIntroduce];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSysProperty] forKey:kRecommendPropertyValuesIsSysProperty];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isSelected] forKey:kRecommendPropertyValuesIsSelected];

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

    self.propertyValueId = [aDecoder decodeObjectForKey:kRecommendPropertyValuesPropertyValueId];
    self.propertyValue = [aDecoder decodeObjectForKey:kRecommendPropertyValuesPropertyValue];
    self.propertyValueIcon = [aDecoder decodeObjectForKey:kRecommendPropertyValuesPropertyValueIcon];
    self.propertyNameId = [aDecoder decodeObjectForKey:kRecommendPropertyValuesPropertyNameId];
    self.nameAlias = [aDecoder decodeObjectForKey:kRecommendPropertyValuesNameAlias];
    self.showOrder = [aDecoder decodeDoubleForKey:kRecommendPropertyValuesShowOrder];
    self.hasIntroduce = [aDecoder decodeDoubleForKey:kRecommendPropertyValuesHasIntroduce];
    self.isSysProperty = [aDecoder decodeDoubleForKey:kRecommendPropertyValuesIsSysProperty];
    self.isSelected = [aDecoder decodeDoubleForKey:kRecommendPropertyValuesIsSelected];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_propertyValueId forKey:kRecommendPropertyValuesPropertyValueId];
    [aCoder encodeObject:_propertyValue forKey:kRecommendPropertyValuesPropertyValue];
    [aCoder encodeObject:_propertyValueIcon forKey:kRecommendPropertyValuesPropertyValueIcon];
    [aCoder encodeObject:_propertyNameId forKey:kRecommendPropertyValuesPropertyNameId];
    [aCoder encodeObject:_nameAlias forKey:kRecommendPropertyValuesNameAlias];
    [aCoder encodeDouble:_showOrder forKey:kRecommendPropertyValuesShowOrder];
    [aCoder encodeDouble:_hasIntroduce forKey:kRecommendPropertyValuesHasIntroduce];
    [aCoder encodeDouble:_isSysProperty forKey:kRecommendPropertyValuesIsSysProperty];
    [aCoder encodeDouble:_isSelected forKey:kRecommendPropertyValuesIsSelected];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendPropertyValues *copy = [[RecommendPropertyValues alloc] init];
    
    if (copy) {

        copy.propertyValueId = [self.propertyValueId copyWithZone:zone];
        copy.propertyValue = [self.propertyValue copyWithZone:zone];
        copy.propertyValueIcon = [self.propertyValueIcon copyWithZone:zone];
        copy.propertyNameId = [self.propertyNameId copyWithZone:zone];
        copy.nameAlias = [self.nameAlias copyWithZone:zone];
        copy.showOrder = self.showOrder;
        copy.hasIntroduce = self.hasIntroduce;
        copy.isSysProperty = self.isSysProperty;
        copy.isSelected = self.isSelected;
    }
    
    return copy;
}


@end
