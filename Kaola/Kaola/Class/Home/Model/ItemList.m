//
//  ItemList.m
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "ItemList.h"


NSString *const kItemListAppImgUrlList = @"appImgUrlList";
NSString *const kItemListPropertyShowType = @"propertyShowType";
NSString *const kItemListOriginalPrice = @"originalPrice";
NSString *const kItemListTitle = @"title";
NSString *const kItemListImgUrlList = @"imgUrlList";
NSString *const kItemListAveragePriceLable = @"averagePriceLable";
NSString *const kItemListProductgrade = @"productgrade";
NSString *const kItemListShowColorCard = @"showColorCard";
NSString *const kItemListSelf = @"self";
NSString *const kItemListGoodsId = @"goodsId";
NSString *const kItemListBrandId = @"brandId";
NSString *const kItemListOnlineStatus = @"onlineStatus";
NSString *const kItemListLinkUrl = @"linkUrl";
NSString *const kItemListImgUrl = @"imgUrl";
NSString *const kItemListSmallSingleActivityLabelUrl = @"smallSingleActivityLabelUrl";
NSString *const kItemListCurrentPrice = @"currentPrice";
NSString *const kItemListActualStorageStatus = @"actualStorageStatus";
NSString *const kItemListCommentCount = @"commentCount";
NSString *const kItemListGoodsNumLabel = @"goodsNumLabel";
NSString *const kItemListLikeCount = @"likeCount";
NSString *const kItemListIsAppPriceOnlyLabel = @"isAppPriceOnlyLabel";
NSString *const kItemListDescription2 = @"description_2";
NSString *const kItemListDescription1 = @"description_1";
NSString *const kItemListIntroduce = @"introduce";


@interface ItemList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ItemList

