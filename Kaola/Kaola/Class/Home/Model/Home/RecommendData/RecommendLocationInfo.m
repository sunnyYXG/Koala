//
//  RecommendLocationInfo.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendLocationInfo.h"


NSString *const kRecommendLocationInfoDwIdentificationInfo = @"dwIdentificationInfo";
NSString *const kRecommendLocationInfoRecIdentificationInfo = @"recIdentificationInfo";


@interface RecommendLocationInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendLocationInfo

@synthesize dwIdentificationInfo = _dwIdentificationInfo;
@synthesize recIdentificationInfo = _recIdentificationInfo;


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
            self.dwIdentificationInfo = [self objectOrNilForKey:kRecommendLocationInfoDwIdentificationInfo fromDictionary:dict];
            self.recIdentificationInfo = [self objectOrNilForKey:kRecommendLocationInfoRecIdentificationInfo fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dwIdentificationInfo forKey:kRecommendLocationInfoDwIdentificationInfo];
    [mutableDict setValue:self.recIdentificationInfo forKey:kRecommendLocationInfoRecIdentificationInfo];

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

    self.dwIdentificationInfo = [aDecoder decodeObjectForKey:kRecommendLocationInfoDwIdentificationInfo];
    self.recIdentificationInfo = [aDecoder decodeObjectForKey:kRecommendLocationInfoRecIdentificationInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dwIdentificationInfo forKey:kRecommendLocationInfoDwIdentificationInfo];
    [aCoder encodeObject:_recIdentificationInfo forKey:kRecommendLocationInfoRecIdentificationInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendLocationInfo *copy = [[RecommendLocationInfo alloc] init];
    
    if (copy) {

        copy.dwIdentificationInfo = [self.dwIdentificationInfo copyWithZone:zone];
        copy.recIdentificationInfo = [self.recIdentificationInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
