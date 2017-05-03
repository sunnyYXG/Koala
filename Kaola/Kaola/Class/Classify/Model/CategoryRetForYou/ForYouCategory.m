//
//  ForYouCategory.m
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForYouCategory.h"
#import "ForYouBody.h"


NSString *const kForYouCategoryMsg = @"msg";
NSString *const kForYouCategoryBody = @"body";
NSString *const kForYouCategoryCode = @"code";


@interface ForYouCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForYouCategory

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
            self.msg = [self objectOrNilForKey:kForYouCategoryMsg fromDictionary:dict];
            self.body = [ForYouBody modelObjectWithDictionary:[dict objectForKey:kForYouCategoryBody]];
            self.code = [[self objectOrNilForKey:kForYouCategoryCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kForYouCategoryMsg];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kForYouCategoryBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kForYouCategoryCode];

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

    self.msg = [aDecoder decodeObjectForKey:kForYouCategoryMsg];
    self.body = [aDecoder decodeObjectForKey:kForYouCategoryBody];
    self.code = [aDecoder decodeDoubleForKey:kForYouCategoryCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kForYouCategoryMsg];
    [aCoder encodeObject:_body forKey:kForYouCategoryBody];
    [aCoder encodeDouble:_code forKey:kForYouCategoryCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForYouCategory *copy = [[ForYouCategory alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
