//
//  BaseClass.m
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Body.h"


NSString *const kBaseClassMsg = @"msg";
NSString *const kBaseClassCode = @"code";
NSString *const kBaseClassBody = @"body";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize msg = _msg;
@synthesize code = _code;
@synthesize body = _body;


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
            self.msg = [self objectOrNilForKey:kBaseClassMsg fromDictionary:dict];
            self.code = [[self objectOrNilForKey:kBaseClassCode fromDictionary:dict] doubleValue];
            self.body = [Body modelObjectWithDictionary:[dict objectForKey:kBaseClassBody]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kBaseClassCode];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kBaseClassBody];

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

    self.msg = [aDecoder decodeObjectForKey:kBaseClassMsg];
    self.code = [aDecoder decodeDoubleForKey:kBaseClassCode];
    self.body = [aDecoder decodeObjectForKey:kBaseClassBody];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kBaseClassMsg];
    [aCoder encodeDouble:_code forKey:kBaseClassCode];
    [aCoder encodeObject:_body forKey:kBaseClassBody];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = self.code;
        copy.body = [self.body copyWithZone:zone];
    }
    
    return copy;
}


@end
