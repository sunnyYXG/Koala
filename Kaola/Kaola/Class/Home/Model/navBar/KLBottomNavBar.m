//
//  KLBottomNavBar.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "KLBottomNavBar.h"
#import "KLNavBarList.h"


NSString *const kKLBottomNavBarNavBarList = @"navBarList";


@interface KLBottomNavBar ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KLBottomNavBar

@synthesize navBarList = _navBarList;


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
    NSObject *receivedKLNavBarList = [dict objectForKey:kKLBottomNavBarNavBarList];
    NSMutableArray *parsedKLNavBarList = [NSMutableArray array];
    if ([receivedKLNavBarList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedKLNavBarList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedKLNavBarList addObject:[KLNavBarList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedKLNavBarList isKindOfClass:[NSDictionary class]]) {
       [parsedKLNavBarList addObject:[KLNavBarList modelObjectWithDictionary:(NSDictionary *)receivedKLNavBarList]];
    }

    self.navBarList = [NSArray arrayWithArray:parsedKLNavBarList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForNavBarList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.navBarList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNavBarList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNavBarList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNavBarList] forKey:kKLBottomNavBarNavBarList];

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

    self.navBarList = [aDecoder decodeObjectForKey:kKLBottomNavBarNavBarList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_navBarList forKey:kKLBottomNavBarNavBarList];
}

- (id)copyWithZone:(NSZone *)zone
{
    KLBottomNavBar *copy = [[KLBottomNavBar alloc] init];
    
    if (copy) {

        copy.navBarList = [self.navBarList copyWithZone:zone];
    }
    
    return copy;
}


@end
