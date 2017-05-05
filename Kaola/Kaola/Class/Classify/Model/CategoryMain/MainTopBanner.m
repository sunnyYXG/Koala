//
//  MainTopBanner.m
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MainTopBanner.h"


NSString *const kMainTopBannerActivityName = @"activityName";
NSString *const kMainTopBannerActivityPic = @"activityPic";
NSString *const kMainTopBannerActivityUrl = @"activityUrl";


@interface MainTopBanner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainTopBanner

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
            self.activityName = [self objectOrNilForKey:kMainTopBannerActivityName fromDictionary:dict];
            self.activityPic = [self objectOrNilForKey:kMainTopBannerActivityPic fromDictionary:dict];
            self.activityUrl = [self objectOrNilForKey:kMainTopBannerActivityUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.activityName forKey:kMainTopBannerActivityName];
    [mutableDict setValue:self.activityPic forKey:kMainTopBannerActivityPic];
    [mutableDict setValue:self.activityUrl forKey:kMainTopBannerActivityUrl];

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

    self.activityName = [aDecoder decodeObjectForKey:kMainTopBannerActivityName];
    self.activityPic = [aDecoder decodeObjectForKey:kMainTopBannerActivityPic];
    self.activityUrl = [aDecoder decodeObjectForKey:kMainTopBannerActivityUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activityName forKey:kMainTopBannerActivityName];
    [aCoder encodeObject:_activityPic forKey:kMainTopBannerActivityPic];
    [aCoder encodeObject:_activityUrl forKey:kMainTopBannerActivityUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainTopBanner *copy = [[MainTopBanner alloc] init];
    
    if (copy) {

        copy.activityName = [self.activityName copyWithZone:zone];
        copy.activityPic = [self.activityPic copyWithZone:zone];
        copy.activityUrl = [self.activityUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
