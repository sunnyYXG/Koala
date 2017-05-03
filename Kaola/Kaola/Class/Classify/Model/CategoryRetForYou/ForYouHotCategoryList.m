//
//  ForYouHotCategoryList.m
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForYouHotCategoryList.h"


NSString *const kForYouHotCategoryListCategoryName = @"categoryName";
NSString *const kForYouHotCategoryListCategoryId = @"categoryId";
NSString *const kForYouHotCategoryListParentId = @"parentId";
NSString *const kForYouHotCategoryListReason = @"reason";
NSString *const kForYouHotCategoryListIconUrl = @"iconUrl";


@interface ForYouHotCategoryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForYouHotCategoryList

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
            self.categoryName = [self objectOrNilForKey:kForYouHotCategoryListCategoryName fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kForYouHotCategoryListCategoryId fromDictionary:dict] doubleValue];
            self.parentId = [[self objectOrNilForKey:kForYouHotCategoryListParentId fromDictionary:dict] doubleValue];
            self.reason = [self objectOrNilForKey:kForYouHotCategoryListReason fromDictionary:dict];
            self.iconUrl = [self objectOrNilForKey:kForYouHotCategoryListIconUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.categoryName forKey:kForYouHotCategoryListCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kForYouHotCategoryListCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kForYouHotCategoryListParentId];
    [mutableDict setValue:self.reason forKey:kForYouHotCategoryListReason];
    [mutableDict setValue:self.iconUrl forKey:kForYouHotCategoryListIconUrl];

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

    self.categoryName = [aDecoder decodeObjectForKey:kForYouHotCategoryListCategoryName];
    self.categoryId = [aDecoder decodeDoubleForKey:kForYouHotCategoryListCategoryId];
    self.parentId = [aDecoder decodeDoubleForKey:kForYouHotCategoryListParentId];
    self.reason = [aDecoder decodeObjectForKey:kForYouHotCategoryListReason];
    self.iconUrl = [aDecoder decodeObjectForKey:kForYouHotCategoryListIconUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryName forKey:kForYouHotCategoryListCategoryName];
    [aCoder encodeDouble:_categoryId forKey:kForYouHotCategoryListCategoryId];
    [aCoder encodeDouble:_parentId forKey:kForYouHotCategoryListParentId];
    [aCoder encodeObject:_reason forKey:kForYouHotCategoryListReason];
    [aCoder encodeObject:_iconUrl forKey:kForYouHotCategoryListIconUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForYouHotCategoryList *copy = [[ForYouHotCategoryList alloc] init];
    
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
