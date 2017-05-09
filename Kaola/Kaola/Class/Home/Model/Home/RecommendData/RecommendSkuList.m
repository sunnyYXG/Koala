//
//  RecommendSkuList.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendSkuList.h"


NSString *const kRecommendSkuListCurrentPrice = @"currentPrice";
NSString *const kRecommendSkuListActualCurrentPriceForApp = @"actualCurrentPriceForApp";
NSString *const kRecommendSkuListPromotionTitle = @"promotionTitle";
NSString *const kRecommendSkuListZhendanPromotionTitleLink = @"zhendanPromotionTitleLink";
NSString *const kRecommendSkuListFirstCount = @"firstCount";
NSString *const kRecommendSkuListActualStorageStatus = @"actualStorageStatus";
NSString *const kRecommendSkuListFirstWarehouseId = @"firstWarehouseId";
NSString *const kRecommendSkuListIsPersonalCustom = @"isPersonalCustom";
NSString *const kRecommendSkuListPromotionTitleLink = @"promotionTitleLink";
NSString *const kRecommendSkuListPreSaleStore = @"preSaleStore";
NSString *const kRecommendSkuListHidden = @"hidden";
NSString *const kRecommendSkuListStoreForView = @"storeForView";
NSString *const kRecommendSkuListStorageStatus = @"storageStatus";
NSString *const kRecommendSkuListPersonalPostalArticlesTaxRate = @"personalPostalArticlesTaxRate";
NSString *const kRecommendSkuListSales = @"sales";
NSString *const kRecommendSkuListPreSale = @"preSale";
NSString *const kRecommendSkuListDanpinPromotionTitle = @"danpinPromotionTitle";
NSString *const kRecommendSkuListTaxRate = @"taxRate";
NSString *const kRecommendSkuListSecondCount = @"secondCount";
NSString *const kRecommendSkuListMaturityStore = @"maturityStore";
NSString *const kRecommendSkuListActualStore = @"actualStore";
NSString *const kRecommendSkuListActualCurrentPrice = @"actualCurrentPrice";
NSString *const kRecommendSkuListStoreStatus = @"storeStatus";
NSString *const kRecommendSkuListGoodsId = @"goodsId";
NSString *const kRecommendSkuListSupplierPrice = @"supplierPrice";
NSString *const kRecommendSkuListDailyLimit = @"dailyLimit";
NSString *const kRecommendSkuListAppOnlyPriceIncrement = @"appOnlyPriceIncrement";
NSString *const kRecommendSkuListPersonalCustomLimitBuyMemberCount = @"personalCustomLimitBuyMemberCount";
NSString *const kRecommendSkuListAppTemaiPriceIncrement = @"appTemaiPriceIncrement";
NSString *const kRecommendSkuListSkuPropertyList = @"skuPropertyList";
NSString *const kRecommendSkuListMarketPrice = @"marketPrice";
NSString *const kRecommendSkuListMinBuyNum = @"minBuyNum";
NSString *const kRecommendSkuListSuggestPrice = @"suggestPrice";
NSString *const kRecommendSkuListSkuPropertyValueIdList = @"skuPropertyValueIdList";
NSString *const kRecommendSkuListActualStoreForApp = @"actualStoreForApp";
NSString *const kRecommendSkuListUpdateStoreType = @"updateStoreType";
NSString *const kRecommendSkuListVirtualGoodsList = @"virtualGoodsList";
NSString *const kRecommendSkuListGoodsItemNo = @"goodsItemNo";
NSString *const kRecommendSkuListLimitBuyOnce = @"limitBuyOnce";
NSString *const kRecommendSkuListActivityStoreStatus = @"activityStoreStatus";
NSString *const kRecommendSkuListSkuId = @"skuId";
NSString *const kRecommendSkuListTaxNo = @"taxNo";
NSString *const kRecommendSkuListStore = @"store";
NSString *const kRecommendSkuListSkuPropertyValueId4View = @"skuPropertyValueId4View";
NSString *const kRecommendSkuListDanpinPromotionTitleLink = @"danpinPromotionTitleLink";


@interface RecommendSkuList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendSkuList

