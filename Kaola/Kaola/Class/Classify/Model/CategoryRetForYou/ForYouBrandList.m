//
//  ForYouBrandList.m
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForYouBrandList.h"


NSString *const kForYouBrandListIsFocus = @"isFocus";
NSString *const kForYouBrandListBrandLogo = @"brandLogo";
NSString *const kForYouBrandListBrandId = @"brandId";
NSString *const kForYouBrandListRecReason = @"recReason";
NSString *const kForYouBrandListFavorCount = @"favorCount";
NSString *const kForYouBrandListBrandName = @"brandName";


@interface ForYouBrandList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForYouBrandList

@synthesize isFocus = _isFocus;
@synthesize brandLogo = _brandLogo;
@synthesize brandId = _brandId;
@synthesize recReason = _recReason;
@synthesize favorCount = _favorCount;
@synthesize brandName = _brandName;


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
            self.isFocus = [[self objectOrNilForKey:kForYouBrandListIsFocus fromDictionary:dict] doubleValue];
            self.brandLogo = [self objectOrNilForKey:kForYouBrandListBrandLogo fromDictionary:dict];
            self.brandId = [[self objectOrNilForKey:kForYouBrandListBrandId fromDictionary:dict] doubleValue];
            self.recReason = [self objectOrNilForKey:kForYouBrandListRecReason fromDictionary:dict];
            self.favorCount = [[self objectOrNilForKey:kForYouBrandListFavorCount fromDictionary:dict] doubleValue];
            self.brandName = [self objectOrNilForKey:kForYouBrandListBrandName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFocus] forKey:kForYouBrandListIsFocus];
    [mutableDict setValue:self.brandLogo forKey:kForYouBrandListBrandLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kForYouBrandListBrandId];
    [mutableDict setValue:self.recReason forKey:kForYouBrandListRecReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favorCount] forKey:kForYouBrandListFavorCount];
    [mutableDict setValue:self.brandName forKey:kForYouBrandListBrandName];

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

    self.isFocus = [aDecoder decodeDoubleForKey:kForYouBrandListIsFocus];
    self.brandLogo = [aDecoder decodeObjectForKey:kForYouBrandListBrandLogo];
    self.brandId = [aDecoder decodeDoubleForKey:kForYouBrandListBrandId];
    self.recReason = [aDecoder decodeObjectForKey:kForYouBrandListRecReason];
    self.favorCount = [aDecoder decodeDoubleForKey:kForYouBrandListFavorCount];
    self.brandName = [aDecoder decodeObjectForKey:kForYouBrandListBrandName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isFocus forKey:kForYouBrandListIsFocus];
    [aCoder encodeObject:_brandLogo forKey:kForYouBrandListBrandLogo];
    [aCoder encodeDouble:_brandId forKey:kForYouBrandListBrandId];
    [aCoder encodeObject:_recReason forKey:kForYouBrandListRecReason];
    [aCoder encodeDouble:_favorCount forKey:kForYouBrandListFavorCount];
    [aCoder encodeObject:_brandName forKey:kForYouBrandListBrandName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForYouBrandList *copy = [[ForYouBrandList alloc] init];
    
    if (copy) {

        copy.isFocus = self.isFocus;
        copy.brandLogo = [self.brandLogo copyWithZone:zone];
        copy.brandId = self.brandId;
        copy.recReason = [self.recReason copyWithZone:zone];
        copy.favorCount = self.favorCount;
        copy.brandName = [self.brandName copyWithZone:zone];
    }
    
    return copy;
}


@end
