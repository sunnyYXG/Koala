//
//  ForYouTopBanner.m
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForYouTopBanner.h"


NSString *const kForYouTopBannerActivityName = @"activityName";
NSString *const kForYouTopBannerActivityPic = @"activityPic";
NSString *const kForYouTopBannerActivityUrl = @"activityUrl";


@interface ForYouTopBanner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForYouTopBanner

@synthesize activityName = _activityName;
@synthesize activityPic = _activityPic;
@synthesize activityUrl = _activityUrl;


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
            self.activityName = [self objectOrNilForKey:kForYouTopBannerActivityName fromDictionary:dict];
            self.activityPic = [self objectOrNilForKey:kForYouTopBannerActivityPic fromDictionary:dict];
            self.activityUrl = [self objectOrNilForKey:kForYouTopBannerActivityUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.activityName forKey:kForYouTopBannerActivityName];
    [mutableDict setValue:self.activityPic forKey:kForYouTopBannerActivityPic];
    [mutableDict setValue:self.activityUrl forKey:kForYouTopBannerActivityUrl];

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

    self.activityName = [aDecoder decodeObjectForKey:kForYouTopBannerActivityName];
    self.activityPic = [aDecoder decodeObjectForKey:kForYouTopBannerActivityPic];
    self.activityUrl = [aDecoder decodeObjectForKey:kForYouTopBannerActivityUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activityName forKey:kForYouTopBannerActivityName];
    [aCoder encodeObject:_activityPic forKey:kForYouTopBannerActivityPic];
    [aCoder encodeObject:_activityUrl forKey:kForYouTopBannerActivityUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForYouTopBanner *copy = [[ForYouTopBanner alloc] init];
    
    if (copy) {

        copy.activityName = [self.activityName copyWithZone:zone];
        copy.activityPic = [self.activityPic copyWithZone:zone];
        copy.activityUrl = [self.activityUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
