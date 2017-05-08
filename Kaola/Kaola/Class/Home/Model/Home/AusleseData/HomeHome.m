//
//  HomeHome.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeHome.h"
#import "HomeLocationInfo.h"
#import "HomeItemList.h"
#import "HomeGuidanceViewList.h"


NSString *const kHomeHomeViewCode = @"viewCode";
NSString *const kHomeHomeStyleType = @"styleType";
NSString *const kHomeHomeLocationInfo = @"locationInfo";
NSString *const kHomeHomeItemList = @"itemList";
NSString *const kHomeHomeGuidanceViewList = @"guidanceViewList";


@interface HomeHome ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeHome

@synthesize viewCode = _viewCode;
@synthesize styleType = _styleType;
@synthesize locationInfo = _locationInfo;
@synthesize itemList = _itemList;
@synthesize guidanceViewList = _guidanceViewList;


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
            self.viewCode = [self objectOrNilForKey:kHomeHomeViewCode fromDictionary:dict];
            self.styleType = [[self objectOrNilForKey:kHomeHomeStyleType fromDictionary:dict] doubleValue];
            self.locationInfo = [HomeLocationInfo modelObjectWithDictionary:[dict objectForKey:kHomeHomeLocationInfo]];
    NSObject *receivedHomeItemList = [dict objectForKey:kHomeHomeItemList];
    NSMutableArray *parsedHomeItemList = [NSMutableArray array];
    if ([receivedHomeItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeItemList addObject:[HomeItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeItemList isKindOfClass:[NSDictionary class]]) {
       [parsedHomeItemList addObject:[HomeItemList modelObjectWithDictionary:(NSDictionary *)receivedHomeItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedHomeItemList];
    NSObject *receivedHomeGuidanceViewList = [dict objectForKey:kHomeHomeGuidanceViewList];
    NSMutableArray *parsedHomeGuidanceViewList = [NSMutableArray array];
    if ([receivedHomeGuidanceViewList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeGuidanceViewList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeGuidanceViewList addObject:[HomeGuidanceViewList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeGuidanceViewList isKindOfClass:[NSDictionary class]]) {
       [parsedHomeGuidanceViewList addObject:[HomeGuidanceViewList modelObjectWithDictionary:(NSDictionary *)receivedHomeGuidanceViewList]];
    }

    self.guidanceViewList = [NSArray arrayWithArray:parsedHomeGuidanceViewList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.viewCode forKey:kHomeHomeViewCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.styleType] forKey:kHomeHomeStyleType];
    [mutableDict setValue:[self.locationInfo dictionaryRepresentation] forKey:kHomeHomeLocationInfo];
    NSMutableArray *tempArrayForItemList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kHomeHomeItemList];
    NSMutableArray *tempArrayForGuidanceViewList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.guidanceViewList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGuidanceViewList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGuidanceViewList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGuidanceViewList] forKey:kHomeHomeGuidanceViewList];

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

    self.viewCode = [aDecoder decodeObjectForKey:kHomeHomeViewCode];
    self.styleType = [aDecoder decodeDoubleForKey:kHomeHomeStyleType];
    self.locationInfo = [aDecoder decodeObjectForKey:kHomeHomeLocationInfo];
    self.itemList = [aDecoder decodeObjectForKey:kHomeHomeItemList];
    self.guidanceViewList = [aDecoder decodeObjectForKey:kHomeHomeGuidanceViewList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_viewCode forKey:kHomeHomeViewCode];
    [aCoder encodeDouble:_styleType forKey:kHomeHomeStyleType];
    [aCoder encodeObject:_locationInfo forKey:kHomeHomeLocationInfo];
    [aCoder encodeObject:_itemList forKey:kHomeHomeItemList];
    [aCoder encodeObject:_guidanceViewList forKey:kHomeHomeGuidanceViewList];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeHome *copy = [[HomeHome alloc] init];
    
    if (copy) {

        copy.viewCode = [self.viewCode copyWithZone:zone];
        copy.styleType = self.styleType;
        copy.locationInfo = [self.locationInfo copyWithZone:zone];
        copy.itemList = [self.itemList copyWithZone:zone];
        copy.guidanceViewList = [self.guidanceViewList copyWithZone:zone];
    }
    
    return copy;
}


@end
