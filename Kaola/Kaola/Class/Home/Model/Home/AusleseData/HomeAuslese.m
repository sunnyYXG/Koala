//
//  HomeAuslese.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeAuslese.h"
#import "HomeBody.h"


NSString *const kHomeAusleseMsg = @"msg";
NSString *const kHomeAusleseBody = @"body";
NSString *const kHomeAusleseCode = @"code";


@interface HomeAuslese ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeAuslese

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
            self.msg = [self objectOrNilForKey:kHomeAusleseMsg fromDictionary:dict];
            self.body = [HomeBody modelObjectWithDictionary:[dict objectForKey:kHomeAusleseBody]];
            self.code = [[self objectOrNilForKey:kHomeAusleseCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kHomeAusleseMsg];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kHomeAusleseBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kHomeAusleseCode];

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

    self.msg = [aDecoder decodeObjectForKey:kHomeAusleseMsg];
    self.body = [aDecoder decodeObjectForKey:kHomeAusleseBody];
    self.code = [aDecoder decodeDoubleForKey:kHomeAusleseCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kHomeAusleseMsg];
    [aCoder encodeObject:_body forKey:kHomeAusleseBody];
    [aCoder encodeDouble:_code forKey:kHomeAusleseCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeAuslese *copy = [[HomeAuslese alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
