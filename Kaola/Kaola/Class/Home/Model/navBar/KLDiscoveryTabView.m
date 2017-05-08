//
//  KLDiscoveryTabView.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "KLDiscoveryTabView.h"


NSString *const kKLDiscoveryTabViewApiTail = @"apiTail";
NSString *const kKLDiscoveryTabViewTitle = @"title";
NSString *const kKLDiscoveryTabViewType = @"type";


@interface KLDiscoveryTabView ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KLDiscoveryTabView

@synthesize apiTail = _apiTail;
@synthesize title = _title;
@synthesize type = _type;


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
            self.apiTail = [self objectOrNilForKey:kKLDiscoveryTabViewApiTail fromDictionary:dict];
            self.title = [self objectOrNilForKey:kKLDiscoveryTabViewTitle fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kKLDiscoveryTabViewType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.apiTail forKey:kKLDiscoveryTabViewApiTail];
    [mutableDict setValue:self.title forKey:kKLDiscoveryTabViewTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kKLDiscoveryTabViewType];

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

    self.apiTail = [aDecoder decodeObjectForKey:kKLDiscoveryTabViewApiTail];
    self.title = [aDecoder decodeObjectForKey:kKLDiscoveryTabViewTitle];
    self.type = [aDecoder decodeDoubleForKey:kKLDiscoveryTabViewType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_apiTail forKey:kKLDiscoveryTabViewApiTail];
    [aCoder encodeObject:_title forKey:kKLDiscoveryTabViewTitle];
    [aCoder encodeDouble:_type forKey:kKLDiscoveryTabViewType];
}

- (id)copyWithZone:(NSZone *)zone
{
    KLDiscoveryTabView *copy = [[KLDiscoveryTabView alloc] init];
    
    if (copy) {

        copy.apiTail = [self.apiTail copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
