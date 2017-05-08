//
//  HomeGuidanceViewList.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeGuidanceViewList.h"


NSString *const kHomeGuidanceViewListTitle = @"title";
NSString *const kHomeGuidanceViewListType = @"type";


@interface HomeGuidanceViewList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeGuidanceViewList

@synthesize title = _title;
@synthesize type = _type;


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
            self.title = [self objectOrNilForKey:kHomeGuidanceViewListTitle fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kHomeGuidanceViewListType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kHomeGuidanceViewListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kHomeGuidanceViewListType];

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

    self.title = [aDecoder decodeObjectForKey:kHomeGuidanceViewListTitle];
    self.type = [aDecoder decodeDoubleForKey:kHomeGuidanceViewListType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kHomeGuidanceViewListTitle];
    [aCoder encodeDouble:_type forKey:kHomeGuidanceViewListType];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeGuidanceViewList *copy = [[HomeGuidanceViewList alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
