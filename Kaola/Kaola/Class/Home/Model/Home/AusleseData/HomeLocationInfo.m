//
//  HomeLocationInfo.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeLocationInfo.h"


NSString *const kHomeLocationInfoDwIdentificationInfo = @"dwIdentificationInfo";
NSString *const kHomeLocationInfoRecIdentificationInfo = @"recIdentificationInfo";


@interface HomeLocationInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeLocationInfo

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
            self.dwIdentificationInfo = [self objectOrNilForKey:kHomeLocationInfoDwIdentificationInfo fromDictionary:dict];
            self.recIdentificationInfo = [self objectOrNilForKey:kHomeLocationInfoRecIdentificationInfo fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dwIdentificationInfo forKey:kHomeLocationInfoDwIdentificationInfo];
    [mutableDict setValue:self.recIdentificationInfo forKey:kHomeLocationInfoRecIdentificationInfo];

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

    self.dwIdentificationInfo = [aDecoder decodeObjectForKey:kHomeLocationInfoDwIdentificationInfo];
    self.recIdentificationInfo = [aDecoder decodeObjectForKey:kHomeLocationInfoRecIdentificationInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dwIdentificationInfo forKey:kHomeLocationInfoDwIdentificationInfo];
    [aCoder encodeObject:_recIdentificationInfo forKey:kHomeLocationInfoRecIdentificationInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeLocationInfo *copy = [[HomeLocationInfo alloc] init];
    
    if (copy) {

        copy.dwIdentificationInfo = [self.dwIdentificationInfo copyWithZone:zone];
        copy.recIdentificationInfo = [self.recIdentificationInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
