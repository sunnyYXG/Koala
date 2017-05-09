//
//  RecommendBody.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendBody.h"
#import "RecommendHome.h"


NSString *const kRecommendBodyIsLogin = @"isLogin";
NSString *const kRecommendBodyHasMore = @"hasMore";
NSString *const kRecommendBodyHome = @"home";


@interface RecommendBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendBody

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
            self.isLogin = [[self objectOrNilForKey:kRecommendBodyIsLogin fromDictionary:dict] doubleValue];
            self.hasMore = [[self objectOrNilForKey:kRecommendBodyHasMore fromDictionary:dict] doubleValue];
    NSObject *receivedRecommendHome = [dict objectForKey:kRecommendBodyHome];
    NSMutableArray *parsedRecommendHome = [NSMutableArray array];
    if ([receivedRecommendHome isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecommendHome) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecommendHome addObject:[RecommendHome modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecommendHome isKindOfClass:[NSDictionary class]]) {
       [parsedRecommendHome addObject:[RecommendHome modelObjectWithDictionary:(NSDictionary *)receivedRecommendHome]];
    }

    self.home = [NSArray arrayWithArray:parsedRecommendHome];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isLogin] forKey:kRecommendBodyIsLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasMore] forKey:kRecommendBodyHasMore];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHome] forKey:kRecommendBodyHome];

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

    self.isLogin = [aDecoder decodeDoubleForKey:kRecommendBodyIsLogin];
    self.hasMore = [aDecoder decodeDoubleForKey:kRecommendBodyHasMore];
    self.home = [aDecoder decodeObjectForKey:kRecommendBodyHome];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isLogin forKey:kRecommendBodyIsLogin];
    [aCoder encodeDouble:_hasMore forKey:kRecommendBodyHasMore];
    [aCoder encodeObject:_home forKey:kRecommendBodyHome];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendBody *copy = [[RecommendBody alloc] init];
    
    if (copy) {

        copy.isLogin = self.isLogin;
        copy.hasMore = self.hasMore;
        copy.home = [self.home copyWithZone:zone];
    }
    
    return copy;
}


@end