@synthesize appImgUrlList = _appImgUrlList;
@synthesize propertyShowType = _propertyShowType;
@synthesize originalPrice = _originalPrice;
@synthesize title = _title;
@synthesize imgUrlList = _imgUrlList;
@synthesize averagePriceLable = _averagePriceLable;
@synthesize productgrade = _productgrade;
@synthesize showColorCard = _showColorCard;
@synthesize itemListSelf = _itemListSelf;
@synthesize goodsId = _goodsId;
@synthesize brandId = _brandId;
@synthesize onlineStatus = _onlineStatus;
@synthesize linkUrl = _linkUrl;
@synthesize imgUrl = _imgUrl;
@synthesize smallSingleActivityLabelUrl = _smallSingleActivityLabelUrl;
@synthesize currentPrice = _currentPrice;
@synthesize actualStorageStatus = _actualStorageStatus;
@synthesize commentCount = _commentCount;
@synthesize goodsNumLabel = _goodsNumLabel;
@synthesize likeCount = _likeCount;
@synthesize isAppPriceOnlyLabel = _isAppPriceOnlyLabel;
@synthesize description2 = _description2;
@synthesize description1 = _description1;
@synthesize introduce = _introduce;


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
            self.appImgUrlList = [self objectOrNilForKey:kItemListAppImgUrlList fromDictionary:dict];
            self.propertyShowType = [[self objectOrNilForKey:kItemListPropertyShowType fromDictionary:dict] doubleValue];
            self.originalPrice = [[self objectOrNilForKey:kItemListOriginalPrice fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kItemListTitle fromDictionary:dict];
            self.imgUrlList = [self objectOrNilForKey:kItemListImgUrlList fromDictionary:dict];
            self.averagePriceLable = [self objectOrNilForKey:kItemListAveragePriceLable fromDictionary:dict];
            self.productgrade = [[self objectOrNilForKey:kItemListProductgrade fromDictionary:dict] doubleValue];
            self.showColorCard = [[self objectOrNilForKey:kItemListShowColorCard fromDictionary:dict] doubleValue];
            self.itemListSelf = [[self objectOrNilForKey:kItemListSelf fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kItemListGoodsId fromDictionary:dict] doubleValue];
            self.brandId = [[self objectOrNilForKey:kItemListBrandId fromDictionary:dict] doubleValue];
            self.onlineStatus = [[self objectOrNilForKey:kItemListOnlineStatus fromDictionary:dict] doubleValue];
            self.linkUrl = [self objectOrNilForKey:kItemListLinkUrl fromDictionary:dict];
            self.imgUrl = [self objectOrNilForKey:kItemListImgUrl fromDictionary:dict];
            self.smallSingleActivityLabelUrl = [self objectOrNilForKey:kItemListSmallSingleActivityLabelUrl fromDictionary:dict];
            self.currentPrice = [[self objectOrNilForKey:kItemListCurrentPrice fromDictionary:dict] doubleValue];
            self.actualStorageStatus = [[self objectOrNilForKey:kItemListActualStorageStatus fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:kItemListCommentCount fromDictionary:dict] doubleValue];
            self.goodsNumLabel = [self objectOrNilForKey:kItemListGoodsNumLabel fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kItemListLikeCount fromDictionary:dict] doubleValue];
            self.isAppPriceOnlyLabel = [[self objectOrNilForKey:kItemListIsAppPriceOnlyLabel fromDictionary:dict] doubleValue];
            self.description2 = [self objectOrNilForKey:kItemListDescription2 fromDictionary:dict];
            self.description1 = [self objectOrNilForKey:kItemListDescription1 fromDictionary:dict];
            self.introduce = [self objectOrNilForKey:kItemListIntroduce fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForAppImgUrlList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.appImgUrlList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAppImgUrlList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAppImgUrlList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAppImgUrlList] forKey:kItemListAppImgUrlList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.propertyShowType] forKey:kItemListPropertyShowType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originalPrice] forKey:kItemListOriginalPrice];
    [mutableDict setValue:self.title forKey:kItemListTitle];
    NSMutableArray *tempArrayForImgUrlList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.imgUrlList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImgUrlList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImgUrlList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgUrlList] forKey:kItemListImgUrlList];
    [mutableDict setValue:self.averagePriceLable forKey:kItemListAveragePriceLable];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productgrade] forKey:kItemListProductgrade];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showColorCard] forKey:kItemListShowColorCard];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemListSelf] forKey:kItemListSelf];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kItemListGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kItemListBrandId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.onlineStatus] forKey:kItemListOnlineStatus];
    [mutableDict setValue:self.linkUrl forKey:kItemListLinkUrl];
    [mutableDict setValue:self.imgUrl forKey:kItemListImgUrl];
    [mutableDict setValue:self.smallSingleActivityLabelUrl forKey:kItemListSmallSingleActivityLabelUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentPrice] forKey:kItemListCurrentPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actualStorageStatus] forKey:kItemListActualStorageStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kItemListCommentCount];
    [mutableDict setValue:self.goodsNumLabel forKey:kItemListGoodsNumLabel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kItemListLikeCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAppPriceOnlyLabel] forKey:kItemListIsAppPriceOnlyLabel];
    [mutableDict setValue:self.description2 forKey:kItemListDescription2];
    [mutableDict setValue:self.description1 forKey:kItemListDescription1];
    [mutableDict setValue:self.introduce forKey:kItemListIntroduce];

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

    self.appImgUrlList = [aDecoder decodeObjectForKey:kItemListAppImgUrlList];
    self.propertyShowType = [aDecoder decodeDoubleForKey:kItemListPropertyShowType];
    self.originalPrice = [aDecoder decodeDoubleForKey:kItemListOriginalPrice];
    self.title = [aDecoder decodeObjectForKey:kItemListTitle];
    self.imgUrlList = [aDecoder decodeObjectForKey:kItemListImgUrlList];
    self.averagePriceLable = [aDecoder decodeObjectForKey:kItemListAveragePriceLable];
    self.productgrade = [aDecoder decodeDoubleForKey:kItemListProductgrade];
    self.showColorCard = [aDecoder decodeDoubleForKey:kItemListShowColorCard];
    self.itemListSelf = [aDecoder decodeDoubleForKey:kItemListSelf];
    self.goodsId = [aDecoder decodeDoubleForKey:kItemListGoodsId];
    self.brandId = [aDecoder decodeDoubleForKey:kItemListBrandId];
    self.onlineStatus = [aDecoder decodeDoubleForKey:kItemListOnlineStatus];
    self.linkUrl = [aDecoder decodeObjectForKey:kItemListLinkUrl];
    self.imgUrl = [aDecoder decodeObjectForKey:kItemListImgUrl];
    self.smallSingleActivityLabelUrl = [aDecoder decodeObjectForKey:kItemListSmallSingleActivityLabelUrl];
    self.currentPrice = [aDecoder decodeDoubleForKey:kItemListCurrentPrice];
    self.actualStorageStatus = [aDecoder decodeDoubleForKey:kItemListActualStorageStatus];
    self.commentCount = [aDecoder decodeDoubleForKey:kItemListCommentCount];
    self.goodsNumLabel = [aDecoder decodeObjectForKey:kItemListGoodsNumLabel];
    self.likeCount = [aDecoder decodeDoubleForKey:kItemListLikeCount];
    self.isAppPriceOnlyLabel = [aDecoder decodeDoubleForKey:kItemListIsAppPriceOnlyLabel];
    self.description2 = [aDecoder decodeObjectForKey:kItemListDescription2];
    self.description1 = [aDecoder decodeObjectForKey:kItemListDescription1];
    self.introduce = [aDecoder decodeObjectForKey:kItemListIntroduce];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_appImgUrlList forKey:kItemListAppImgUrlList];
    [aCoder encodeDouble:_propertyShowType forKey:kItemListPropertyShowType];
    [aCoder encodeDouble:_originalPrice forKey:kItemListOriginalPrice];
    [aCoder encodeObject:_title forKey:kItemListTitle];
    [aCoder encodeObject:_imgUrlList forKey:kItemListImgUrlList];
    [aCoder encodeObject:_averagePriceLable forKey:kItemListAveragePriceLable];
    [aCoder encodeDouble:_productgrade forKey:kItemListProductgrade];
    [aCoder encodeDouble:_showColorCard forKey:kItemListShowColorCard];
    [aCoder encodeDouble:_itemListSelf forKey:kItemListSelf];
    [aCoder encodeDouble:_goodsId forKey:kItemListGoodsId];
    [aCoder encodeDouble:_brandId forKey:kItemListBrandId];
    [aCoder encodeDouble:_onlineStatus forKey:kItemListOnlineStatus];
    [aCoder encodeObject:_linkUrl forKey:kItemListLinkUrl];
    [aCoder encodeObject:_imgUrl forKey:kItemListImgUrl];
    [aCoder encodeObject:_smallSingleActivityLabelUrl forKey:kItemListSmallSingleActivityLabelUrl];
    [aCoder encodeDouble:_currentPrice forKey:kItemListCurrentPrice];
    [aCoder encodeDouble:_actualStorageStatus forKey:kItemListActualStorageStatus];
    [aCoder encodeDouble:_commentCount forKey:kItemListCommentCount];
    [aCoder encodeObject:_goodsNumLabel forKey:kItemListGoodsNumLabel];
    [aCoder encodeDouble:_likeCount forKey:kItemListLikeCount];
    [aCoder encodeDouble:_isAppPriceOnlyLabel forKey:kItemListIsAppPriceOnlyLabel];
    [aCoder encodeObject:_description2 forKey:kItemListDescription2];
    [aCoder encodeObject:_description1 forKey:kItemListDescription1];
    [aCoder encodeObject:_introduce forKey:kItemListIntroduce];
}

