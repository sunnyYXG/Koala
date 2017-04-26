//
//  CategoryHotActivityList.m
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryHotActivityList.h"


NSString *const kCategoryHotActivityListActivityName = @"activityName";
NSString *const kCategoryHotActivityListActivityPic = @"activityPic";
NSString *const kCategoryHotActivityListActivityUrl = @"activityUrl";


@interface CategoryHotActivityList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryHotActivityList

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
            self.activityName = [self objectOrNilForKey:kCategoryHotActivityListActivityName fromDictionary:dict];
            self.activityPic = [self objectOrNilForKey:kCategoryHotActivityListActivityPic fromDictionary:dict];
            self.activityUrl = [self objectOrNilForKey:kCategoryHotActivityListActivityUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.activityName forKey:kCategoryHotActivityListActivityName];
    [mutableDict setValue:self.activityPic forKey:kCategoryHotActivityListActivityPic];
    [mutableDict setValue:self.activityUrl forKey:kCategoryHotActivityListActivityUrl];

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

    self.activityName = [aDecoder decodeObjectForKey:kCategoryHotActivityListActivityName];
    self.activityPic = [aDecoder decodeObjectForKey:kCategoryHotActivityListActivityPic];
    self.activityUrl = [aDecoder decodeObjectForKey:kCategoryHotActivityListActivityUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activityName forKey:kCategoryHotActivityListActivityName];
    [aCoder encodeObject:_activityPic forKey:kCategoryHotActivityListActivityPic];
    [aCoder encodeObject:_activityUrl forKey:kCategoryHotActivityListActivityUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryHotActivityList *copy = [[CategoryHotActivityList alloc] init];
    
    if (copy) {

        copy.activityName = [self.activityName copyWithZone:zone];
        copy.activityPic = [self.activityPic copyWithZone:zone];
        copy.activityUrl = [self.activityUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
