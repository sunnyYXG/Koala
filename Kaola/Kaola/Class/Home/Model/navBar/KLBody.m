//
//  KLBody.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "KLBody.h"
#import "KLBottomNavBar.h"
#import "KLDiscoveryTabView.h"
#import "KLTopNavBar.h"


NSString *const kKLBodyBottomNavBar = @"bottomNavBar";
NSString *const kKLBodyDiscoveryTabView = @"discoveryTabView";
NSString *const kKLBodyStyleType = @"styleType";
NSString *const kKLBodyTopNavBar = @"topNavBar";


@interface KLBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KLBody

@synthesize bottomNavBar = _bottomNavBar;
@synthesize discoveryTabView = _discoveryTabView;
@synthesize styleType = _styleType;
@synthesize topNavBar = _topNavBar;


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
            self.bottomNavBar = [KLBottomNavBar modelObjectWithDictionary:[dict objectForKey:kKLBodyBottomNavBar]];
    NSObject *receivedKLDiscoveryTabView = [dict objectForKey:kKLBodyDiscoveryTabView];
    NSMutableArray *parsedKLDiscoveryTabView = [NSMutableArray array];
    if ([receivedKLDiscoveryTabView isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedKLDiscoveryTabView) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedKLDiscoveryTabView addObject:[KLDiscoveryTabView modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedKLDiscoveryTabView isKindOfClass:[NSDictionary class]]) {
       [parsedKLDiscoveryTabView addObject:[KLDiscoveryTabView modelObjectWithDictionary:(NSDictionary *)receivedKLDiscoveryTabView]];
    }

    self.discoveryTabView = [NSArray arrayWithArray:parsedKLDiscoveryTabView];
            self.styleType = [[self objectOrNilForKey:kKLBodyStyleType fromDictionary:dict] doubleValue];
            self.topNavBar = [KLTopNavBar modelObjectWithDictionary:[dict objectForKey:kKLBodyTopNavBar]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.bottomNavBar dictionaryRepresentation] forKey:kKLBodyBottomNavBar];
    NSMutableArray *tempArrayForDiscoveryTabView = [NSMutableArray array];
    for (NSObject *subArrayObject in self.discoveryTabView) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiscoveryTabView addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiscoveryTabView addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiscoveryTabView] forKey:kKLBodyDiscoveryTabView];
    [mutableDict setValue:[NSNumber numberWithDouble:self.styleType] forKey:kKLBodyStyleType];
    [mutableDict setValue:[self.topNavBar dictionaryRepresentation] forKey:kKLBodyTopNavBar];

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

    self.bottomNavBar = [aDecoder decodeObjectForKey:kKLBodyBottomNavBar];
    self.discoveryTabView = [aDecoder decodeObjectForKey:kKLBodyDiscoveryTabView];
    self.styleType = [aDecoder decodeDoubleForKey:kKLBodyStyleType];
    self.topNavBar = [aDecoder decodeObjectForKey:kKLBodyTopNavBar];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bottomNavBar forKey:kKLBodyBottomNavBar];
    [aCoder encodeObject:_discoveryTabView forKey:kKLBodyDiscoveryTabView];
    [aCoder encodeDouble:_styleType forKey:kKLBodyStyleType];
    [aCoder encodeObject:_topNavBar forKey:kKLBodyTopNavBar];
}

- (id)copyWithZone:(NSZone *)zone
{
    KLBody *copy = [[KLBody alloc] init];
    
    if (copy) {

        copy.bottomNavBar = [self.bottomNavBar copyWithZone:zone];
        copy.discoveryTabView = [self.discoveryTabView copyWithZone:zone];
        copy.styleType = self.styleType;
        copy.topNavBar = [self.topNavBar copyWithZone:zone];
    }
    
    return copy;
}


@end