@synthesize currentPrice = _currentPrice;
@synthesize actualCurrentPriceForApp = _actualCurrentPriceForApp;
@synthesize promotionTitle = _promotionTitle;
@synthesize zhendanPromotionTitleLink = _zhendanPromotionTitleLink;
@synthesize firstCount = _firstCount;
@synthesize actualStorageStatus = _actualStorageStatus;
@synthesize firstWarehouseId = _firstWarehouseId;
@synthesize isPersonalCustom = _isPersonalCustom;
@synthesize promotionTitleLink = _promotionTitleLink;
@synthesize preSaleStore = _preSaleStore;
@synthesize hidden = _hidden;
@synthesize storeForView = _storeForView;
@synthesize storageStatus = _storageStatus;
@synthesize personalPostalArticlesTaxRate = _personalPostalArticlesTaxRate;
@synthesize sales = _sales;
@synthesize preSale = _preSale;
@synthesize danpinPromotionTitle = _danpinPromotionTitle;
@synthesize taxRate = _taxRate;
@synthesize secondCount = _secondCount;
@synthesize maturityStore = _maturityStore;
@synthesize actualStore = _actualStore;
@synthesize actualCurrentPrice = _actualCurrentPrice;
@synthesize storeStatus = _storeStatus;
@synthesize goodsId = _goodsId;
@synthesize supplierPrice = _supplierPrice;
@synthesize dailyLimit = _dailyLimit;
@synthesize appOnlyPriceIncrement = _appOnlyPriceIncrement;
@synthesize personalCustomLimitBuyMemberCount = _personalCustomLimitBuyMemberCount;
@synthesize appTemaiPriceIncrement = _appTemaiPriceIncrement;
@synthesize skuPropertyList = _skuPropertyList;
@synthesize marketPrice = _marketPrice;
@synthesize minBuyNum = _minBuyNum;
@synthesize suggestPrice = _suggestPrice;
@synthesize skuPropertyValueIdList = _skuPropertyValueIdList;
@synthesize actualStoreForApp = _actualStoreForApp;
@synthesize updateStoreType = _updateStoreType;
@synthesize virtualGoodsList = _virtualGoodsList;
@synthesize goodsItemNo = _goodsItemNo;
@synthesize limitBuyOnce = _limitBuyOnce;
@synthesize activityStoreStatus = _activityStoreStatus;
@synthesize skuId = _skuId;
@synthesize taxNo = _taxNo;
@synthesize store = _store;
@synthesize skuPropertyValueId4View = _skuPropertyValueId4View;
@synthesize danpinPromotionTitleLink = _danpinPromotionTitleLink;


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
            self.currentPrice = [[self objectOrNilForKey:kRecommendSkuListCurrentPrice fromDictionary:dict] doubleValue];
            self.actualCurrentPriceForApp = [[self objectOrNilForKey:kRecommendSkuListActualCurrentPriceForApp fromDictionary:dict] doubleValue];
            self.promotionTitle = [self objectOrNilForKey:kRecommendSkuListPromotionTitle fromDictionary:dict];
            self.zhendanPromotionTitleLink = [self objectOrNilForKey:kRecommendSkuListZhendanPromotionTitleLink fromDictionary:dict];
            self.firstCount = [[self objectOrNilForKey:kRecommendSkuListFirstCount fromDictionary:dict] doubleValue];
            self.actualStorageStatus = [[self objectOrNilForKey:kRecommendSkuListActualStorageStatus fromDictionary:dict] doubleValue];
            self.firstWarehouseId = [[self objectOrNilForKey:kRecommendSkuListFirstWarehouseId fromDictionary:dict] doubleValue];
            self.isPersonalCustom = [[self objectOrNilForKey:kRecommendSkuListIsPersonalCustom fromDictionary:dict] doubleValue];
            self.promotionTitleLink = [self objectOrNilForKey:kRecommendSkuListPromotionTitleLink fromDictionary:dict];
            self.preSaleStore = [[self objectOrNilForKey:kRecommendSkuListPreSaleStore fromDictionary:dict] doubleValue];
            self.hidden = [[self objectOrNilForKey:kRecommendSkuListHidden fromDictionary:dict] boolValue];
            self.storeForView = [[self objectOrNilForKey:kRecommendSkuListStoreForView fromDictionary:dict] doubleValue];
            self.storageStatus = [[self objectOrNilForKey:kRecommendSkuListStorageStatus fromDictionary:dict] doubleValue];
            self.personalPostalArticlesTaxRate = [[self objectOrNilForKey:kRecommendSkuListPersonalPostalArticlesTaxRate fromDictionary:dict] doubleValue];
            self.sales = [[self objectOrNilForKey:kRecommendSkuListSales fromDictionary:dict] doubleValue];
            self.preSale = [[self objectOrNilForKey:kRecommendSkuListPreSale fromDictionary:dict] doubleValue];
            self.danpinPromotionTitle = [self objectOrNilForKey:kRecommendSkuListDanpinPromotionTitle fromDictionary:dict];
            self.taxRate = [[self objectOrNilForKey:kRecommendSkuListTaxRate fromDictionary:dict] doubleValue];
            self.secondCount = [[self objectOrNilForKey:kRecommendSkuListSecondCount fromDictionary:dict] doubleValue];
            self.maturityStore = [[self objectOrNilForKey:kRecommendSkuListMaturityStore fromDictionary:dict] doubleValue];
            self.actualStore = [[self objectOrNilForKey:kRecommendSkuListActualStore fromDictionary:dict] doubleValue];
            self.actualCurrentPrice = [[self objectOrNilForKey:kRecommendSkuListActualCurrentPrice fromDictionary:dict] doubleValue];
            self.storeStatus = [[self objectOrNilForKey:kRecommendSkuListStoreStatus fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kRecommendSkuListGoodsId fromDictionary:dict] doubleValue];
            self.supplierPrice = [[self objectOrNilForKey:kRecommendSkuListSupplierPrice fromDictionary:dict] doubleValue];
            self.dailyLimit = [[self objectOrNilForKey:kRecommendSkuListDailyLimit fromDictionary:dict] doubleValue];
            self.appOnlyPriceIncrement = [[self objectOrNilForKey:kRecommendSkuListAppOnlyPriceIncrement fromDictionary:dict] doubleValue];
            self.personalCustomLimitBuyMemberCount = [[self objectOrNilForKey:kRecommendSkuListPersonalCustomLimitBuyMemberCount fromDictionary:dict] doubleValue];
            self.appTemaiPriceIncrement = [[self objectOrNilForKey:kRecommendSkuListAppTemaiPriceIncrement fromDictionary:dict] doubleValue];
            self.skuPropertyList = [self objectOrNilForKey:kRecommendSkuListSkuPropertyList fromDictionary:dict];
            self.marketPrice = [[self objectOrNilForKey:kRecommendSkuListMarketPrice fromDictionary:dict] doubleValue];
            self.minBuyNum = [[self objectOrNilForKey:kRecommendSkuListMinBuyNum fromDictionary:dict] doubleValue];
            self.suggestPrice = [[self objectOrNilForKey:kRecommendSkuListSuggestPrice fromDictionary:dict] doubleValue];
            self.skuPropertyValueIdList = [self objectOrNilForKey:kRecommendSkuListSkuPropertyValueIdList fromDictionary:dict];
            self.actualStoreForApp = [[self objectOrNilForKey:kRecommendSkuListActualStoreForApp fromDictionary:dict] doubleValue];
            self.updateStoreType = [[self objectOrNilForKey:kRecommendSkuListUpdateStoreType fromDictionary:dict] doubleValue];
            self.virtualGoodsList = [self objectOrNilForKey:kRecommendSkuListVirtualGoodsList fromDictionary:dict];
            self.goodsItemNo = [self objectOrNilForKey:kRecommendSkuListGoodsItemNo fromDictionary:dict];
            self.limitBuyOnce = [[self objectOrNilForKey:kRecommendSkuListLimitBuyOnce fromDictionary:dict] doubleValue];
            self.activityStoreStatus = [[self objectOrNilForKey:kRecommendSkuListActivityStoreStatus fromDictionary:dict] doubleValue];
            self.skuId = [self objectOrNilForKey:kRecommendSkuListSkuId fromDictionary:dict];
            self.taxNo = [self objectOrNilForKey:kRecommendSkuListTaxNo fromDictionary:dict];
            self.store = [[self objectOrNilForKey:kRecommendSkuListStore fromDictionary:dict] doubleValue];
            self.skuPropertyValueId4View = [self objectOrNilForKey:kRecommendSkuListSkuPropertyValueId4View fromDictionary:dict];
            self.danpinPromotionTitleLink = [self objectOrNilForKey:kRecommendSkuListDanpinPromotionTitleLink fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentPrice] forKey:kRecommendSkuListCurrentPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actualCurrentPriceForApp] forKey:kRecommendSkuListActualCurrentPriceForApp];
    [mutableDict setValue:self.promotionTitle forKey:kRecommendSkuListPromotionTitle];
    [mutableDict setValue:self.zhendanPromotionTitleLink forKey:kRecommendSkuListZhendanPromotionTitleLink];
    [mutableDict setValue:[NSNumber numberWithDouble:self.firstCount] forKey:kRecommendSkuListFirstCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actualStorageStatus] forKey:kRecommendSkuListActualStorageStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.firstWarehouseId] forKey:kRecommendSkuListFirstWarehouseId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isPersonalCustom] forKey:kRecommendSkuListIsPersonalCustom];
    [mutableDict setValue:self.promotionTitleLink forKey:kRecommendSkuListPromotionTitleLink];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preSaleStore] forKey:kRecommendSkuListPreSaleStore];
    [mutableDict setValue:[NSNumber numberWithBool:self.hidden] forKey:kRecommendSkuListHidden];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeForView] forKey:kRecommendSkuListStoreForView];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storageStatus] forKey:kRecommendSkuListStorageStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.personalPostalArticlesTaxRate] forKey:kRecommendSkuListPersonalPostalArticlesTaxRate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sales] forKey:kRecommendSkuListSales];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preSale] forKey:kRecommendSkuListPreSale];
    [mutableDict setValue:self.danpinPromotionTitle forKey:kRecommendSkuListDanpinPromotionTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taxRate] forKey:kRecommendSkuListTaxRate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.secondCount] forKey:kRecommendSkuListSecondCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maturityStore] forKey:kRecommendSkuListMaturityStore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actualStore] forKey:kRecommendSkuListActualStore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actualCurrentPrice] forKey:kRecommendSkuListActualCurrentPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeStatus] forKey:kRecommendSkuListStoreStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kRecommendSkuListGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.supplierPrice] forKey:kRecommendSkuListSupplierPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailyLimit] forKey:kRecommendSkuListDailyLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appOnlyPriceIncrement] forKey:kRecommendSkuListAppOnlyPriceIncrement];
    [mutableDict setValue:[NSNumber numberWithDouble:self.personalCustomLimitBuyMemberCount] forKey:kRecommendSkuListPersonalCustomLimitBuyMemberCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appTemaiPriceIncrement] forKey:kRecommendSkuListAppTemaiPriceIncrement];
    NSMutableArray *tempArrayForSkuPropertyList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.skuPropertyList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSkuPropertyList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSkuPropertyList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSkuPropertyList] forKey:kRecommendSkuListSkuPropertyList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kRecommendSkuListMarketPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.minBuyNum] forKey:kRecommendSkuListMinBuyNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.suggestPrice] forKey:kRecommendSkuListSuggestPrice];
    NSMutableArray *tempArrayForSkuPropertyValueIdList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.skuPropertyValueIdList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSkuPropertyValueIdList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSkuPropertyValueIdList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSkuPropertyValueIdList] forKey:kRecommendSkuListSkuPropertyValueIdList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actualStoreForApp] forKey:kRecommendSkuListActualStoreForApp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updateStoreType] forKey:kRecommendSkuListUpdateStoreType];
    NSMutableArray *tempArrayForVirtualGoodsList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.virtualGoodsList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVirtualGoodsList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVirtualGoodsList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVirtualGoodsList] forKey:kRecommendSkuListVirtualGoodsList];
    [mutableDict setValue:self.goodsItemNo forKey:kRecommendSkuListGoodsItemNo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limitBuyOnce] forKey:kRecommendSkuListLimitBuyOnce];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityStoreStatus] forKey:kRecommendSkuListActivityStoreStatus];
    [mutableDict setValue:self.skuId forKey:kRecommendSkuListSkuId];
    [mutableDict setValue:self.taxNo forKey:kRecommendSkuListTaxNo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.store] forKey:kRecommendSkuListStore];
    [mutableDict setValue:self.skuPropertyValueId4View forKey:kRecommendSkuListSkuPropertyValueId4View];
    [mutableDict setValue:self.danpinPromotionTitleLink forKey:kRecommendSkuListDanpinPromotionTitleLink];

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

    self.currentPrice = [aDecoder decodeDoubleForKey:kRecommendSkuListCurrentPrice];
    self.actualCurrentPriceForApp = [aDecoder decodeDoubleForKey:kRecommendSkuListActualCurrentPriceForApp];
    self.promotionTitle = [aDecoder decodeObjectForKey:kRecommendSkuListPromotionTitle];
    self.zhendanPromotionTitleLink = [aDecoder decodeObjectForKey:kRecommendSkuListZhendanPromotionTitleLink];
    self.firstCount = [aDecoder decodeDoubleForKey:kRecommendSkuListFirstCount];
    self.actualStorageStatus = [aDecoder decodeDoubleForKey:kRecommendSkuListActualStorageStatus];
    self.firstWarehouseId = [aDecoder decodeDoubleForKey:kRecommendSkuListFirstWarehouseId];
    self.isPersonalCustom = [aDecoder decodeDoubleForKey:kRecommendSkuListIsPersonalCustom];
    self.promotionTitleLink = [aDecoder decodeObjectForKey:kRecommendSkuListPromotionTitleLink];
    self.preSaleStore = [aDecoder decodeDoubleForKey:kRecommendSkuListPreSaleStore];
    self.hidden = [aDecoder decodeBoolForKey:kRecommendSkuListHidden];
    self.storeForView = [aDecoder decodeDoubleForKey:kRecommendSkuListStoreForView];
    self.storageStatus = [aDecoder decodeDoubleForKey:kRecommendSkuListStorageStatus];
    self.personalPostalArticlesTaxRate = [aDecoder decodeDoubleForKey:kRecommendSkuListPersonalPostalArticlesTaxRate];
    self.sales = [aDecoder decodeDoubleForKey:kRecommendSkuListSales];
    self.preSale = [aDecoder decodeDoubleForKey:kRecommendSkuListPreSale];
    self.danpinPromotionTitle = [aDecoder decodeObjectForKey:kRecommendSkuListDanpinPromotionTitle];
    self.taxRate = [aDecoder decodeDoubleForKey:kRecommendSkuListTaxRate];
    self.secondCount = [aDecoder decodeDoubleForKey:kRecommendSkuListSecondCount];
    self.maturityStore = [aDecoder decodeDoubleForKey:kRecommendSkuListMaturityStore];
    self.actualStore = [aDecoder decodeDoubleForKey:kRecommendSkuListActualStore];
    self.actualCurrentPrice = [aDecoder decodeDoubleForKey:kRecommendSkuListActualCurrentPrice];
    self.storeStatus = [aDecoder decodeDoubleForKey:kRecommendSkuListStoreStatus];
    self.goodsId = [aDecoder decodeDoubleForKey:kRecommendSkuListGoodsId];
    self.supplierPrice = [aDecoder decodeDoubleForKey:kRecommendSkuListSupplierPrice];
    self.dailyLimit = [aDecoder decodeDoubleForKey:kRecommendSkuListDailyLimit];
    self.appOnlyPriceIncrement = [aDecoder decodeDoubleForKey:kRecommendSkuListAppOnlyPriceIncrement];
    self.personalCustomLimitBuyMemberCount = [aDecoder decodeDoubleForKey:kRecommendSkuListPersonalCustomLimitBuyMemberCount];
    self.appTemaiPriceIncrement = [aDecoder decodeDoubleForKey:kRecommendSkuListAppTemaiPriceIncrement];
    self.skuPropertyList = [aDecoder decodeObjectForKey:kRecommendSkuListSkuPropertyList];
    self.marketPrice = [aDecoder decodeDoubleForKey:kRecommendSkuListMarketPrice];
    self.minBuyNum = [aDecoder decodeDoubleForKey:kRecommendSkuListMinBuyNum];
    self.suggestPrice = [aDecoder decodeDoubleForKey:kRecommendSkuListSuggestPrice];
    self.skuPropertyValueIdList = [aDecoder decodeObjectForKey:kRecommendSkuListSkuPropertyValueIdList];
    self.actualStoreForApp = [aDecoder decodeDoubleForKey:kRecommendSkuListActualStoreForApp];
    self.updateStoreType = [aDecoder decodeDoubleForKey:kRecommendSkuListUpdateStoreType];
    self.virtualGoodsList = [aDecoder decodeObjectForKey:kRecommendSkuListVirtualGoodsList];
    self.goodsItemNo = [aDecoder decodeObjectForKey:kRecommendSkuListGoodsItemNo];
    self.limitBuyOnce = [aDecoder decodeDoubleForKey:kRecommendSkuListLimitBuyOnce];
    self.activityStoreStatus = [aDecoder decodeDoubleForKey:kRecommendSkuListActivityStoreStatus];
    self.skuId = [aDecoder decodeObjectForKey:kRecommendSkuListSkuId];
    self.taxNo = [aDecoder decodeObjectForKey:kRecommendSkuListTaxNo];
    self.store = [aDecoder decodeDoubleForKey:kRecommendSkuListStore];
    self.skuPropertyValueId4View = [aDecoder decodeObjectForKey:kRecommendSkuListSkuPropertyValueId4View];
    self.danpinPromotionTitleLink = [aDecoder decodeObjectForKey:kRecommendSkuListDanpinPromotionTitleLink];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_currentPrice forKey:kRecommendSkuListCurrentPrice];
    [aCoder encodeDouble:_actualCurrentPriceForApp forKey:kRecommendSkuListActualCurrentPriceForApp];
    [aCoder encodeObject:_promotionTitle forKey:kRecommendSkuListPromotionTitle];
    [aCoder encodeObject:_zhendanPromotionTitleLink forKey:kRecommendSkuListZhendanPromotionTitleLink];
    [aCoder encodeDouble:_firstCount forKey:kRecommendSkuListFirstCount];
    [aCoder encodeDouble:_actualStorageStatus forKey:kRecommendSkuListActualStorageStatus];
    [aCoder encodeDouble:_firstWarehouseId forKey:kRecommendSkuListFirstWarehouseId];
    [aCoder encodeDouble:_isPersonalCustom forKey:kRecommendSkuListIsPersonalCustom];
    [aCoder encodeObject:_promotionTitleLink forKey:kRecommendSkuListPromotionTitleLink];
    [aCoder encodeDouble:_preSaleStore forKey:kRecommendSkuListPreSaleStore];
    [aCoder encodeBool:_hidden forKey:kRecommendSkuListHidden];
    [aCoder encodeDouble:_storeForView forKey:kRecommendSkuListStoreForView];
    [aCoder encodeDouble:_storageStatus forKey:kRecommendSkuListStorageStatus];
    [aCoder encodeDouble:_personalPostalArticlesTaxRate forKey:kRecommendSkuListPersonalPostalArticlesTaxRate];
    [aCoder encodeDouble:_sales forKey:kRecommendSkuListSales];
    [aCoder encodeDouble:_preSale forKey:kRecommendSkuListPreSale];
    [aCoder encodeObject:_danpinPromotionTitle forKey:kRecommendSkuListDanpinPromotionTitle];
    [aCoder encodeDouble:_taxRate forKey:kRecommendSkuListTaxRate];
    [aCoder encodeDouble:_secondCount forKey:kRecommendSkuListSecondCount];
    [aCoder encodeDouble:_maturityStore forKey:kRecommendSkuListMaturityStore];
    [aCoder encodeDouble:_actualStore forKey:kRecommendSkuListActualStore];
    [aCoder encodeDouble:_actualCurrentPrice forKey:kRecommendSkuListActualCurrentPrice];
    [aCoder encodeDouble:_storeStatus forKey:kRecommendSkuListStoreStatus];
    [aCoder encodeDouble:_goodsId forKey:kRecommendSkuListGoodsId];
    [aCoder encodeDouble:_supplierPrice forKey:kRecommendSkuListSupplierPrice];
    [aCoder encodeDouble:_dailyLimit forKey:kRecommendSkuListDailyLimit];
    [aCoder encodeDouble:_appOnlyPriceIncrement forKey:kRecommendSkuListAppOnlyPriceIncrement];
    [aCoder encodeDouble:_personalCustomLimitBuyMemberCount forKey:kRecommendSkuListPersonalCustomLimitBuyMemberCount];
    [aCoder encodeDouble:_appTemaiPriceIncrement forKey:kRecommendSkuListAppTemaiPriceIncrement];
    [aCoder encodeObject:_skuPropertyList forKey:kRecommendSkuListSkuPropertyList];
    [aCoder encodeDouble:_marketPrice forKey:kRecommendSkuListMarketPrice];
    [aCoder encodeDouble:_minBuyNum forKey:kRecommendSkuListMinBuyNum];
    [aCoder encodeDouble:_suggestPrice forKey:kRecommendSkuListSuggestPrice];
    [aCoder encodeObject:_skuPropertyValueIdList forKey:kRecommendSkuListSkuPropertyValueIdList];
    [aCoder encodeDouble:_actualStoreForApp forKey:kRecommendSkuListActualStoreForApp];
    [aCoder encodeDouble:_updateStoreType forKey:kRecommendSkuListUpdateStoreType];
    [aCoder encodeObject:_virtualGoodsList forKey:kRecommendSkuListVirtualGoodsList];
    [aCoder encodeObject:_goodsItemNo forKey:kRecommendSkuListGoodsItemNo];
    [aCoder encodeDouble:_limitBuyOnce forKey:kRecommendSkuListLimitBuyOnce];
    [aCoder encodeDouble:_activityStoreStatus forKey:kRecommendSkuListActivityStoreStatus];
    [aCoder encodeObject:_skuId forKey:kRecommendSkuListSkuId];
    [aCoder encodeObject:_taxNo forKey:kRecommendSkuListTaxNo];
    [aCoder encodeDouble:_store forKey:kRecommendSkuListStore];
    [aCoder encodeObject:_skuPropertyValueId4View forKey:kRecommendSkuListSkuPropertyValueId4View];
    [aCoder encodeObject:_danpinPromotionTitleLink forKey:kRecommendSkuListDanpinPromotionTitleLink];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendSkuList *copy = [[RecommendSkuList alloc] init];
    
    if (copy) {

        copy.currentPrice = self.currentPrice;
        copy.actualCurrentPriceForApp = self.actualCurrentPriceForApp;
        copy.promotionTitle = [self.promotionTitle copyWithZone:zone];
        copy.zhendanPromotionTitleLink = [self.zhendanPromotionTitleLink copyWithZone:zone];
        copy.firstCount = self.firstCount;
        copy.actualStorageStatus = self.actualStorageStatus;
        copy.firstWarehouseId = self.firstWarehouseId;
        copy.isPersonalCustom = self.isPersonalCustom;
        copy.promotionTitleLink = [self.promotionTitleLink copyWithZone:zone];
        copy.preSaleStore = self.preSaleStore;
        copy.hidden = self.hidden;
        copy.storeForView = self.storeForView;
        copy.storageStatus = self.storageStatus;
        copy.personalPostalArticlesTaxRate = self.personalPostalArticlesTaxRate;
        copy.sales = self.sales;
        copy.preSale = self.preSale;
        copy.danpinPromotionTitle = [self.danpinPromotionTitle copyWithZone:zone];
        copy.taxRate = self.taxRate;
        copy.secondCount = self.secondCount;
        copy.maturityStore = self.maturityStore;
        copy.actualStore = self.actualStore;
        copy.actualCurrentPrice = self.actualCurrentPrice;
        copy.storeStatus = self.storeStatus;
        copy.goodsId = self.goodsId;
        copy.supplierPrice = self.supplierPrice;
        copy.dailyLimit = self.dailyLimit;
        copy.appOnlyPriceIncrement = self.appOnlyPriceIncrement;
        copy.personalCustomLimitBuyMemberCount = self.personalCustomLimitBuyMemberCount;
        copy.appTemaiPriceIncrement = self.appTemaiPriceIncrement;
        copy.skuPropertyList = [self.skuPropertyList copyWithZone:zone];
        copy.marketPrice = self.marketPrice;
        copy.minBuyNum = self.minBuyNum;
        copy.suggestPrice = self.suggestPrice;
        copy.skuPropertyValueIdList = [self.skuPropertyValueIdList copyWithZone:zone];
        copy.actualStoreForApp = self.actualStoreForApp;
        copy.updateStoreType = self.updateStoreType;
        copy.virtualGoodsList = [self.virtualGoodsList copyWithZone:zone];
        copy.goodsItemNo = [self.goodsItemNo copyWithZone:zone];
        copy.limitBuyOnce = self.limitBuyOnce;
        copy.activityStoreStatus = self.activityStoreStatus;
        copy.skuId = [self.skuId copyWithZone:zone];
        copy.taxNo = [self.taxNo copyWithZone:zone];
        copy.store = self.store;
        copy.skuPropertyValueId4View = [self.skuPropertyValueId4View copyWithZone:zone];
        copy.danpinPromotionTitleLink = [self.danpinPromotionTitleLink copyWithZone:zone];
    }
    
    return copy;
}


@end
