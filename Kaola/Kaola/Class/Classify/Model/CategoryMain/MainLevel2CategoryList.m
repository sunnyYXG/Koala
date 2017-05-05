//
//  MainLevel2CategoryList.m
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MainLevel2CategoryList.h"
#import "MainChildCategoryViewList.h"


NSString *const kMainLevel2CategoryListHotSaleLinkUrl = @"hotSaleLinkUrl";
NSString *const kMainLevel2CategoryListCategoryId = @"categoryId";
NSString *const kMainLevel2CategoryListChildCategoryViewList = @"childCategoryViewList";
NSString *const kMainLevel2CategoryListCategoryName = @"categoryName";
NSString *const kMainLevel2CategoryListParentId = @"parentId";


@interface MainLevel2CategoryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainLevel2CategoryList

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
            self.hotSaleLinkUrl = [self objectOrNilForKey:kMainLevel2CategoryListHotSaleLinkUrl fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kMainLevel2CategoryListCategoryId fromDictionary:dict] doubleValue];
    NSObject *receivedMainChildCategoryViewList = [dict objectForKey:kMainLevel2CategoryListChildCategoryViewList];
    NSMutableArray *parsedMainChildCategoryViewList = [NSMutableArray array];
    if ([receivedMainChildCategoryViewList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainChildCategoryViewList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainChildCategoryViewList addObject:[MainChildCategoryViewList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainChildCategoryViewList isKindOfClass:[NSDictionary class]]) {
       [parsedMainChildCategoryViewList addObject:[MainChildCategoryViewList modelObjectWithDictionary:(NSDictionary *)receivedMainChildCategoryViewList]];
    }

    self.childCategoryViewList = [NSArray arrayWithArray:parsedMainChildCategoryViewList];
            self.categoryName = [self objectOrNilForKey:kMainLevel2CategoryListCategoryName fromDictionary:dict];
            self.parentId = [[self objectOrNilForKey:kMainLevel2CategoryListParentId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hotSaleLinkUrl forKey:kMainLevel2CategoryListHotSaleLinkUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kMainLevel2CategoryListCategoryId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChildCategoryViewList] forKey:kMainLevel2CategoryListChildCategoryViewList];
    [mutableDict setValue:self.categoryName forKey:kMainLevel2CategoryListCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kMainLevel2CategoryListParentId];

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

    self.hotSaleLinkUrl = [aDecoder decodeObjectForKey:kMainLevel2CategoryListHotSaleLinkUrl];
    self.categoryId = [aDecoder decodeDoubleForKey:kMainLevel2CategoryListCategoryId];
    self.childCategoryViewList = [aDecoder decodeObjectForKey:kMainLevel2CategoryListChildCategoryViewList];
    self.categoryName = [aDecoder decodeObjectForKey:kMainLevel2CategoryListCategoryName];
    self.parentId = [aDecoder decodeDoubleForKey:kMainLevel2CategoryListParentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hotSaleLinkUrl forKey:kMainLevel2CategoryListHotSaleLinkUrl];
    [aCoder encodeDouble:_categoryId forKey:kMainLevel2CategoryListCategoryId];
    [aCoder encodeObject:_childCategoryViewList forKey:kMainLevel2CategoryListChildCategoryViewList];
    [aCoder encodeObject:_categoryName forKey:kMainLevel2CategoryListCategoryName];
    [aCoder encodeDouble:_parentId forKey:kMainLevel2CategoryListParentId];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainLevel2CategoryList *copy = [[MainLevel2CategoryList alloc] init];
    
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
