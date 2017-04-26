//
//  CategoryBody.m
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryBody.h"
#import "CategoryLevel2CategoryList.h"
#import "CategoryBrandList.h"
#import "CategoryTopBanner.h"
#import "CategoryHotActivityList.h"


NSString *const kCategoryBodyLevel2CategoryList = @"level2CategoryList";
NSString *const kCategoryBodyBrandList = @"brandList";
NSString *const kCategoryBodyTopBanner = @"topBanner";
NSString *const kCategoryBodyHotActivityList = @"hotActivityList";


@interface CategoryBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryBody

@synthesize level2CategoryList = _level2CategoryList;
@synthesize brandList = _brandList;
@synthesize topBanner = _topBanner;
@synthesize hotActivityList = _hotActivityList;


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
    NSObject *receivedCategoryLevel2CategoryList = [dict objectForKey:kCategoryBodyLevel2CategoryList];
    NSMutableArray *parsedCategoryLevel2CategoryList = [NSMutableArray array];
    if ([receivedCategoryLevel2CategoryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategoryLevel2CategoryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategoryLevel2CategoryList addObject:[CategoryLevel2CategoryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategoryLevel2CategoryList isKindOfClass:[NSDictionary class]]) {
       [parsedCategoryLevel2CategoryList addObject:[CategoryLevel2CategoryList modelObjectWithDictionary:(NSDictionary *)receivedCategoryLevel2CategoryList]];
    }

    self.level2CategoryList = [NSArray arrayWithArray:parsedCategoryLevel2CategoryList];
    NSObject *receivedCategoryBrandList = [dict objectForKey:kCategoryBodyBrandList];
    NSMutableArray *parsedCategoryBrandList = [NSMutableArray array];
    if ([receivedCategoryBrandList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategoryBrandList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategoryBrandList addObject:[CategoryBrandList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategoryBrandList isKindOfClass:[NSDictionary class]]) {
       [parsedCategoryBrandList addObject:[CategoryBrandList modelObjectWithDictionary:(NSDictionary *)receivedCategoryBrandList]];
    }

    self.brandList = [NSArray arrayWithArray:parsedCategoryBrandList];
            self.topBanner = [CategoryTopBanner modelObjectWithDictionary:[dict objectForKey:kCategoryBodyTopBanner]];
    NSObject *receivedCategoryHotActivityList = [dict objectForKey:kCategoryBodyHotActivityList];
    NSMutableArray *parsedCategoryHotActivityList = [NSMutableArray array];
    if ([receivedCategoryHotActivityList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategoryHotActivityList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategoryHotActivityList addObject:[CategoryHotActivityList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategoryHotActivityList isKindOfClass:[NSDictionary class]]) {
       [parsedCategoryHotActivityList addObject:[CategoryHotActivityList modelObjectWithDictionary:(NSDictionary *)receivedCategoryHotActivityList]];
    }

    self.hotActivityList = [NSArray arrayWithArray:parsedCategoryHotActivityList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLevel2CategoryList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.level2CategoryList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLevel2CategoryList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLevel2CategoryList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLevel2CategoryList] forKey:kCategoryBodyLevel2CategoryList];
    NSMutableArray *tempArrayForBrandList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.brandList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBrandList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBrandList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBrandList] forKey:kCategoryBodyBrandList];
    [mutableDict setValue:[self.topBanner dictionaryRepresentation] forKey:kCategoryBodyTopBanner];
    NSMutableArray *tempArrayForHotActivityList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotActivityList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotActivityList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotActivityList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotActivityList] forKey:kCategoryBodyHotActivityList];

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

    self.level2CategoryList = [aDecoder decodeObjectForKey:kCategoryBodyLevel2CategoryList];
    self.brandList = [aDecoder decodeObjectForKey:kCategoryBodyBrandList];
    self.topBanner = [aDecoder decodeObjectForKey:kCategoryBodyTopBanner];
    self.hotActivityList = [aDecoder decodeObjectForKey:kCategoryBodyHotActivityList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_level2CategoryList forKey:kCategoryBodyLevel2CategoryList];
    [aCoder encodeObject:_brandList forKey:kCategoryBodyBrandList];
    [aCoder encodeObject:_topBanner forKey:kCategoryBodyTopBanner];
    [aCoder encodeObject:_hotActivityList forKey:kCategoryBodyHotActivityList];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryBody *copy = [[CategoryBody alloc] init];
    
    if (copy) {

        copy.level2CategoryList = [self.level2CategoryList copyWithZone:zone];
        copy.brandList = [self.brandList copyWithZone:zone];
        copy.topBanner = [self.topBanner copyWithZone:zone];
        copy.hotActivityList = [self.hotActivityList copyWithZone:zone];
    }
    
    return copy;
}


@end
