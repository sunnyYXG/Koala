//
//  MainCategory.m
//
//  Created by   on 17/5/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MainCategory.h"
#import "MainBody.h"


NSString *const kMainCategoryMsg = @"msg";
NSString *const kMainCategoryBody = @"body";
NSString *const kMainCategoryCode = @"code";


@interface MainCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainCategory

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
            self.msg = [self objectOrNilForKey:kMainCategoryMsg fromDictionary:dict];
            self.body = [MainBody modelObjectWithDictionary:[dict objectForKey:kMainCategoryBody]];
            self.code = [[self objectOrNilForKey:kMainCategoryCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kMainCategoryMsg];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kMainCategoryBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kMainCategoryCode];

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

    self.msg = [aDecoder decodeObjectForKey:kMainCategoryMsg];
    self.body = [aDecoder decodeObjectForKey:kMainCategoryBody];
    self.code = [aDecoder decodeDoubleForKey:kMainCategoryCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kMainCategoryMsg];
    [aCoder encodeObject:_body forKey:kMainCategoryBody];
    [aCoder encodeDouble:_code forKey:kMainCategoryCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainCategory *copy = [[MainCategory alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
