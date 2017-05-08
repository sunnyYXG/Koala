//
//  KLNavBar.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "KLNavBar.h"
#import "KLBody.h"


NSString *const kKLNavBarMsg = @"msg";
NSString *const kKLNavBarBody = @"body";
NSString *const kKLNavBarCode = @"code";


@interface KLNavBar ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KLNavBar

@synthesize msg = _msg;
@synthesize body = _body;
@synthesize code = _code;


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
            self.msg = [self objectOrNilForKey:kKLNavBarMsg fromDictionary:dict];
            self.body = [KLBody modelObjectWithDictionary:[dict objectForKey:kKLNavBarBody]];
            self.code = [[self objectOrNilForKey:kKLNavBarCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kKLNavBarMsg];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kKLNavBarBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kKLNavBarCode];

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

    self.msg = [aDecoder decodeObjectForKey:kKLNavBarMsg];
    self.body = [aDecoder decodeObjectForKey:kKLNavBarBody];
    self.code = [aDecoder decodeDoubleForKey:kKLNavBarCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kKLNavBarMsg];
    [aCoder encodeObject:_body forKey:kKLNavBarBody];
    [aCoder encodeDouble:_code forKey:kKLNavBarCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    KLNavBar *copy = [[KLNavBar alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
