//
//  LocationInfo.m
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LocationInfo.h"


NSString *const kLocationInfoDwIdentificationInfo = @"dwIdentificationInfo";
NSString *const kLocationInfoRecIdentificationInfo = @"recIdentificationInfo";


@interface LocationInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LocationInfo

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
            self.dwIdentificationInfo = [self objectOrNilForKey:kLocationInfoDwIdentificationInfo fromDictionary:dict];
            self.recIdentificationInfo = [self objectOrNilForKey:kLocationInfoRecIdentificationInfo fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dwIdentificationInfo forKey:kLocationInfoDwIdentificationInfo];
    [mutableDict setValue:self.recIdentificationInfo forKey:kLocationInfoRecIdentificationInfo];

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

    self.dwIdentificationInfo = [aDecoder decodeObjectForKey:kLocationInfoDwIdentificationInfo];
    self.recIdentificationInfo = [aDecoder decodeObjectForKey:kLocationInfoRecIdentificationInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dwIdentificationInfo forKey:kLocationInfoDwIdentificationInfo];
    [aCoder encodeObject:_recIdentificationInfo forKey:kLocationInfoRecIdentificationInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    LocationInfo *copy = [[LocationInfo alloc] init];
    
    if (copy) {

        copy.dwIdentificationInfo = [self.dwIdentificationInfo copyWithZone:zone];
        copy.recIdentificationInfo = [self.recIdentificationInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
