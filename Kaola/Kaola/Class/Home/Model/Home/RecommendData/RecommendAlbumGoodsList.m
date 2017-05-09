//
//  RecommendAlbumGoodsList.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendAlbumGoodsList.h"


NSString *const kRecommendAlbumGoodsListGoodsId = @"goodsId";
NSString *const kRecommendAlbumGoodsListImageUrl = @"imageUrl";


@interface RecommendAlbumGoodsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendAlbumGoodsList

@synthesize goodsId = _goodsId;
@synthesize imageUrl = _imageUrl;


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
            self.goodsId = [[self objectOrNilForKey:kRecommendAlbumGoodsListGoodsId fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kRecommendAlbumGoodsListImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kRecommendAlbumGoodsListGoodsId];
    [mutableDict setValue:self.imageUrl forKey:kRecommendAlbumGoodsListImageUrl];

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

    self.goodsId = [aDecoder decodeDoubleForKey:kRecommendAlbumGoodsListGoodsId];
    self.imageUrl = [aDecoder decodeObjectForKey:kRecommendAlbumGoodsListImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_goodsId forKey:kRecommendAlbumGoodsListGoodsId];
    [aCoder encodeObject:_imageUrl forKey:kRecommendAlbumGoodsListImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendAlbumGoodsList *copy = [[RecommendAlbumGoodsList alloc] init];
    
    if (copy) {

        copy.goodsId = self.goodsId;
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
