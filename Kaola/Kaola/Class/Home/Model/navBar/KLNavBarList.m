//
//  KLNavBarList.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "KLNavBarList.h"


NSString *const kKLNavBarListShowType = @"showType";
NSString *const kKLNavBarListStartTime = @"startTime";
NSString *const kKLNavBarListEndTime = @"endTime";
NSString *const kKLNavBarListIconURL = @"iconURL";
NSString *const kKLNavBarListTitle = @"title";
NSString *const kKLNavBarListIconIsShow = @"iconIsShow";
NSString *const kKLNavBarListIsDefault = @"isDefault";
NSString *const kKLNavBarListType = @"type";
NSString *const kKLNavBarListGuidanceId = @"guidanceId";
NSString *const kKLNavBarListLocationOrder = @"locationOrder";
NSString *const kKLNavBarListApiTail = @"apiTail";


@interface KLNavBarList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KLNavBarList

@synthesize showType = _showType;
@synthesize startTime = _startTime;
@synthesize endTime = _endTime;
@synthesize iconURL = _iconURL;
@synthesize title = _title;
@synthesize iconIsShow = _iconIsShow;
@synthesize isDefault = _isDefault;
@synthesize type = _type;
@synthesize guidanceId = _guidanceId;
@synthesize locationOrder = _locationOrder;
@synthesize apiTail = _apiTail;


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
            self.showType = [[self objectOrNilForKey:kKLNavBarListShowType fromDictionary:dict] doubleValue];
            self.startTime = [[self objectOrNilForKey:kKLNavBarListStartTime fromDictionary:dict] doubleValue];
            self.endTime = [[self objectOrNilForKey:kKLNavBarListEndTime fromDictionary:dict] doubleValue];
            self.iconURL = [self objectOrNilForKey:kKLNavBarListIconURL fromDictionary:dict];
            self.title = [self objectOrNilForKey:kKLNavBarListTitle fromDictionary:dict];
            self.iconIsShow = [[self objectOrNilForKey:kKLNavBarListIconIsShow fromDictionary:dict] doubleValue];
            self.isDefault = [[self objectOrNilForKey:kKLNavBarListIsDefault fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kKLNavBarListType fromDictionary:dict] doubleValue];
            self.guidanceId = [self objectOrNilForKey:kKLNavBarListGuidanceId fromDictionary:dict];
            self.locationOrder = [[self objectOrNilForKey:kKLNavBarListLocationOrder fromDictionary:dict] doubleValue];
            self.apiTail = [self objectOrNilForKey:kKLNavBarListApiTail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showType] forKey:kKLNavBarListShowType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.startTime] forKey:kKLNavBarListStartTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endTime] forKey:kKLNavBarListEndTime];
    [mutableDict setValue:self.iconURL forKey:kKLNavBarListIconURL];
    [mutableDict setValue:self.title forKey:kKLNavBarListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iconIsShow] forKey:kKLNavBarListIconIsShow];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isDefault] forKey:kKLNavBarListIsDefault];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kKLNavBarListType];
    [mutableDict setValue:self.guidanceId forKey:kKLNavBarListGuidanceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.locationOrder] forKey:kKLNavBarListLocationOrder];
    [mutableDict setValue:self.apiTail forKey:kKLNavBarListApiTail];

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

    self.showType = [aDecoder decodeDoubleForKey:kKLNavBarListShowType];
    self.startTime = [aDecoder decodeDoubleForKey:kKLNavBarListStartTime];
    self.endTime = [aDecoder decodeDoubleForKey:kKLNavBarListEndTime];
    self.iconURL = [aDecoder decodeObjectForKey:kKLNavBarListIconURL];
    self.title = [aDecoder decodeObjectForKey:kKLNavBarListTitle];
    self.iconIsShow = [aDecoder decodeDoubleForKey:kKLNavBarListIconIsShow];
    self.isDefault = [aDecoder decodeDoubleForKey:kKLNavBarListIsDefault];
    self.type = [aDecoder decodeDoubleForKey:kKLNavBarListType];
    self.guidanceId = [aDecoder decodeObjectForKey:kKLNavBarListGuidanceId];
    self.locationOrder = [aDecoder decodeDoubleForKey:kKLNavBarListLocationOrder];
    self.apiTail = [aDecoder decodeObjectForKey:kKLNavBarListApiTail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_showType forKey:kKLNavBarListShowType];
    [aCoder encodeDouble:_startTime forKey:kKLNavBarListStartTime];
    [aCoder encodeDouble:_endTime forKey:kKLNavBarListEndTime];
    [aCoder encodeObject:_iconURL forKey:kKLNavBarListIconURL];
    [aCoder encodeObject:_title forKey:kKLNavBarListTitle];
    [aCoder encodeDouble:_iconIsShow forKey:kKLNavBarListIconIsShow];
    [aCoder encodeDouble:_isDefault forKey:kKLNavBarListIsDefault];
    [aCoder encodeDouble:_type forKey:kKLNavBarListType];
    [aCoder encodeObject:_guidanceId forKey:kKLNavBarListGuidanceId];
    [aCoder encodeDouble:_locationOrder forKey:kKLNavBarListLocationOrder];
    [aCoder encodeObject:_apiTail forKey:kKLNavBarListApiTail];
}

- (id)copyWithZone:(NSZone *)zone
{
    KLNavBarList *copy = [[KLNavBarList alloc] init];
    
    if (copy) {

        copy.showType = self.showType;
        copy.startTime = self.startTime;
        copy.endTime = self.endTime;
        copy.iconURL = [self.iconURL copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.iconIsShow = self.iconIsShow;
        copy.isDefault = self.isDefault;
        copy.type = self.type;
        copy.guidanceId = [self.guidanceId copyWithZone:zone];
        copy.locationOrder = self.locationOrder;
        copy.apiTail = [self.apiTail copyWithZone:zone];
    }
    
    return copy;
}


@end
