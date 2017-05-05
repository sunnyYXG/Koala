//
//  MainBrandList.m
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MainBrandList.h"


NSString *const kMainBrandListIsFocus = @"isFocus";
NSString *const kMainBrandListKeyWords = @"keyWords";
NSString *const kMainBrandListBrandId = @"brandId";
NSString *const kMainBrandListFavorCount = @"favorCount";
NSString *const kMainBrandListBrandLogo = @"brandLogo";
NSString *const kMainBrandListBrandName = @"brandName";


@interface MainBrandList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainBrandList

@synthesize isFocus = _isFocus;
@synthesize keyWords = _keyWords;
@synthesize brandId = _brandId;
@synthesize favorCount = _favorCount;
@synthesize brandLogo = _brandLogo;
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
            self.isFocus = [[self objectOrNilForKey:kMainBrandListIsFocus fromDictionary:dict] doubleValue];
            self.keyWords = [self objectOrNilForKey:kMainBrandListKeyWords fromDictionary:dict];
            self.brandId = [[self objectOrNilForKey:kMainBrandListBrandId fromDictionary:dict] doubleValue];
            self.favorCount = [[self objectOrNilForKey:kMainBrandListFavorCount fromDictionary:dict] doubleValue];
            self.brandLogo = [self objectOrNilForKey:kMainBrandListBrandLogo fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kMainBrandListBrandName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFocus] forKey:kMainBrandListIsFocus];
    [mutableDict setValue:self.keyWords forKey:kMainBrandListKeyWords];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kMainBrandListBrandId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favorCount] forKey:kMainBrandListFavorCount];
    [mutableDict setValue:self.brandLogo forKey:kMainBrandListBrandLogo];
    [mutableDict setValue:self.brandName forKey:kMainBrandListBrandName];

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

    self.isFocus = [aDecoder decodeDoubleForKey:kMainBrandListIsFocus];
    self.keyWords = [aDecoder decodeObjectForKey:kMainBrandListKeyWords];
    self.brandId = [aDecoder decodeDoubleForKey:kMainBrandListBrandId];
    self.favorCount = [aDecoder decodeDoubleForKey:kMainBrandListFavorCount];
    self.brandLogo = [aDecoder decodeObjectForKey:kMainBrandListBrandLogo];
    self.brandName = [aDecoder decodeObjectForKey:kMainBrandListBrandName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isFocus forKey:kMainBrandListIsFocus];
    [aCoder encodeObject:_keyWords forKey:kMainBrandListKeyWords];
    [aCoder encodeDouble:_brandId forKey:kMainBrandListBrandId];
    [aCoder encodeDouble:_favorCount forKey:kMainBrandListFavorCount];
    [aCoder encodeObject:_brandLogo forKey:kMainBrandListBrandLogo];
    [aCoder encodeObject:_brandName forKey:kMainBrandListBrandName];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainBrandList *copy = [[MainBrandList alloc] init];
    
    if (copy) {

        copy.isFocus = self.isFocus;
        copy.keyWords = [self.keyWords copyWithZone:zone];
        copy.brandId = self.brandId;
        copy.favorCount = self.favorCount;
        copy.brandLogo = [self.brandLogo copyWithZone:zone];
        copy.brandName = [self.brandName copyWithZone:zone];
    }
    
    return copy;
}


@end
