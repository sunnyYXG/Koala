//
//  MainBody.m
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MainBody.h"
#import "MainLevel2CategoryList.h"
#import "MainTopBanner.h"
#import "MainBrandList.h"


NSString *const kMainBodyLevel2CategoryList = @"level2CategoryList";
NSString *const kMainBodyTopBanner = @"topBanner";
NSString *const kMainBodyBrandList = @"brandList";


@interface MainBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainBody

@synthesize level2CategoryList = _level2CategoryList;
@synthesize topBanner = _topBanner;
@synthesize brandList = _brandList;


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
    NSObject *receivedMainLevel2CategoryList = [dict objectForKey:kMainBodyLevel2CategoryList];
    NSMutableArray *parsedMainLevel2CategoryList = [NSMutableArray array];
    if ([receivedMainLevel2CategoryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainLevel2CategoryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainLevel2CategoryList addObject:[MainLevel2CategoryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainLevel2CategoryList isKindOfClass:[NSDictionary class]]) {
       [parsedMainLevel2CategoryList addObject:[MainLevel2CategoryList modelObjectWithDictionary:(NSDictionary *)receivedMainLevel2CategoryList]];
    }

    self.level2CategoryList = [NSArray arrayWithArray:parsedMainLevel2CategoryList];
            self.topBanner = [MainTopBanner modelObjectWithDictionary:[dict objectForKey:kMainBodyTopBanner]];
    NSObject *receivedMainBrandList = [dict objectForKey:kMainBodyBrandList];
    NSMutableArray *parsedMainBrandList = [NSMutableArray array];
    if ([receivedMainBrandList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainBrandList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainBrandList addObject:[MainBrandList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainBrandList isKindOfClass:[NSDictionary class]]) {
       [parsedMainBrandList addObject:[MainBrandList modelObjectWithDictionary:(NSDictionary *)receivedMainBrandList]];
    }

    self.brandList = [NSArray arrayWithArray:parsedMainBrandList];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLevel2CategoryList] forKey:kMainBodyLevel2CategoryList];
    [mutableDict setValue:[self.topBanner dictionaryRepresentation] forKey:kMainBodyTopBanner];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBrandList] forKey:kMainBodyBrandList];

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

    self.level2CategoryList = [aDecoder decodeObjectForKey:kMainBodyLevel2CategoryList];
    self.topBanner = [aDecoder decodeObjectForKey:kMainBodyTopBanner];
    self.brandList = [aDecoder decodeObjectForKey:kMainBodyBrandList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_level2CategoryList forKey:kMainBodyLevel2CategoryList];
    [aCoder encodeObject:_topBanner forKey:kMainBodyTopBanner];
    [aCoder encodeObject:_brandList forKey:kMainBodyBrandList];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainBody *copy = [[MainBody alloc] init];
    
    if (copy) {

        copy.level2CategoryList = [self.level2CategoryList copyWithZone:zone];
        copy.topBanner = [self.topBanner copyWithZone:zone];
        copy.brandList = [self.brandList copyWithZone:zone];
    }
    
    return copy;
}


@end
