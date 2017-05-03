//
//  ForYouCommonCategoryList.m
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForYouCommonCategoryList.h"


NSString *const kForYouCommonCategoryListCategoryName = @"categoryName";
NSString *const kForYouCommonCategoryListCategoryId = @"categoryId";
NSString *const kForYouCommonCategoryListParentId = @"parentId";
NSString *const kForYouCommonCategoryListReason = @"reason";
NSString *const kForYouCommonCategoryListIconUrl = @"iconUrl";


@interface ForYouCommonCategoryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForYouCommonCategoryList

@synthesize categoryName = _categoryName;
@synthesize categoryId = _categoryId;
@synthesize parentId = _parentId;
@synthesize reason = _reason;
@synthesize iconUrl = _iconUrl;


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
            self.categoryName = [self objectOrNilForKey:kForYouCommonCategoryListCategoryName fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kForYouCommonCategoryListCategoryId fromDictionary:dict] doubleValue];
            self.parentId = [[self objectOrNilForKey:kForYouCommonCategoryListParentId fromDictionary:dict] doubleValue];
            self.reason = [self objectOrNilForKey:kForYouCommonCategoryListReason fromDictionary:dict];
            self.iconUrl = [self objectOrNilForKey:kForYouCommonCategoryListIconUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.categoryName forKey:kForYouCommonCategoryListCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kForYouCommonCategoryListCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kForYouCommonCategoryListParentId];
    [mutableDict setValue:self.reason forKey:kForYouCommonCategoryListReason];
    [mutableDict setValue:self.iconUrl forKey:kForYouCommonCategoryListIconUrl];

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

    self.categoryName = [aDecoder decodeObjectForKey:kForYouCommonCategoryListCategoryName];
    self.categoryId = [aDecoder decodeDoubleForKey:kForYouCommonCategoryListCategoryId];
    self.parentId = [aDecoder decodeDoubleForKey:kForYouCommonCategoryListParentId];
    self.reason = [aDecoder decodeObjectForKey:kForYouCommonCategoryListReason];
    self.iconUrl = [aDecoder decodeObjectForKey:kForYouCommonCategoryListIconUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryName forKey:kForYouCommonCategoryListCategoryName];
    [aCoder encodeDouble:_categoryId forKey:kForYouCommonCategoryListCategoryId];
    [aCoder encodeDouble:_parentId forKey:kForYouCommonCategoryListParentId];
    [aCoder encodeObject:_reason forKey:kForYouCommonCategoryListReason];
    [aCoder encodeObject:_iconUrl forKey:kForYouCommonCategoryListIconUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForYouCommonCategoryList *copy = [[ForYouCommonCategoryList alloc] init];
    
    if (copy) {

        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.parentId = self.parentId;
        copy.reason = [self.reason copyWithZone:zone];
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
