//
//  ClassfyModel.m
//
//  Created by   on 17/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ClassfyModel.h"
#import "ClassfyBody.h"


NSString *const kClassfyModelMsg = @"msg";
NSString *const kClassfyModelCode = @"code";
NSString *const kClassfyModelBody = @"body";


@interface ClassfyModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ClassfyModel

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
            self.msg = [self objectOrNilForKey:kClassfyModelMsg fromDictionary:dict];
            self.code = [[self objectOrNilForKey:kClassfyModelCode fromDictionary:dict] doubleValue];
            self.body = [ClassfyBody modelObjectWithDictionary:[dict objectForKey:kClassfyModelBody]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kClassfyModelMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kClassfyModelCode];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kClassfyModelBody];

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

    self.msg = [aDecoder decodeObjectForKey:kClassfyModelMsg];
    self.code = [aDecoder decodeDoubleForKey:kClassfyModelCode];
    self.body = [aDecoder decodeObjectForKey:kClassfyModelBody];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kClassfyModelMsg];
    [aCoder encodeDouble:_code forKey:kClassfyModelCode];
    [aCoder encodeObject:_body forKey:kClassfyModelBody];
}

- (id)copyWithZone:(NSZone *)zone
{
    ClassfyModel *copy = [[ClassfyModel alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = self.code;
        copy.body = [self.body copyWithZone:zone];
    }
    
    return copy;
}


@end
