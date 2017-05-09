//
//  RecommendZhengdanActivity.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendZhengdanActivity.h"


NSString *const kRecommendZhengdanActivityActivityTitle = @"activityTitle";
NSString *const kRecommendZhengdanActivityActivityUrl = @"activityUrl";


@interface RecommendZhengdanActivity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendZhengdanActivity

@synthesize activityTitle = _activityTitle;
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
            self.activityTitle = [self objectOrNilForKey:kRecommendZhengdanActivityActivityTitle fromDictionary:dict];
            self.activityUrl = [self objectOrNilForKey:kRecommendZhengdanActivityActivityUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.activityTitle forKey:kRecommendZhengdanActivityActivityTitle];
    [mutableDict setValue:self.activityUrl forKey:kRecommendZhengdanActivityActivityUrl];

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

    self.activityTitle = [aDecoder decodeObjectForKey:kRecommendZhengdanActivityActivityTitle];
    self.activityUrl = [aDecoder decodeObjectForKey:kRecommendZhengdanActivityActivityUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activityTitle forKey:kRecommendZhengdanActivityActivityTitle];
    [aCoder encodeObject:_activityUrl forKey:kRecommendZhengdanActivityActivityUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendZhengdanActivity *copy = [[RecommendZhengdanActivity alloc] init];
    
    if (copy) {

        copy.activityTitle = [self.activityTitle copyWithZone:zone];
        copy.activityUrl = [self.activityUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
