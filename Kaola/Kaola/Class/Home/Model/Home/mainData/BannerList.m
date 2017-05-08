//
//  BannerList.m
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BannerList.h"


NSString *const kBannerListLinkUrl = @"linkUrl";
NSString *const kBannerListBiMark = @"biMark";
NSString *const kBannerListImgUrl = @"imgUrl";


@interface BannerList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BannerList

@synthesize linkUrl = _linkUrl;
@synthesize biMark = _biMark;
@synthesize imgUrl = _imgUrl;


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
            self.linkUrl = [self objectOrNilForKey:kBannerListLinkUrl fromDictionary:dict];
            self.biMark = [self objectOrNilForKey:kBannerListBiMark fromDictionary:dict];
            self.imgUrl = [self objectOrNilForKey:kBannerListImgUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.linkUrl forKey:kBannerListLinkUrl];
    [mutableDict setValue:self.biMark forKey:kBannerListBiMark];
    [mutableDict setValue:self.imgUrl forKey:kBannerListImgUrl];

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

    self.linkUrl = [aDecoder decodeObjectForKey:kBannerListLinkUrl];
    self.biMark = [aDecoder decodeObjectForKey:kBannerListBiMark];
    self.imgUrl = [aDecoder decodeObjectForKey:kBannerListImgUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_linkUrl forKey:kBannerListLinkUrl];
    [aCoder encodeObject:_biMark forKey:kBannerListBiMark];
    [aCoder encodeObject:_imgUrl forKey:kBannerListImgUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    BannerList *copy = [[BannerList alloc] init];
    
    if (copy) {

        copy.linkUrl = [self.linkUrl copyWithZone:zone];
        copy.biMark = [self.biMark copyWithZone:zone];
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
