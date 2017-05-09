//
//  RecommendBase.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendBase.h"
#import "RecommendBody.h"


NSString *const kRecommendBaseMsg = @"msg";
NSString *const kRecommendBaseCode = @"code";
NSString *const kRecommendBaseBody = @"body";


@interface RecommendBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendBase

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
            self.msg = [self objectOrNilForKey:kRecommendBaseMsg fromDictionary:dict];
            self.code = [[self objectOrNilForKey:kRecommendBaseCode fromDictionary:dict] doubleValue];
            self.body = [RecommendBody modelObjectWithDictionary:[dict objectForKey:kRecommendBaseBody]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kRecommendBaseMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kRecommendBaseCode];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kRecommendBaseBody];

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

    self.msg = [aDecoder decodeObjectForKey:kRecommendBaseMsg];
    self.code = [aDecoder decodeDoubleForKey:kRecommendBaseCode];
    self.body = [aDecoder decodeObjectForKey:kRecommendBaseBody];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kRecommendBaseMsg];
    [aCoder encodeDouble:_code forKey:kRecommendBaseCode];
    [aCoder encodeObject:_body forKey:kRecommendBaseBody];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendBase *copy = [[RecommendBase alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = self.code;
        copy.body = [self.body copyWithZone:zone];
    }
    
    return copy;
}


@end
