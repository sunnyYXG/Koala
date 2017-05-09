//
//  RecommendSkuList.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendSkuList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double currentPrice;
@property (nonatomic, assign) double actualCurrentPriceForApp;
@property (nonatomic, strong) NSString *promotionTitle;
@property (nonatomic, strong) NSString *zhendanPromotionTitleLink;
@property (nonatomic, assign) double firstCount;
@property (nonatomic, assign) double actualStorageStatus;
@property (nonatomic, assign) double firstWarehouseId;
@property (nonatomic, assign) double isPersonalCustom;
@property (nonatomic, strong) NSString *promotionTitleLink;
@property (nonatomic, assign) double preSaleStore;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, assign) double storeForView;
@property (nonatomic, assign) double storageStatus;
@property (nonatomic, assign) double personalPostalArticlesTaxRate;
@property (nonatomic, assign) double sales;
@property (nonatomic, assign) double preSale;
@property (nonatomic, strong) NSString *danpinPromotionTitle;
@property (nonatomic, assign) double taxRate;
@property (nonatomic, assign) double secondCount;
@property (nonatomic, assign) double maturityStore;
@property (nonatomic, assign) double actualStore;
@property (nonatomic, assign) double actualCurrentPrice;
@property (nonatomic, assign) double storeStatus;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, assign) double supplierPrice;
@property (nonatomic, assign) double dailyLimit;
@property (nonatomic, assign) double appOnlyPriceIncrement;
@property (nonatomic, assign) double personalCustomLimitBuyMemberCount;
@property (nonatomic, assign) double appTemaiPriceIncrement;
@property (nonatomic, strong) NSArray *skuPropertyList;
@property (nonatomic, assign) double marketPrice;
@property (nonatomic, assign) double minBuyNum;
@property (nonatomic, assign) double suggestPrice;
@property (nonatomic, strong) NSArray *skuPropertyValueIdList;
@property (nonatomic, assign) double actualStoreForApp;
@property (nonatomic, assign) double updateStoreType;
@property (nonatomic, strong) NSArray *virtualGoodsList;
@property (nonatomic, strong) NSString *goodsItemNo;
@property (nonatomic, assign) double limitBuyOnce;
@property (nonatomic, assign) double activityStoreStatus;
@property (nonatomic, strong) NSString *skuId;
@property (nonatomic, strong) NSString *taxNo;
@property (nonatomic, assign) double store;
@property (nonatomic, strong) NSString *skuPropertyValueId4View;
@property (nonatomic, strong) NSString *danpinPromotionTitleLink;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
