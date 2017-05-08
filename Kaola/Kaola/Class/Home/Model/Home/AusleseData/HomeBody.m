//
//  HomeBody.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeBody.h"
#import "HomeHome.h"


NSString *const kHomeBodyIsLogin = @"isLogin";
NSString *const kHomeBodyHasMore = @"hasMore";
NSString *const kHomeBodyHome = @"home";


@interface HomeBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeBody

@synthesize isLogin = _isLogin;
@synthesize hasMore = _hasMore;
@synthesize home = _home;


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
            self.isLogin = [[self objectOrNilForKey:kHomeBodyIsLogin fromDictionary:dict] doubleValue];
            self.hasMore = [[self objectOrNilForKey:kHomeBodyHasMore fromDictionary:dict] doubleValue];
    NSObject *receivedHomeHome = [dict objectForKey:kHomeBodyHome];
    NSMutableArray *parsedHomeHome = [NSMutableArray array];
    if ([receivedHomeHome isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomeHome) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomeHome addObject:[HomeHome modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomeHome isKindOfClass:[NSDictionary class]]) {
       [parsedHomeHome addObject:[HomeHome modelObjectWithDictionary:(NSDictionary *)receivedHomeHome]];
    }

    self.home = [NSArray arrayWithArray:parsedHomeHome];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isLogin] forKey:kHomeBodyIsLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasMore] forKey:kHomeBodyHasMore];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHome] forKey:kHomeBodyHome];

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

    self.isLogin = [aDecoder decodeDoubleForKey:kHomeBodyIsLogin];
    self.hasMore = [aDecoder decodeDoubleForKey:kHomeBodyHasMore];
    self.home = [aDecoder decodeObjectForKey:kHomeBodyHome];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isLogin forKey:kHomeBodyIsLogin];
    [aCoder encodeDouble:_hasMore forKey:kHomeBodyHasMore];
    [aCoder encodeObject:_home forKey:kHomeBodyHome];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeBody *copy = [[HomeBody alloc] init];
    
    if (copy) {

        copy.isLogin = self.isLogin;
        copy.hasMore = self.hasMore;
        copy.home = [self.home copyWithZone:zone];
    }
    
    return copy;
}


@end
