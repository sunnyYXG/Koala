//
//  CategoryLevel2CategoryList.m
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryLevel2CategoryList.h"
#import "CategoryChildCategoryViewList.h"


NSString *const kCategoryLevel2CategoryListHotSaleLinkUrl = @"hotSaleLinkUrl";
NSString *const kCategoryLevel2CategoryListCategoryId = @"categoryId";
NSString *const kCategoryLevel2CategoryListChildCategoryViewList = @"childCategoryViewList";
NSString *const kCategoryLevel2CategoryListCategoryName = @"categoryName";
NSString *const kCategoryLevel2CategoryListParentId = @"parentId";


@interface CategoryLevel2CategoryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryLevel2CategoryList

@synthesize hotSaleLinkUrl = _hotSaleLinkUrl;
@synthesize categoryId = _categoryId;
@synthesize childCategoryViewList = _childCategoryViewList;
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
            self.hotSaleLinkUrl = [self objectOrNilForKey:kCategoryLevel2CategoryListHotSaleLinkUrl fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kCategoryLevel2CategoryListCategoryId fromDictionary:dict] doubleValue];
    NSObject *receivedCategoryChildCategoryViewList = [dict objectForKey:kCategoryLevel2CategoryListChildCategoryViewList];
    NSMutableArray *parsedCategoryChildCategoryViewList = [NSMutableArray array];
    if ([receivedCategoryChildCategoryViewList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCategoryChildCategoryViewList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCategoryChildCategoryViewList addObject:[CategoryChildCategoryViewList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCategoryChildCategoryViewList isKindOfClass:[NSDictionary class]]) {
       [parsedCategoryChildCategoryViewList addObject:[CategoryChildCategoryViewList modelObjectWithDictionary:(NSDictionary *)receivedCategoryChildCategoryViewList]];
    }

    self.childCategoryViewList = [NSArray arrayWithArray:parsedCategoryChildCategoryViewList];
            self.categoryName = [self objectOrNilForKey:kCategoryLevel2CategoryListCategoryName fromDictionary:dict];
            self.parentId = [[self objectOrNilForKey:kCategoryLevel2CategoryListParentId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hotSaleLinkUrl forKey:kCategoryLevel2CategoryListHotSaleLinkUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kCategoryLevel2CategoryListCategoryId];
    NSMutableArray *tempArrayForChildCategoryViewList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.childCategoryViewList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForChildCategoryViewList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForChildCategoryViewList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChildCategoryViewList] forKey:kCategoryLevel2CategoryListChildCategoryViewList];
    [mutableDict setValue:self.categoryName forKey:kCategoryLevel2CategoryListCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kCategoryLevel2CategoryListParentId];

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

    self.hotSaleLinkUrl = [aDecoder decodeObjectForKey:kCategoryLevel2CategoryListHotSaleLinkUrl];
    self.categoryId = [aDecoder decodeDoubleForKey:kCategoryLevel2CategoryListCategoryId];
    self.childCategoryViewList = [aDecoder decodeObjectForKey:kCategoryLevel2CategoryListChildCategoryViewList];
    self.categoryName = [aDecoder decodeObjectForKey:kCategoryLevel2CategoryListCategoryName];
    self.parentId = [aDecoder decodeDoubleForKey:kCategoryLevel2CategoryListParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hotSaleLinkUrl forKey:kCategoryLevel2CategoryListHotSaleLinkUrl];
    [aCoder encodeDouble:_categoryId forKey:kCategoryLevel2CategoryListCategoryId];
    [aCoder encodeObject:_childCategoryViewList forKey:kCategoryLevel2CategoryListChildCategoryViewList];
    [aCoder encodeObject:_categoryName forKey:kCategoryLevel2CategoryListCategoryName];
    [aCoder encodeDouble:_parentId forKey:kCategoryLevel2CategoryListParentId];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryLevel2CategoryList *copy = [[CategoryLevel2CategoryList alloc] init];
    
    if (copy) {

        copy.hotSaleLinkUrl = [self.hotSaleLinkUrl copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.childCategoryViewList = [self.childCategoryViewList copyWithZone:zone];
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.parentId = self.parentId;
    }
    
    return copy;
}


@end
