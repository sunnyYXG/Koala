//
//  HomeItemList.m
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HomeItemList.h"


NSString *const kHomeItemListItemId = @"itemId";
NSString *const kHomeItemListRecReason = @"recReason";
NSString *const kHomeItemListTitle = @"title";
NSString *const kHomeItemListImageUrl = @"imageUrl";
NSString *const kHomeItemListType = @"type";
NSString *const kHomeItemListDesc = @"desc";
NSString *const kHomeItemListAlbumType = @"albumType";


@interface HomeItemList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomeItemList

@synthesize itemId = _itemId;
@synthesize recReason = _recReason;
@synthesize title = _title;
@synthesize imageUrl = _imageUrl;
@synthesize type = _type;
@synthesize desc = _desc;
@synthesize albumType = _albumType;


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
            self.itemId = [[self objectOrNilForKey:kHomeItemListItemId fromDictionary:dict] doubleValue];
            self.recReason = [self objectOrNilForKey:kHomeItemListRecReason fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHomeItemListTitle fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kHomeItemListImageUrl fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kHomeItemListType fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kHomeItemListDesc fromDictionary:dict];
            self.albumType = [[self objectOrNilForKey:kHomeItemListAlbumType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemId] forKey:kHomeItemListItemId];
    [mutableDict setValue:self.recReason forKey:kHomeItemListRecReason];
    [mutableDict setValue:self.title forKey:kHomeItemListTitle];
    [mutableDict setValue:self.imageUrl forKey:kHomeItemListImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kHomeItemListType];
    [mutableDict setValue:self.desc forKey:kHomeItemListDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumType] forKey:kHomeItemListAlbumType];

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

    self.itemId = [aDecoder decodeDoubleForKey:kHomeItemListItemId];
    self.recReason = [aDecoder decodeObjectForKey:kHomeItemListRecReason];
    self.title = [aDecoder decodeObjectForKey:kHomeItemListTitle];
    self.imageUrl = [aDecoder decodeObjectForKey:kHomeItemListImageUrl];
    self.type = [aDecoder decodeDoubleForKey:kHomeItemListType];
    self.desc = [aDecoder decodeObjectForKey:kHomeItemListDesc];
    self.albumType = [aDecoder decodeDoubleForKey:kHomeItemListAlbumType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_itemId forKey:kHomeItemListItemId];
    [aCoder encodeObject:_recReason forKey:kHomeItemListRecReason];
    [aCoder encodeObject:_title forKey:kHomeItemListTitle];
    [aCoder encodeObject:_imageUrl forKey:kHomeItemListImageUrl];
    [aCoder encodeDouble:_type forKey:kHomeItemListType];
    [aCoder encodeObject:_desc forKey:kHomeItemListDesc];
    [aCoder encodeDouble:_albumType forKey:kHomeItemListAlbumType];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomeItemList *copy = [[HomeItemList alloc] init];
    
    if (copy) {

        copy.itemId = self.itemId;
        copy.recReason = [self.recReason copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.type = self.type;
        copy.desc = [self.desc copyWithZone:zone];
        copy.albumType = self.albumType;
    }
    
    return copy;
}


@end
