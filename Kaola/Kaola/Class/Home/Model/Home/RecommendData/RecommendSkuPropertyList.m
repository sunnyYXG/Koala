//
//  RecommendSkuPropertyList.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendSkuPropertyList.h"


NSString *const kRecommendSkuPropertyListPropertyName = @"propertyName";
NSString *const kRecommendSkuPropertyListPropertyValue = @"propertyValue";


@interface RecommendSkuPropertyList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendSkuPropertyList

@synthesize propertyName = _propertyName;
@synthesize propertyValue = _propertyValue;


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
            self.propertyName = [self objectOrNilForKey:kRecommendSkuPropertyListPropertyName fromDictionary:dict];
            self.propertyValue = [self objectOrNilForKey:kRecommendSkuPropertyListPropertyValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.propertyName forKey:kRecommendSkuPropertyListPropertyName];
    [mutableDict setValue:self.propertyValue forKey:kRecommendSkuPropertyListPropertyValue];

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

    self.propertyName = [aDecoder decodeObjectForKey:kRecommendSkuPropertyListPropertyName];
    self.propertyValue = [aDecoder decodeObjectForKey:kRecommendSkuPropertyListPropertyValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_propertyName forKey:kRecommendSkuPropertyListPropertyName];
    [aCoder encodeObject:_propertyValue forKey:kRecommendSkuPropertyListPropertyValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendSkuPropertyList *copy = [[RecommendSkuPropertyList alloc] init];
    
    if (copy) {

        copy.propertyName = [self.propertyName copyWithZone:zone];
        copy.propertyValue = [self.propertyValue copyWithZone:zone];
    }
    
    return copy;
}


@end
