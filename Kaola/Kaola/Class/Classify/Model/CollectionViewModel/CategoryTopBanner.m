//
//  CategoryTopBanner.m
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryTopBanner.h"


NSString *const kCategoryTopBannerActivityName = @"activityName";
NSString *const kCategoryTopBannerActivityPic = @"activityPic";
NSString *const kCategoryTopBannerActivityUrl = @"activityUrl";


@interface CategoryTopBanner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryTopBanner

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
            self.activityName = [self objectOrNilForKey:kCategoryTopBannerActivityName fromDictionary:dict];
            self.activityPic = [self objectOrNilForKey:kCategoryTopBannerActivityPic fromDictionary:dict];
            self.activityUrl = [self objectOrNilForKey:kCategoryTopBannerActivityUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.activityName forKey:kCategoryTopBannerActivityName];
    [mutableDict setValue:self.activityPic forKey:kCategoryTopBannerActivityPic];
    [mutableDict setValue:self.activityUrl forKey:kCategoryTopBannerActivityUrl];

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

    self.activityName = [aDecoder decodeObjectForKey:kCategoryTopBannerActivityName];
    self.activityPic = [aDecoder decodeObjectForKey:kCategoryTopBannerActivityPic];
    self.activityUrl = [aDecoder decodeObjectForKey:kCategoryTopBannerActivityUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activityName forKey:kCategoryTopBannerActivityName];
    [aCoder encodeObject:_activityPic forKey:kCategoryTopBannerActivityPic];
    [aCoder encodeObject:_activityUrl forKey:kCategoryTopBannerActivityUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryTopBanner *copy = [[CategoryTopBanner alloc] init];
    
    if (copy) {

        copy.activityName = [self.activityName copyWithZone:zone];
        copy.activityPic = [self.activityPic copyWithZone:zone];
        copy.activityUrl = [self.activityUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
