//
//  ClassfyBody.m
//
//  Created by   on 17/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ClassfyBody.h"
#import "ClassfyCategoryTreeMenuList.h"


NSString *const kClassfyBodyCategoryTreeMenuList = @"categoryTreeMenuList";


@interface ClassfyBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClassfyBody

@synthesize categoryTreeMenuList = _categoryTreeMenuList;


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
    NSObject *receivedClassfyCategoryTreeMenuList = [dict objectForKey:kClassfyBodyCategoryTreeMenuList];
    NSMutableArray *parsedClassfyCategoryTreeMenuList = [NSMutableArray array];
    if ([receivedClassfyCategoryTreeMenuList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedClassfyCategoryTreeMenuList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedClassfyCategoryTreeMenuList addObject:[ClassfyCategoryTreeMenuList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedClassfyCategoryTreeMenuList isKindOfClass:[NSDictionary class]]) {
       [parsedClassfyCategoryTreeMenuList addObject:[ClassfyCategoryTreeMenuList modelObjectWithDictionary:(NSDictionary *)receivedClassfyCategoryTreeMenuList]];
    }

    self.categoryTreeMenuList = [NSArray arrayWithArray:parsedClassfyCategoryTreeMenuList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCategoryTreeMenuList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.categoryTreeMenuList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategoryTreeMenuList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategoryTreeMenuList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategoryTreeMenuList] forKey:kClassfyBodyCategoryTreeMenuList];

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

    self.categoryTreeMenuList = [aDecoder decodeObjectForKey:kClassfyBodyCategoryTreeMenuList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryTreeMenuList forKey:kClassfyBodyCategoryTreeMenuList];
}

- (id)copyWithZone:(NSZone *)zone
{
    ClassfyBody *copy = [[ClassfyBody alloc] init];
    
    if (copy) {

        copy.categoryTreeMenuList = [self.categoryTreeMenuList copyWithZone:zone];
    }
    
    return copy;
}


@end
