//
//  ClassfyCategoryTreeMenuList.m
//
//  Created by   on 17/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ClassfyCategoryTreeMenuList.h"


NSString *const kClassfyCategoryTreeMenuListTitle = @"title";
NSString *const kClassfyCategoryTreeMenuListType = @"type";
NSString *const kClassfyCategoryTreeMenuListCategoryId = @"categoryId";


@interface ClassfyCategoryTreeMenuList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClassfyCategoryTreeMenuList

@synthesize title = _title;
@synthesize type = _type;
@synthesize categoryId = _categoryId;


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
            self.title = [self objectOrNilForKey:kClassfyCategoryTreeMenuListTitle fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kClassfyCategoryTreeMenuListType fromDictionary:dict] doubleValue];
            self.categoryId = [[self objectOrNilForKey:kClassfyCategoryTreeMenuListCategoryId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kClassfyCategoryTreeMenuListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kClassfyCategoryTreeMenuListType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kClassfyCategoryTreeMenuListCategoryId];

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

    self.title = [aDecoder decodeObjectForKey:kClassfyCategoryTreeMenuListTitle];
    self.type = [aDecoder decodeDoubleForKey:kClassfyCategoryTreeMenuListType];
    self.categoryId = [aDecoder decodeDoubleForKey:kClassfyCategoryTreeMenuListCategoryId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kClassfyCategoryTreeMenuListTitle];
    [aCoder encodeDouble:_type forKey:kClassfyCategoryTreeMenuListType];
    [aCoder encodeDouble:_categoryId forKey:kClassfyCategoryTreeMenuListCategoryId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ClassfyCategoryTreeMenuList *copy = [[ClassfyCategoryTreeMenuList alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.type = self.type;
        copy.categoryId = self.categoryId;
    }
    
    return copy;
}


@end
