//
//  CategoryChildCategoryViewList.m
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryChildCategoryViewList.h"


NSString *const kCategoryChildCategoryViewListCategoryId = @"categoryId";
NSString *const kCategoryChildCategoryViewListIconUrl = @"iconUrl";
NSString *const kCategoryChildCategoryViewListCategoryName = @"categoryName";
NSString *const kCategoryChildCategoryViewListParentId = @"parentId";


@interface CategoryChildCategoryViewList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryChildCategoryViewList

@synthesize categoryId = _categoryId;
@synthesize iconUrl = _iconUrl;
@synthesize categoryName = _categoryName;
@synthesize parentId = _parentId;


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
            self.categoryId = [[self objectOrNilForKey:kCategoryChildCategoryViewListCategoryId fromDictionary:dict] doubleValue];
            self.iconUrl = [self objectOrNilForKey:kCategoryChildCategoryViewListIconUrl fromDictionary:dict];
            self.categoryName = [self objectOrNilForKey:kCategoryChildCategoryViewListCategoryName fromDictionary:dict];
            self.parentId = [[self objectOrNilForKey:kCategoryChildCategoryViewListParentId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kCategoryChildCategoryViewListCategoryId];
    [mutableDict setValue:self.iconUrl forKey:kCategoryChildCategoryViewListIconUrl];
    [mutableDict setValue:self.categoryName forKey:kCategoryChildCategoryViewListCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kCategoryChildCategoryViewListParentId];

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

    self.categoryId = [aDecoder decodeDoubleForKey:kCategoryChildCategoryViewListCategoryId];
    self.iconUrl = [aDecoder decodeObjectForKey:kCategoryChildCategoryViewListIconUrl];
    self.categoryName = [aDecoder decodeObjectForKey:kCategoryChildCategoryViewListCategoryName];
    self.parentId = [aDecoder decodeDoubleForKey:kCategoryChildCategoryViewListParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_categoryId forKey:kCategoryChildCategoryViewListCategoryId];
    [aCoder encodeObject:_iconUrl forKey:kCategoryChildCategoryViewListIconUrl];
    [aCoder encodeObject:_categoryName forKey:kCategoryChildCategoryViewListCategoryName];
    [aCoder encodeDouble:_parentId forKey:kCategoryChildCategoryViewListParentId];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryChildCategoryViewList *copy = [[CategoryChildCategoryViewList alloc] init];
    
    if (copy) {

        copy.categoryId = self.categoryId;
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.parentId = self.parentId;
    }
    
    return copy;
}


@end
