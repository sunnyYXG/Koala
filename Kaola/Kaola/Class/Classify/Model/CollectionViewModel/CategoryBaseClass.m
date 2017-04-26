//
//  CategoryBaseClass.m
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CategoryBaseClass.h"
#import "CategoryBody.h"


NSString *const kCategoryBaseClassMsg = @"msg";
NSString *const kCategoryBaseClassCode = @"code";
NSString *const kCategoryBaseClassBody = @"body";


@interface CategoryBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryBaseClass

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
            self.msg = [self objectOrNilForKey:kCategoryBaseClassMsg fromDictionary:dict];
            self.code = [[self objectOrNilForKey:kCategoryBaseClassCode fromDictionary:dict] doubleValue];
            self.body = [CategoryBody modelObjectWithDictionary:[dict objectForKey:kCategoryBaseClassBody]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.msg forKey:kCategoryBaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kCategoryBaseClassCode];
    [mutableDict setValue:[self.body dictionaryRepresentation] forKey:kCategoryBaseClassBody];

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

    self.msg = [aDecoder decodeObjectForKey:kCategoryBaseClassMsg];
    self.code = [aDecoder decodeDoubleForKey:kCategoryBaseClassCode];
    self.body = [aDecoder decodeObjectForKey:kCategoryBaseClassBody];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msg forKey:kCategoryBaseClassMsg];
    [aCoder encodeDouble:_code forKey:kCategoryBaseClassCode];
    [aCoder encodeObject:_body forKey:kCategoryBaseClassBody];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryBaseClass *copy = [[CategoryBaseClass alloc] init];
    
    if (copy) {

        copy.msg = [self.msg copyWithZone:zone];
        copy.code = self.code;
        copy.body = [self.body copyWithZone:zone];
    }
    
    return copy;
}


@end
