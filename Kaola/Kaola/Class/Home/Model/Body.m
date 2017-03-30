//
//  Body.m
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Body.h"
#import "Home.h"


NSString *const kBodyIsLogin = @"isLogin";
NSString *const kBodyHome = @"home";
NSString *const kBodyRefresh = @"refresh";
NSString *const kBodyHasMore = @"hasMore";


@interface Body ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Body

@synthesize isLogin = _isLogin;
@synthesize home = _home;
@synthesize refresh = _refresh;
@synthesize hasMore = _hasMore;


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
            self.isLogin = [[self objectOrNilForKey:kBodyIsLogin fromDictionary:dict] doubleValue];
    NSObject *receivedHome = [dict objectForKey:kBodyHome];
    NSMutableArray *parsedHome = [NSMutableArray array];
    if ([receivedHome isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHome) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHome addObject:[Home modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHome isKindOfClass:[NSDictionary class]]) {
       [parsedHome addObject:[Home modelObjectWithDictionary:(NSDictionary *)receivedHome]];
    }

    self.home = [NSArray arrayWithArray:parsedHome];
            self.refresh = [[self objectOrNilForKey:kBodyRefresh fromDictionary:dict] doubleValue];
            self.hasMore = [[self objectOrNilForKey:kBodyHasMore fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isLogin] forKey:kBodyIsLogin];
    NSMutableArray *tempArrayForHome = [NSMutableArray array];
    for (NSObject *subArrayObject in self.home) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHome addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHome addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHome] forKey:kBodyHome];
    [mutableDict setValue:[NSNumber numberWithDouble:self.refresh] forKey:kBodyRefresh];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasMore] forKey:kBodyHasMore];

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

    self.isLogin = [aDecoder decodeDoubleForKey:kBodyIsLogin];
    self.home = [aDecoder decodeObjectForKey:kBodyHome];
    self.refresh = [aDecoder decodeDoubleForKey:kBodyRefresh];
    self.hasMore = [aDecoder decodeDoubleForKey:kBodyHasMore];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isLogin forKey:kBodyIsLogin];
    [aCoder encodeObject:_home forKey:kBodyHome];
    [aCoder encodeDouble:_refresh forKey:kBodyRefresh];
    [aCoder encodeDouble:_hasMore forKey:kBodyHasMore];
}

- (id)copyWithZone:(NSZone *)zone
{
    Body *copy = [[Body alloc] init];
    
    if (copy) {

        copy.isLogin = self.isLogin;
        copy.home = [self.home copyWithZone:zone];
        copy.refresh = self.refresh;
        copy.hasMore = self.hasMore;
    }
    
    return copy;
}


@end
