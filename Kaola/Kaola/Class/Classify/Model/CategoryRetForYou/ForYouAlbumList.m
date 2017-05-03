//
//  ForYouAlbumList.m
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ForYouAlbumList.h"


NSString *const kForYouAlbumListIsShowBuyCountInAlbumTitle = @"isShowBuyCountInAlbumTitle";
NSString *const kForYouAlbumListRecReason = @"recReason";
NSString *const kForYouAlbumListAlbumId = @"albumId";
NSString *const kForYouAlbumListGoodsUrlList = @"goodsUrlList";
NSString *const kForYouAlbumListFavorNum = @"favorNum";
NSString *const kForYouAlbumListTitle = @"title";
NSString *const kForYouAlbumListBuyCount = @"buyCount";
NSString *const kForYouAlbumListProductNum = @"productNum";
NSString *const kForYouAlbumListAlbumType = @"albumType";


@interface ForYouAlbumList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ForYouAlbumList

@synthesize isShowBuyCountInAlbumTitle = _isShowBuyCountInAlbumTitle;
@synthesize recReason = _recReason;
@synthesize albumId = _albumId;
@synthesize goodsUrlList = _goodsUrlList;
@synthesize favorNum = _favorNum;
@synthesize title = _title;
@synthesize buyCount = _buyCount;
@synthesize productNum = _productNum;
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
            self.isShowBuyCountInAlbumTitle = [[self objectOrNilForKey:kForYouAlbumListIsShowBuyCountInAlbumTitle fromDictionary:dict] boolValue];
            self.recReason = [self objectOrNilForKey:kForYouAlbumListRecReason fromDictionary:dict];
            self.albumId = [self objectOrNilForKey:kForYouAlbumListAlbumId fromDictionary:dict];
            self.goodsUrlList = [self objectOrNilForKey:kForYouAlbumListGoodsUrlList fromDictionary:dict];
            self.favorNum = [[self objectOrNilForKey:kForYouAlbumListFavorNum fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kForYouAlbumListTitle fromDictionary:dict];
            self.buyCount = [[self objectOrNilForKey:kForYouAlbumListBuyCount fromDictionary:dict] doubleValue];
            self.productNum = [[self objectOrNilForKey:kForYouAlbumListProductNum fromDictionary:dict] doubleValue];
            self.albumType = [[self objectOrNilForKey:kForYouAlbumListAlbumType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isShowBuyCountInAlbumTitle] forKey:kForYouAlbumListIsShowBuyCountInAlbumTitle];
    [mutableDict setValue:self.recReason forKey:kForYouAlbumListRecReason];
    [mutableDict setValue:self.albumId forKey:kForYouAlbumListAlbumId];
    NSMutableArray *tempArrayForGoodsUrlList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.goodsUrlList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGoodsUrlList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGoodsUrlList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsUrlList] forKey:kForYouAlbumListGoodsUrlList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favorNum] forKey:kForYouAlbumListFavorNum];
    [mutableDict setValue:self.title forKey:kForYouAlbumListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buyCount] forKey:kForYouAlbumListBuyCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productNum] forKey:kForYouAlbumListProductNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumType] forKey:kForYouAlbumListAlbumType];

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

    self.isShowBuyCountInAlbumTitle = [aDecoder decodeBoolForKey:kForYouAlbumListIsShowBuyCountInAlbumTitle];
    self.recReason = [aDecoder decodeObjectForKey:kForYouAlbumListRecReason];
    self.albumId = [aDecoder decodeObjectForKey:kForYouAlbumListAlbumId];
    self.goodsUrlList = [aDecoder decodeObjectForKey:kForYouAlbumListGoodsUrlList];
    self.favorNum = [aDecoder decodeDoubleForKey:kForYouAlbumListFavorNum];
    self.title = [aDecoder decodeObjectForKey:kForYouAlbumListTitle];
    self.buyCount = [aDecoder decodeDoubleForKey:kForYouAlbumListBuyCount];
    self.productNum = [aDecoder decodeDoubleForKey:kForYouAlbumListProductNum];
    self.albumType = [aDecoder decodeDoubleForKey:kForYouAlbumListAlbumType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isShowBuyCountInAlbumTitle forKey:kForYouAlbumListIsShowBuyCountInAlbumTitle];
    [aCoder encodeObject:_recReason forKey:kForYouAlbumListRecReason];
    [aCoder encodeObject:_albumId forKey:kForYouAlbumListAlbumId];
    [aCoder encodeObject:_goodsUrlList forKey:kForYouAlbumListGoodsUrlList];
    [aCoder encodeDouble:_favorNum forKey:kForYouAlbumListFavorNum];
    [aCoder encodeObject:_title forKey:kForYouAlbumListTitle];
    [aCoder encodeDouble:_buyCount forKey:kForYouAlbumListBuyCount];
    [aCoder encodeDouble:_productNum forKey:kForYouAlbumListProductNum];
    [aCoder encodeDouble:_albumType forKey:kForYouAlbumListAlbumType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ForYouAlbumList *copy = [[ForYouAlbumList alloc] init];
    
    if (copy) {

        copy.isShowBuyCountInAlbumTitle = self.isShowBuyCountInAlbumTitle;
        copy.recReason = [self.recReason copyWithZone:zone];
        copy.albumId = [self.albumId copyWithZone:zone];
        copy.goodsUrlList = [self.goodsUrlList copyWithZone:zone];
        copy.favorNum = self.favorNum;
        copy.title = [self.title copyWithZone:zone];
        copy.buyCount = self.buyCount;
        copy.productNum = self.productNum;
        copy.albumType = self.albumType;
    }
    
    return copy;
}


@end
