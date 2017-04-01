//
//  Home.m
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Home.h"
#import "BannerList.h"
#import "LocationInfo.h"
#import "ItemList.h"


NSString *const kHomeBiMark = @"biMark";
NSString *const kHomeLinkUrl = @"linkUrl";
NSString *const kHomeViewCode = @"viewCode";
NSString *const kHomeStyleType = @"styleType";
NSString *const kHomeImageUrl = @"imageUrl";
NSString *const kHomeBannerList = @"bannerList";
NSString *const kHomeLocationInfo = @"locationInfo";
NSString *const kHomeItemList = @"itemList";


@interface Home ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Home

@synthesize biMark = _biMark;
@synthesize linkUrl = _linkUrl;
@synthesize viewCode = _viewCode;
@synthesize styleType = _styleType;
@synthesize imageUrl = _imageUrl;
@synthesize bannerList = _bannerList;
@synthesize locationInfo = _locationInfo;
@synthesize itemList = _itemList;


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
            self.biMark = [self objectOrNilForKey:kHomeBiMark fromDictionary:dict];
            self.linkUrl = [self objectOrNilForKey:kHomeLinkUrl fromDictionary:dict];
            self.viewCode = [self objectOrNilForKey:kHomeViewCode fromDictionary:dict];
            self.styleType = [[self objectOrNilForKey:kHomeStyleType fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kHomeImageUrl fromDictionary:dict];
    NSObject *receivedBannerList = [dict objectForKey:kHomeBannerList];
    NSMutableArray *parsedBannerList = [NSMutableArray array];
    if ([receivedBannerList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBannerList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBannerList addObject:[BannerList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBannerList isKindOfClass:[NSDictionary class]]) {
       [parsedBannerList addObject:[BannerList modelObjectWithDictionary:(NSDictionary *)receivedBannerList]];
    }

    self.bannerList = [NSArray arrayWithArray:parsedBannerList];
            self.locationInfo = [LocationInfo modelObjectWithDictionary:[dict objectForKey:kHomeLocationInfo]];
    NSObject *receivedItemList = [dict objectForKey:kHomeItemList];
    NSMutableArray *parsedItemList = [NSMutableArray array];
    if ([receivedItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItemList addObject:[ItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItemList isKindOfClass:[NSDictionary class]]) {
       [parsedItemList addObject:[ItemList modelObjectWithDictionary:(NSDictionary *)receivedItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedItemList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.biMark forKey:kHomeBiMark];
    [mutableDict setValue:self.linkUrl forKey:kHomeLinkUrl];
    [mutableDict setValue:self.viewCode forKey:kHomeViewCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.styleType] forKey:kHomeStyleType];
    [mutableDict setValue:self.imageUrl forKey:kHomeImageUrl];
    NSMutableArray *tempArrayForBannerList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.bannerList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBannerList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBannerList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBannerList] forKey:kHomeBannerList];
    [mutableDict setValue:[self.locationInfo dictionaryRepresentation] forKey:kHomeLocationInfo];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kHomeItemList];

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

    self.biMark = [aDecoder decodeObjectForKey:kHomeBiMark];
    self.linkUrl = [aDecoder decodeObjectForKey:kHomeLinkUrl];
    self.viewCode = [aDecoder decodeObjectForKey:kHomeViewCode];
    self.styleType = [aDecoder decodeDoubleForKey:kHomeStyleType];
    self.imageUrl = [aDecoder decodeObjectForKey:kHomeImageUrl];
    self.bannerList = [aDecoder decodeObjectForKey:kHomeBannerList];
    self.locationInfo = [aDecoder decodeObjectForKey:kHomeLocationInfo];
    self.itemList = [aDecoder decodeObjectForKey:kHomeItemList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_biMark forKey:kHomeBiMark];
    [aCoder encodeObject:_linkUrl forKey:kHomeLinkUrl];
    [aCoder encodeObject:_viewCode forKey:kHomeViewCode];
    [aCoder encodeDouble:_styleType forKey:kHomeStyleType];
    [aCoder encodeObject:_imageUrl forKey:kHomeImageUrl];
    [aCoder encodeObject:_bannerList forKey:kHomeBannerList];
    [aCoder encodeObject:_locationInfo forKey:kHomeLocationInfo];
    [aCoder encodeObject:_itemList forKey:kHomeItemList];
}

- (id)copyWithZone:(NSZone *)zone
{
    Home *copy = [[Home alloc] init];
    
    if (copy) {

        copy.biMark = [self.biMark copyWithZone:zone];
        copy.linkUrl = [self.linkUrl copyWithZone:zone];
        copy.viewCode = [self.viewCode copyWithZone:zone];
        copy.styleType = self.styleType;
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.bannerList = [self.bannerList copyWithZone:zone];
        copy.locationInfo = [self.locationInfo copyWithZone:zone];
        copy.itemList = [self.itemList copyWithZone:zone];
    }
    
    return copy;
}


@end