- (id)copyWithZone:(NSZone *)zone
{
    ItemList *copy = [[ItemList alloc] init];
    
    if (copy) {

        copy.appImgUrlList = [self.appImgUrlList copyWithZone:zone];
        copy.propertyShowType = self.propertyShowType;
        copy.originalPrice = self.originalPrice;
        copy.title = [self.title copyWithZone:zone];
        copy.imgUrlList = [self.imgUrlList copyWithZone:zone];
        copy.averagePriceLable = [self.averagePriceLable copyWithZone:zone];
        copy.productgrade = self.productgrade;
        copy.showColorCard = self.showColorCard;
        copy.itemListSelf = self.itemListSelf;
        copy.goodsId = self.goodsId;
        copy.brandId = self.brandId;
        copy.onlineStatus = self.onlineStatus;
        copy.linkUrl = [self.linkUrl copyWithZone:zone];
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.smallSingleActivityLabelUrl = [self.smallSingleActivityLabelUrl copyWithZone:zone];
        copy.currentPrice = self.currentPrice;
        copy.actualStorageStatus = self.actualStorageStatus;
        copy.commentCount = self.commentCount;
        copy.goodsNumLabel = [self.goodsNumLabel copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.isAppPriceOnlyLabel = self.isAppPriceOnlyLabel;
        copy.description2 = [self.description2 copyWithZone:zone];
        copy.description1 = [self.description1 copyWithZone:zone];
        copy.introduce = [self.introduce copyWithZone:zone];
    }
    
    return copy;
}


@end
