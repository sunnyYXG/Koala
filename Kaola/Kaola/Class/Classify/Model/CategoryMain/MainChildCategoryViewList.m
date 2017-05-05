//
//  MainChildCategoryViewList.m
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MainChildCategoryViewList.h"


NSString *const kMainChildCategoryViewListCategoryId = @"categoryId";
NSString *const kMainChildCategoryViewListIconUrl = @"iconUrl";
NSString *const kMainChildCategoryViewListCategoryName = @"categoryName";
NSString *const kMainChildCategoryViewListParentId = @"parentId";


@interface MainChildCategoryViewList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainChildCategoryViewList

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
            self.categoryId = [[self objectOrNilForKey:kMainChildCategoryViewListCategoryId fromDictionary:dict] doubleValue];
            self.iconUrl = [self objectOrNilForKey:kMainChildCategoryViewListIconUrl fromDictionary:dict];
            self.categoryName = [self objectOrNilForKey:kMainChildCategoryViewListCategoryName fromDictionary:dict];
            self.parentId = [[self objectOrNilForKey:kMainChildCategoryViewListParentId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kMainChildCategoryViewListCategoryId];
    [mutableDict setValue:self.iconUrl forKey:kMainChildCategoryViewListIconUrl];
    [mutableDict setValue:self.categoryName forKey:kMainChildCategoryViewListCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kMainChildCategoryViewListParentId];

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

    self.categoryId = [aDecoder decodeDoubleForKey:kMainChildCategoryViewListCategoryId];
    self.iconUrl = [aDecoder decodeObjectForKey:kMainChildCategoryViewListIconUrl];
    self.categoryName = [aDecoder decodeObjectForKey:kMainChildCategoryViewListCategoryName];
    self.parentId = [aDecoder decodeDoubleForKey:kMainChildCategoryViewListParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_categoryId forKey:kMainChildCategoryViewListCategoryId];
    [aCoder encodeObject:_iconUrl forKey:kMainChildCategoryViewListIconUrl];
    [aCoder encodeObject:_categoryName forKey:kMainChildCategoryViewListCategoryName];
    [aCoder encodeDouble:_parentId forKey:kMainChildCategoryViewListParentId];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainChildCategoryViewList *copy = [[MainChildCategoryViewList alloc] init];
    
    if (copy) {

        copy.categoryId = self.categoryId;
        copy.iconUrl = [self.iconUrl copyWithZone:zone];
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.parentId = self.parentId;
    }
    
    return copy;
}


@end
