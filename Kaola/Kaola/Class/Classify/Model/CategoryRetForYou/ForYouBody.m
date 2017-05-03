//
//  ForYouBody.m
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForYouBody.h"
#import "ForYouCommonCategoryList.h"
#import "ForYouBrandList.h"
#import "ForYouTopBanner.h"
#import "ForYouHotCategoryList.h"
#import "ForYouAlbumList.h"


NSString *const kForYouBodyHotSaleLink = @"hotSaleLink";
NSString *const kForYouBodyCommonCategoryList = @"commonCategoryList";
NSString *const kForYouBodyBrandList = @"brandList";
NSString *const kForYouBodyTopBanner = @"topBanner";
NSString *const kForYouBodyHotCategoryList = @"hotCategoryList";
NSString *const kForYouBodyMoreAlbumLink = @"moreAlbumLink";
NSString *const kForYouBodyAlbumList = @"albumList";


@interface ForYouBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForYouBody

@synthesize hotSaleLink = _hotSaleLink;
@synthesize commonCategoryList = _commonCategoryList;
@synthesize brandList = _brandList;
@synthesize topBanner = _topBanner;
@synthesize hotCategoryList = _hotCategoryList;
@synthesize moreAlbumLink = _moreAlbumLink;
@synthesize albumList = _albumList;


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
            self.hotSaleLink = [self objectOrNilForKey:kForYouBodyHotSaleLink fromDictionary:dict];
    NSObject *receivedForYouCommonCategoryList = [dict objectForKey:kForYouBodyCommonCategoryList];
    NSMutableArray *parsedForYouCommonCategoryList = [NSMutableArray array];
    if ([receivedForYouCommonCategoryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedForYouCommonCategoryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedForYouCommonCategoryList addObject:[ForYouCommonCategoryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedForYouCommonCategoryList isKindOfClass:[NSDictionary class]]) {
       [parsedForYouCommonCategoryList addObject:[ForYouCommonCategoryList modelObjectWithDictionary:(NSDictionary *)receivedForYouCommonCategoryList]];
    }

    self.commonCategoryList = [NSArray arrayWithArray:parsedForYouCommonCategoryList];
    NSObject *receivedForYouBrandList = [dict objectForKey:kForYouBodyBrandList];
    NSMutableArray *parsedForYouBrandList = [NSMutableArray array];
    if ([receivedForYouBrandList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedForYouBrandList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedForYouBrandList addObject:[ForYouBrandList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedForYouBrandList isKindOfClass:[NSDictionary class]]) {
       [parsedForYouBrandList addObject:[ForYouBrandList modelObjectWithDictionary:(NSDictionary *)receivedForYouBrandList]];
    }

    self.brandList = [NSArray arrayWithArray:parsedForYouBrandList];
            self.topBanner = [ForYouTopBanner modelObjectWithDictionary:[dict objectForKey:kForYouBodyTopBanner]];
    NSObject *receivedForYouHotCategoryList = [dict objectForKey:kForYouBodyHotCategoryList];
    NSMutableArray *parsedForYouHotCategoryList = [NSMutableArray array];
    if ([receivedForYouHotCategoryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedForYouHotCategoryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedForYouHotCategoryList addObject:[ForYouHotCategoryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedForYouHotCategoryList isKindOfClass:[NSDictionary class]]) {
       [parsedForYouHotCategoryList addObject:[ForYouHotCategoryList modelObjectWithDictionary:(NSDictionary *)receivedForYouHotCategoryList]];
    }

    self.hotCategoryList = [NSArray arrayWithArray:parsedForYouHotCategoryList];
            self.moreAlbumLink = [self objectOrNilForKey:kForYouBodyMoreAlbumLink fromDictionary:dict];
    NSObject *receivedForYouAlbumList = [dict objectForKey:kForYouBodyAlbumList];
    NSMutableArray *parsedForYouAlbumList = [NSMutableArray array];
    if ([receivedForYouAlbumList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedForYouAlbumList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedForYouAlbumList addObject:[ForYouAlbumList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedForYouAlbumList isKindOfClass:[NSDictionary class]]) {
       [parsedForYouAlbumList addObject:[ForYouAlbumList modelObjectWithDictionary:(NSDictionary *)receivedForYouAlbumList]];
    }

    self.albumList = [NSArray arrayWithArray:parsedForYouAlbumList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hotSaleLink forKey:kForYouBodyHotSaleLink];
    NSMutableArray *tempArrayForCommonCategoryList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.commonCategoryList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCommonCategoryList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCommonCategoryList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCommonCategoryList] forKey:kForYouBodyCommonCategoryList];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBrandList] forKey:kForYouBodyBrandList];
    [mutableDict setValue:[self.topBanner dictionaryRepresentation] forKey:kForYouBodyTopBanner];
    NSMutableArray *tempArrayForHotCategoryList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotCategoryList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotCategoryList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotCategoryList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotCategoryList] forKey:kForYouBodyHotCategoryList];
    [mutableDict setValue:self.moreAlbumLink forKey:kForYouBodyMoreAlbumLink];
    NSMutableArray *tempArrayForAlbumList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.albumList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAlbumList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAlbumList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAlbumList] forKey:kForYouBodyAlbumList];

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

    self.hotSaleLink = [aDecoder decodeObjectForKey:kForYouBodyHotSaleLink];
    self.commonCategoryList = [aDecoder decodeObjectForKey:kForYouBodyCommonCategoryList];
    self.brandList = [aDecoder decodeObjectForKey:kForYouBodyBrandList];
    self.topBanner = [aDecoder decodeObjectForKey:kForYouBodyTopBanner];
    self.hotCategoryList = [aDecoder decodeObjectForKey:kForYouBodyHotCategoryList];
    self.moreAlbumLink = [aDecoder decodeObjectForKey:kForYouBodyMoreAlbumLink];
    self.albumList = [aDecoder decodeObjectForKey:kForYouBodyAlbumList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hotSaleLink forKey:kForYouBodyHotSaleLink];
    [aCoder encodeObject:_commonCategoryList forKey:kForYouBodyCommonCategoryList];
    [aCoder encodeObject:_brandList forKey:kForYouBodyBrandList];
    [aCoder encodeObject:_topBanner forKey:kForYouBodyTopBanner];
    [aCoder encodeObject:_hotCategoryList forKey:kForYouBodyHotCategoryList];
    [aCoder encodeObject:_moreAlbumLink forKey:kForYouBodyMoreAlbumLink];
    [aCoder encodeObject:_albumList forKey:kForYouBodyAlbumList];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForYouBody *copy = [[ForYouBody alloc] init];
    
    if (copy) {

        copy.hotSaleLink = [self.hotSaleLink copyWithZone:zone];
        copy.commonCategoryList = [self.commonCategoryList copyWithZone:zone];
        copy.brandList = [self.brandList copyWithZone:zone];
        copy.topBanner = [self.topBanner copyWithZone:zone];
        copy.hotCategoryList = [self.hotCategoryList copyWithZone:zone];
        copy.moreAlbumLink = [self.moreAlbumLink copyWithZone:zone];
        copy.albumList = [self.albumList copyWithZone:zone];
    }
    
    return copy;
}


@end
