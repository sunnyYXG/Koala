//
//  CategoryBrandList.m
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryBrandList.h"


NSString *const kCategoryBrandListIsFocus = @"isFocus";
NSString *const kCategoryBrandListKeyWords = @"keyWords";
NSString *const kCategoryBrandListBrandId = @"brandId";
NSString *const kCategoryBrandListFavorCount = @"favorCount";
NSString *const kCategoryBrandListBrandLogo = @"brandLogo";
NSString *const kCategoryBrandListBrandName = @"brandName";


@interface CategoryBrandList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryBrandList

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
            self.isFocus = [[self objectOrNilForKey:kCategoryBrandListIsFocus fromDictionary:dict] doubleValue];
            self.keyWords = [self objectOrNilForKey:kCategoryBrandListKeyWords fromDictionary:dict];
            self.brandId = [[self objectOrNilForKey:kCategoryBrandListBrandId fromDictionary:dict] doubleValue];
            self.favorCount = [[self objectOrNilForKey:kCategoryBrandListFavorCount fromDictionary:dict] doubleValue];
            self.brandLogo = [self objectOrNilForKey:kCategoryBrandListBrandLogo fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kCategoryBrandListBrandName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFocus] forKey:kCategoryBrandListIsFocus];
    [mutableDict setValue:self.keyWords forKey:kCategoryBrandListKeyWords];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kCategoryBrandListBrandId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favorCount] forKey:kCategoryBrandListFavorCount];
    [mutableDict setValue:self.brandLogo forKey:kCategoryBrandListBrandLogo];
    [mutableDict setValue:self.brandName forKey:kCategoryBrandListBrandName];

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

    self.isFocus = [aDecoder decodeDoubleForKey:kCategoryBrandListIsFocus];
    self.keyWords = [aDecoder decodeObjectForKey:kCategoryBrandListKeyWords];
    self.brandId = [aDecoder decodeDoubleForKey:kCategoryBrandListBrandId];
    self.favorCount = [aDecoder decodeDoubleForKey:kCategoryBrandListFavorCount];
    self.brandLogo = [aDecoder decodeObjectForKey:kCategoryBrandListBrandLogo];
    self.brandName = [aDecoder decodeObjectForKey:kCategoryBrandListBrandName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isFocus forKey:kCategoryBrandListIsFocus];
    [aCoder encodeObject:_keyWords forKey:kCategoryBrandListKeyWords];
    [aCoder encodeDouble:_brandId forKey:kCategoryBrandListBrandId];
    [aCoder encodeDouble:_favorCount forKey:kCategoryBrandListFavorCount];
    [aCoder encodeObject:_brandLogo forKey:kCategoryBrandListBrandLogo];
    [aCoder encodeObject:_brandName forKey:kCategoryBrandListBrandName];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryBrandList *copy = [[CategoryBrandList alloc] init];
    
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
