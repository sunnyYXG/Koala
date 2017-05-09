//
//  RecommendHome.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendHome.h"
#import "RecommendZhengdanActivity.h"
#import "RecommendLocationInfo.h"
#import "RecommendAlbumGoodsList.h"
#import "RecommendCommentPreview.h"
#import "RecommendSkuList.h"
#import "RecommendGoodsPropertyList.h"


NSString *const kRecommendHomeZhengdanActivity = @"zhengdanActivity";
NSString *const kRecommendHomeViewCode = @"viewCode";
NSString *const kRecommendHomeFreeTaxMaxAmount = @"freeTaxMaxAmount";
NSString *const kRecommendHomePreSale = @"preSale";
NSString *const kRecommendHomeSingleGoodsActivityLabel = @"singleGoodsActivityLabel";
NSString *const kRecommendHomeGoodsId = @"goodsId";
NSString *const kRecommendHomeZhengdanRulesStr = @"zhengdanRulesStr";
NSString *const kRecommendHomeTitle = @"title";
NSString *const kRecommendHomeImportType = @"importType";
NSString *const kRecommendHomeCurrentPrice = @"currentPrice";
NSString *const kRecommendHomeShowColorCard = @"showColorCard";
NSString *const kRecommendHomeImgUrl = @"imgUrl";
NSString *const kRecommendHomeImgUrlList = @"imgUrlList";
NSString *const kRecommendHomeZhengdanActivityType = @"zhengdanActivityType";
NSString *const kRecommendHomeSlug = @"slug";
NSString *const kRecommendHomeSource = @"source";
NSString *const kRecommendHomeIntroduce = @"introduce";
NSString *const kRecommendHomeIsTax = @"isTax";
NSString *const kRecommendHomeLocationInfo = @"locationInfo";
NSString *const kRecommendHomeAlbumGoodsList = @"albumGoodsList";
NSString *const kRecommendHomeShippingFrom = @"shippingFrom";
NSString *const kRecommendHomeFlagUrl = @"flagUrl";
NSString *const kRecommendHomeActualStorageStatus = @"actualStorageStatus";
NSString *const kRecommendHomePayAmountLimit = @"payAmountLimit";
NSString *const kRecommendHomeBrandId = @"brandId";
NSString *const kRecommendHomeFollowNum = @"followNum";
NSString *const kRecommendHomeOnlineStatus = @"onlineStatus";
NSString *const kRecommendHomeLikeCount = @"likeCount";
NSString *const kRecommendHomeTaxTag = @"taxTag";
NSString *const kRecommendHomeItemType = @"itemType";
NSString *const kRecommendHomeBuyerNum = @"buyerNum";
NSString *const kRecommendHomeAlbumId = @"albumId";
NSString *const kRecommendHomeOriginalPrice = @"originalPrice";
NSString *const kRecommendHomeIsAppPriceOnlyLabel = @"isAppPriceOnlyLabel";
NSString *const kRecommendHomeSmallSingleActivityLabelUrl = @"smallSingleActivityLabelUrl";
NSString *const kRecommendHomeStyleType = @"styleType";
NSString *const kRecommendHomeAlbumInfoShowType = @"albumInfoShowType";
NSString *const kRecommendHomeAppImgUrlList = @"appImgUrlList";
NSString *const kRecommendHomeTaxLabel = @"taxLabel";
NSString *const kRecommendHomeIsShowCart = @"isShowCart";
NSString *const kRecommendHomeRecReason = @"recReason";
NSString *const kRecommendHomeIsPayTax = @"isPayTax";
NSString *const kRecommendHomeAppActivityTitleList = @"appActivityTitleList";
NSString *const kRecommendHomeSingleActivityLabelUrl = @"singleActivityLabelUrl";
NSString *const kRecommendHomeTaxExplanation = @"taxExplanation";
NSString *const kRecommendHomeSubTitle = @"subTitle";
NSString *const kRecommendHomeCommentPreview = @"commentPreview";
NSString *const kRecommendHomePayAmountLimitInfo = @"payAmountLimitInfo";
NSString *const kRecommendHomeSupplierName = @"supplierName";
NSString *const kRecommendHomeActivityIdList = @"activityIdList";
NSString *const kRecommendHomeActivityShowUrl = @"activityShowUrl";
NSString *const kRecommendHomeFreeTax = @"freeTax";
NSString *const kRecommendHomeSkuGoodsPropertyList = @"skuGoodsPropertyList";
NSString *const kRecommendHomeCommentCountStr = @"commentCountStr";
NSString *const kRecommendHomeSkuList = @"skuList";
NSString *const kRecommendHomeCommentCount = @"commentCount";
NSString *const kRecommendHomeIslike = @"islike";
NSString *const kRecommendHomeSingleGoodsActivityType = @"singleGoodsActivityType";
NSString *const kRecommendHomeBrandLogoUrl = @"brandLogoUrl";
NSString *const kRecommendHomeLabel = @"label";
NSString *const kRecommendHomeBrandName = @"brandName";
NSString *const kRecommendHomeGoodsPropertyList = @"goodsPropertyList";
NSString *const kRecommendHomeGoodsNum = @"goodsNum";
NSString *const kRecommendHomeAlbumType = @"albumType";


@interface RecommendHome ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendHome

@synthesize zhengdanActivity = _zhengdanActivity;
@synthesize viewCode = _viewCode;
@synthesize freeTaxMaxAmount = _freeTaxMaxAmount;
@synthesize preSale = _preSale;
@synthesize singleGoodsActivityLabel = _singleGoodsActivityLabel;
@synthesize goodsId = _goodsId;
@synthesize zhengdanRulesStr = _zhengdanRulesStr;
@synthesize title = _title;
@synthesize importType = _importType;
@synthesize currentPrice = _currentPrice;
@synthesize showColorCard = _showColorCard;
@synthesize imgUrl = _imgUrl;
@synthesize imgUrlList = _imgUrlList;
@synthesize zhengdanActivityType = _zhengdanActivityType;
@synthesize slug = _slug;
@synthesize source = _source;
@synthesize introduce = _introduce;
@synthesize isTax = _isTax;
@synthesize locationInfo = _locationInfo;
@synthesize albumGoodsList = _albumGoodsList;
@synthesize shippingFrom = _shippingFrom;
@synthesize flagUrl = _flagUrl;
@synthesize actualStorageStatus = _actualStorageStatus;
@synthesize payAmountLimit = _payAmountLimit;
@synthesize brandId = _brandId;
@synthesize followNum = _followNum;
@synthesize onlineStatus = _onlineStatus;
@synthesize likeCount = _likeCount;
@synthesize taxTag = _taxTag;
@synthesize itemType = _itemType;
@synthesize buyerNum = _buyerNum;
@synthesize albumId = _albumId;
@synthesize originalPrice = _originalPrice;
@synthesize isAppPriceOnlyLabel = _isAppPriceOnlyLabel;
@synthesize smallSingleActivityLabelUrl = _smallSingleActivityLabelUrl;
@synthesize styleType = _styleType;
@synthesize albumInfoShowType = _albumInfoShowType;
@synthesize appImgUrlList = _appImgUrlList;
@synthesize taxLabel = _taxLabel;
@synthesize isShowCart = _isShowCart;
@synthesize recReason = _recReason;
@synthesize isPayTax = _isPayTax;
@synthesize appActivityTitleList = _appActivityTitleList;
@synthesize singleActivityLabelUrl = _singleActivityLabelUrl;
@synthesize taxExplanation = _taxExplanation;
@synthesize subTitle = _subTitle;
@synthesize commentPreview = _commentPreview;
@synthesize payAmountLimitInfo = _payAmountLimitInfo;
@synthesize supplierName = _supplierName;
@synthesize activityIdList = _activityIdList;
@synthesize activityShowUrl = _activityShowUrl;
@synthesize freeTax = _freeTax;
@synthesize skuGoodsPropertyList = _skuGoodsPropertyList;
@synthesize commentCountStr = _commentCountStr;
@synthesize skuList = _skuList;
@synthesize commentCount = _commentCount;
@synthesize islike = _islike;
@synthesize singleGoodsActivityType = _singleGoodsActivityType;
@synthesize brandLogoUrl = _brandLogoUrl;
@synthesize label = _label;
@synthesize brandName = _brandName;
@synthesize goodsPropertyList = _goodsPropertyList;
@synthesize goodsNum = _goodsNum;
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
    NSObject *receivedRecommendZhengdanActivity = [dict objectForKey:kRecommendHomeZhengdanActivity];
    NSMutableArray *parsedRecommendZhengdanActivity = [NSMutableArray array];
    if ([receivedRecommendZhengdanActivity isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecommendZhengdanActivity) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecommendZhengdanActivity addObject:[RecommendZhengdanActivity modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecommendZhengdanActivity isKindOfClass:[NSDictionary class]]) {
       [parsedRecommendZhengdanActivity addObject:[RecommendZhengdanActivity modelObjectWithDictionary:(NSDictionary *)receivedRecommendZhengdanActivity]];
    }

    self.zhengdanActivity = [NSArray arrayWithArray:parsedRecommendZhengdanActivity];
            self.viewCode = [self objectOrNilForKey:kRecommendHomeViewCode fromDictionary:dict];
            self.freeTaxMaxAmount = [[self objectOrNilForKey:kRecommendHomeFreeTaxMaxAmount fromDictionary:dict] doubleValue];
            self.preSale = [[self objectOrNilForKey:kRecommendHomePreSale fromDictionary:dict] doubleValue];
            self.singleGoodsActivityLabel = [self objectOrNilForKey:kRecommendHomeSingleGoodsActivityLabel fromDictionary:dict];
            self.goodsId = [[self objectOrNilForKey:kRecommendHomeGoodsId fromDictionary:dict] doubleValue];
            self.zhengdanRulesStr = [self objectOrNilForKey:kRecommendHomeZhengdanRulesStr fromDictionary:dict];
            self.title = [self objectOrNilForKey:kRecommendHomeTitle fromDictionary:dict];
            self.importType = [[self objectOrNilForKey:kRecommendHomeImportType fromDictionary:dict] doubleValue];
            self.currentPrice = [[self objectOrNilForKey:kRecommendHomeCurrentPrice fromDictionary:dict] doubleValue];
            self.showColorCard = [[self objectOrNilForKey:kRecommendHomeShowColorCard fromDictionary:dict] doubleValue];
            self.imgUrl = [self objectOrNilForKey:kRecommendHomeImgUrl fromDictionary:dict];
            self.imgUrlList = [self objectOrNilForKey:kRecommendHomeImgUrlList fromDictionary:dict];
            self.zhengdanActivityType = [[self objectOrNilForKey:kRecommendHomeZhengdanActivityType fromDictionary:dict] doubleValue];
            self.slug = [self objectOrNilForKey:kRecommendHomeSlug fromDictionary:dict];
            self.source = [self objectOrNilForKey:kRecommendHomeSource fromDictionary:dict];
            self.introduce = [self objectOrNilForKey:kRecommendHomeIntroduce fromDictionary:dict];
            self.isTax = [[self objectOrNilForKey:kRecommendHomeIsTax fromDictionary:dict] doubleValue];
            self.locationInfo = [RecommendLocationInfo modelObjectWithDictionary:[dict objectForKey:kRecommendHomeLocationInfo]];
    NSObject *receivedRecommendAlbumGoodsList = [dict objectForKey:kRecommendHomeAlbumGoodsList];
    NSMutableArray *parsedRecommendAlbumGoodsList = [NSMutableArray array];
    if ([receivedRecommendAlbumGoodsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecommendAlbumGoodsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecommendAlbumGoodsList addObject:[RecommendAlbumGoodsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecommendAlbumGoodsList isKindOfClass:[NSDictionary class]]) {
       [parsedRecommendAlbumGoodsList addObject:[RecommendAlbumGoodsList modelObjectWithDictionary:(NSDictionary *)receivedRecommendAlbumGoodsList]];
    }

    self.albumGoodsList = [NSArray arrayWithArray:parsedRecommendAlbumGoodsList];
            self.shippingFrom = [self objectOrNilForKey:kRecommendHomeShippingFrom fromDictionary:dict];
            self.flagUrl = [self objectOrNilForKey:kRecommendHomeFlagUrl fromDictionary:dict];
            self.actualStorageStatus = [[self objectOrNilForKey:kRecommendHomeActualStorageStatus fromDictionary:dict] doubleValue];
            self.payAmountLimit = [[self objectOrNilForKey:kRecommendHomePayAmountLimit fromDictionary:dict] intValue];
            self.brandId = [[self objectOrNilForKey:kRecommendHomeBrandId fromDictionary:dict] doubleValue];
            self.followNum = [[self objectOrNilForKey:kRecommendHomeFollowNum fromDictionary:dict] doubleValue];
            self.onlineStatus = [[self objectOrNilForKey:kRecommendHomeOnlineStatus fromDictionary:dict] doubleValue];
            self.likeCount = [[self objectOrNilForKey:kRecommendHomeLikeCount fromDictionary:dict] doubleValue];
            self.taxTag = [self objectOrNilForKey:kRecommendHomeTaxTag fromDictionary:dict];
            self.itemType = [[self objectOrNilForKey:kRecommendHomeItemType fromDictionary:dict] doubleValue];
            self.buyerNum = [[self objectOrNilForKey:kRecommendHomeBuyerNum fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kRecommendHomeAlbumId fromDictionary:dict] doubleValue];
            self.originalPrice = [[self objectOrNilForKey:kRecommendHomeOriginalPrice fromDictionary:dict] doubleValue];
            self.isAppPriceOnlyLabel = [[self objectOrNilForKey:kRecommendHomeIsAppPriceOnlyLabel fromDictionary:dict] doubleValue];
            self.smallSingleActivityLabelUrl = [self objectOrNilForKey:kRecommendHomeSmallSingleActivityLabelUrl fromDictionary:dict];
            self.styleType = [[self objectOrNilForKey:kRecommendHomeStyleType fromDictionary:dict] doubleValue];
            self.albumInfoShowType = [[self objectOrNilForKey:kRecommendHomeAlbumInfoShowType fromDictionary:dict] doubleValue];
            self.appImgUrlList = [self objectOrNilForKey:kRecommendHomeAppImgUrlList fromDictionary:dict];
            self.taxLabel = [self objectOrNilForKey:kRecommendHomeTaxLabel fromDictionary:dict];
            self.isShowCart = [[self objectOrNilForKey:kRecommendHomeIsShowCart fromDictionary:dict] doubleValue];
            self.recReason = [self objectOrNilForKey:kRecommendHomeRecReason fromDictionary:dict];
            self.isPayTax = [[self objectOrNilForKey:kRecommendHomeIsPayTax fromDictionary:dict] doubleValue];
            self.appActivityTitleList = [self objectOrNilForKey:kRecommendHomeAppActivityTitleList fromDictionary:dict];
            self.singleActivityLabelUrl = [self objectOrNilForKey:kRecommendHomeSingleActivityLabelUrl fromDictionary:dict];
            self.taxExplanation = [self objectOrNilForKey:kRecommendHomeTaxExplanation fromDictionary:dict];
            self.subTitle = [self objectOrNilForKey:kRecommendHomeSubTitle fromDictionary:dict];
            self.commentPreview = [RecommendCommentPreview modelObjectWithDictionary:[dict objectForKey:kRecommendHomeCommentPreview]];
            self.payAmountLimitInfo = [self objectOrNilForKey:kRecommendHomePayAmountLimitInfo fromDictionary:dict];
            self.supplierName = [self objectOrNilForKey:kRecommendHomeSupplierName fromDictionary:dict];
            self.activityIdList = [self objectOrNilForKey:kRecommendHomeActivityIdList fromDictionary:dict];
            self.activityShowUrl = [self objectOrNilForKey:kRecommendHomeActivityShowUrl fromDictionary:dict];
            self.freeTax = [[self objectOrNilForKey:kRecommendHomeFreeTax fromDictionary:dict] doubleValue];
            self.skuGoodsPropertyList = [self objectOrNilForKey:kRecommendHomeSkuGoodsPropertyList fromDictionary:dict];
            self.commentCountStr = [self objectOrNilForKey:kRecommendHomeCommentCountStr fromDictionary:dict];
    NSObject *receivedRecommendSkuList = [dict objectForKey:kRecommendHomeSkuList];
    NSMutableArray *parsedRecommendSkuList = [NSMutableArray array];
    if ([receivedRecommendSkuList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecommendSkuList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecommendSkuList addObject:[RecommendSkuList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecommendSkuList isKindOfClass:[NSDictionary class]]) {
       [parsedRecommendSkuList addObject:[RecommendSkuList modelObjectWithDictionary:(NSDictionary *)receivedRecommendSkuList]];
    }

    self.skuList = [NSArray arrayWithArray:parsedRecommendSkuList];
            self.commentCount = [[self objectOrNilForKey:kRecommendHomeCommentCount fromDictionary:dict] doubleValue];
            self.islike = [[self objectOrNilForKey:kRecommendHomeIslike fromDictionary:dict] doubleValue];
            self.singleGoodsActivityType = [[self objectOrNilForKey:kRecommendHomeSingleGoodsActivityType fromDictionary:dict] doubleValue];
            self.brandLogoUrl = [self objectOrNilForKey:kRecommendHomeBrandLogoUrl fromDictionary:dict];
            self.label = [self objectOrNilForKey:kRecommendHomeLabel fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kRecommendHomeBrandName fromDictionary:dict];
    NSObject *receivedRecommendGoodsPropertyList = [dict objectForKey:kRecommendHomeGoodsPropertyList];
    NSMutableArray *parsedRecommendGoodsPropertyList = [NSMutableArray array];
    if ([receivedRecommendGoodsPropertyList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecommendGoodsPropertyList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecommendGoodsPropertyList addObject:[RecommendGoodsPropertyList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecommendGoodsPropertyList isKindOfClass:[NSDictionary class]]) {
       [parsedRecommendGoodsPropertyList addObject:[RecommendGoodsPropertyList modelObjectWithDictionary:(NSDictionary *)receivedRecommendGoodsPropertyList]];
    }

    self.goodsPropertyList = [NSArray arrayWithArray:parsedRecommendGoodsPropertyList];
            self.goodsNum = [[self objectOrNilForKey:kRecommendHomeGoodsNum fromDictionary:dict] doubleValue];
            self.albumType = [[self objectOrNilForKey:kRecommendHomeAlbumType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForZhengdanActivity = [NSMutableArray array];
    for (NSObject *subArrayObject in self.zhengdanActivity) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForZhengdanActivity addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForZhengdanActivity addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForZhengdanActivity] forKey:kRecommendHomeZhengdanActivity];
    [mutableDict setValue:self.viewCode forKey:kRecommendHomeViewCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.freeTaxMaxAmount] forKey:kRecommendHomeFreeTaxMaxAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preSale] forKey:kRecommendHomePreSale];
    [mutableDict setValue:self.singleGoodsActivityLabel forKey:kRecommendHomeSingleGoodsActivityLabel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kRecommendHomeGoodsId];
    NSMutableArray *tempArrayForZhengdanRulesStr = [NSMutableArray array];
    for (NSObject *subArrayObject in self.zhengdanRulesStr) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForZhengdanRulesStr addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForZhengdanRulesStr addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForZhengdanRulesStr] forKey:kRecommendHomeZhengdanRulesStr];
    [mutableDict setValue:self.title forKey:kRecommendHomeTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.importType] forKey:kRecommendHomeImportType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentPrice] forKey:kRecommendHomeCurrentPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showColorCard] forKey:kRecommendHomeShowColorCard];
    [mutableDict setValue:self.imgUrl forKey:kRecommendHomeImgUrl];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgUrlList] forKey:kRecommendHomeImgUrlList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.zhengdanActivityType] forKey:kRecommendHomeZhengdanActivityType];
    [mutableDict setValue:self.slug forKey:kRecommendHomeSlug];
    [mutableDict setValue:self.source forKey:kRecommendHomeSource];
    [mutableDict setValue:self.introduce forKey:kRecommendHomeIntroduce];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isTax] forKey:kRecommendHomeIsTax];
    [mutableDict setValue:[self.locationInfo dictionaryRepresentation] forKey:kRecommendHomeLocationInfo];
    NSMutableArray *tempArrayForAlbumGoodsList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.albumGoodsList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAlbumGoodsList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAlbumGoodsList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAlbumGoodsList] forKey:kRecommendHomeAlbumGoodsList];
    [mutableDict setValue:self.shippingFrom forKey:kRecommendHomeShippingFrom];
    [mutableDict setValue:self.flagUrl forKey:kRecommendHomeFlagUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actualStorageStatus] forKey:kRecommendHomeActualStorageStatus];
    [mutableDict setValue:[NSNumber numberWithInt:self.payAmountLimit] forKey:kRecommendHomePayAmountLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kRecommendHomeBrandId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followNum] forKey:kRecommendHomeFollowNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.onlineStatus] forKey:kRecommendHomeOnlineStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kRecommendHomeLikeCount];
    [mutableDict setValue:self.taxTag forKey:kRecommendHomeTaxTag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemType] forKey:kRecommendHomeItemType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buyerNum] forKey:kRecommendHomeBuyerNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kRecommendHomeAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originalPrice] forKey:kRecommendHomeOriginalPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAppPriceOnlyLabel] forKey:kRecommendHomeIsAppPriceOnlyLabel];
    [mutableDict setValue:self.smallSingleActivityLabelUrl forKey:kRecommendHomeSmallSingleActivityLabelUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.styleType] forKey:kRecommendHomeStyleType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumInfoShowType] forKey:kRecommendHomeAlbumInfoShowType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAppImgUrlList] forKey:kRecommendHomeAppImgUrlList];
    [mutableDict setValue:self.taxLabel forKey:kRecommendHomeTaxLabel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isShowCart] forKey:kRecommendHomeIsShowCart];
    [mutableDict setValue:self.recReason forKey:kRecommendHomeRecReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isPayTax] forKey:kRecommendHomeIsPayTax];
    NSMutableArray *tempArrayForAppActivityTitleList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.appActivityTitleList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAppActivityTitleList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAppActivityTitleList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAppActivityTitleList] forKey:kRecommendHomeAppActivityTitleList];
    [mutableDict setValue:self.singleActivityLabelUrl forKey:kRecommendHomeSingleActivityLabelUrl];
    [mutableDict setValue:self.taxExplanation forKey:kRecommendHomeTaxExplanation];
    [mutableDict setValue:self.subTitle forKey:kRecommendHomeSubTitle];
    [mutableDict setValue:[self.commentPreview dictionaryRepresentation] forKey:kRecommendHomeCommentPreview];
    [mutableDict setValue:self.payAmountLimitInfo forKey:kRecommendHomePayAmountLimitInfo];
    [mutableDict setValue:self.supplierName forKey:kRecommendHomeSupplierName];
    NSMutableArray *tempArrayForActivityIdList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.activityIdList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActivityIdList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActivityIdList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActivityIdList] forKey:kRecommendHomeActivityIdList];
    [mutableDict setValue:self.activityShowUrl forKey:kRecommendHomeActivityShowUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.freeTax] forKey:kRecommendHomeFreeTax];
    NSMutableArray *tempArrayForSkuGoodsPropertyList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.skuGoodsPropertyList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSkuGoodsPropertyList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSkuGoodsPropertyList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSkuGoodsPropertyList] forKey:kRecommendHomeSkuGoodsPropertyList];
    [mutableDict setValue:self.commentCountStr forKey:kRecommendHomeCommentCountStr];
    NSMutableArray *tempArrayForSkuList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.skuList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSkuList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSkuList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSkuList] forKey:kRecommendHomeSkuList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kRecommendHomeCommentCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.islike] forKey:kRecommendHomeIslike];
    [mutableDict setValue:[NSNumber numberWithDouble:self.singleGoodsActivityType] forKey:kRecommendHomeSingleGoodsActivityType];
    [mutableDict setValue:self.brandLogoUrl forKey:kRecommendHomeBrandLogoUrl];
    [mutableDict setValue:self.label forKey:kRecommendHomeLabel];
    [mutableDict setValue:self.brandName forKey:kRecommendHomeBrandName];
    NSMutableArray *tempArrayForGoodsPropertyList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.goodsPropertyList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGoodsPropertyList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGoodsPropertyList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGoodsPropertyList] forKey:kRecommendHomeGoodsPropertyList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsNum] forKey:kRecommendHomeGoodsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumType] forKey:kRecommendHomeAlbumType];

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

    self.zhengdanActivity = [aDecoder decodeObjectForKey:kRecommendHomeZhengdanActivity];
    self.viewCode = [aDecoder decodeObjectForKey:kRecommendHomeViewCode];
    self.freeTaxMaxAmount = [aDecoder decodeDoubleForKey:kRecommendHomeFreeTaxMaxAmount];
    self.preSale = [aDecoder decodeDoubleForKey:kRecommendHomePreSale];
    self.singleGoodsActivityLabel = [aDecoder decodeObjectForKey:kRecommendHomeSingleGoodsActivityLabel];
    self.goodsId = [aDecoder decodeDoubleForKey:kRecommendHomeGoodsId];
    self.zhengdanRulesStr = [aDecoder decodeObjectForKey:kRecommendHomeZhengdanRulesStr];
    self.title = [aDecoder decodeObjectForKey:kRecommendHomeTitle];
    self.importType = [aDecoder decodeDoubleForKey:kRecommendHomeImportType];
    self.currentPrice = [aDecoder decodeDoubleForKey:kRecommendHomeCurrentPrice];
    self.showColorCard = [aDecoder decodeDoubleForKey:kRecommendHomeShowColorCard];
    self.imgUrl = [aDecoder decodeObjectForKey:kRecommendHomeImgUrl];
    self.imgUrlList = [aDecoder decodeObjectForKey:kRecommendHomeImgUrlList];
    self.zhengdanActivityType = [aDecoder decodeDoubleForKey:kRecommendHomeZhengdanActivityType];
    self.slug = [aDecoder decodeObjectForKey:kRecommendHomeSlug];
    self.source = [aDecoder decodeObjectForKey:kRecommendHomeSource];
    self.introduce = [aDecoder decodeObjectForKey:kRecommendHomeIntroduce];
    self.isTax = [aDecoder decodeDoubleForKey:kRecommendHomeIsTax];
    self.locationInfo = [aDecoder decodeObjectForKey:kRecommendHomeLocationInfo];
    self.albumGoodsList = [aDecoder decodeObjectForKey:kRecommendHomeAlbumGoodsList];
    self.shippingFrom = [aDecoder decodeObjectForKey:kRecommendHomeShippingFrom];
    self.flagUrl = [aDecoder decodeObjectForKey:kRecommendHomeFlagUrl];
    self.actualStorageStatus = [aDecoder decodeDoubleForKey:kRecommendHomeActualStorageStatus];
    self.payAmountLimit = [aDecoder decodeIntegerForKey:kRecommendHomePayAmountLimit];
    self.brandId = [aDecoder decodeDoubleForKey:kRecommendHomeBrandId];
    self.followNum = [aDecoder decodeDoubleForKey:kRecommendHomeFollowNum];
    self.onlineStatus = [aDecoder decodeDoubleForKey:kRecommendHomeOnlineStatus];
    self.likeCount = [aDecoder decodeDoubleForKey:kRecommendHomeLikeCount];
    self.taxTag = [aDecoder decodeObjectForKey:kRecommendHomeTaxTag];
    self.itemType = [aDecoder decodeDoubleForKey:kRecommendHomeItemType];
    self.buyerNum = [aDecoder decodeDoubleForKey:kRecommendHomeBuyerNum];
    self.albumId = [aDecoder decodeDoubleForKey:kRecommendHomeAlbumId];
    self.originalPrice = [aDecoder decodeDoubleForKey:kRecommendHomeOriginalPrice];
    self.isAppPriceOnlyLabel = [aDecoder decodeDoubleForKey:kRecommendHomeIsAppPriceOnlyLabel];
    self.smallSingleActivityLabelUrl = [aDecoder decodeObjectForKey:kRecommendHomeSmallSingleActivityLabelUrl];
    self.styleType = [aDecoder decodeDoubleForKey:kRecommendHomeStyleType];
    self.albumInfoShowType = [aDecoder decodeDoubleForKey:kRecommendHomeAlbumInfoShowType];
    self.appImgUrlList = [aDecoder decodeObjectForKey:kRecommendHomeAppImgUrlList];
    self.taxLabel = [aDecoder decodeObjectForKey:kRecommendHomeTaxLabel];
    self.isShowCart = [aDecoder decodeDoubleForKey:kRecommendHomeIsShowCart];
    self.recReason = [aDecoder decodeObjectForKey:kRecommendHomeRecReason];
    self.isPayTax = [aDecoder decodeDoubleForKey:kRecommendHomeIsPayTax];
    self.appActivityTitleList = [aDecoder decodeObjectForKey:kRecommendHomeAppActivityTitleList];
    self.singleActivityLabelUrl = [aDecoder decodeObjectForKey:kRecommendHomeSingleActivityLabelUrl];
    self.taxExplanation = [aDecoder decodeObjectForKey:kRecommendHomeTaxExplanation];
    self.subTitle = [aDecoder decodeObjectForKey:kRecommendHomeSubTitle];
    self.commentPreview = [aDecoder decodeObjectForKey:kRecommendHomeCommentPreview];
    self.payAmountLimitInfo = [aDecoder decodeObjectForKey:kRecommendHomePayAmountLimitInfo];
    self.supplierName = [aDecoder decodeObjectForKey:kRecommendHomeSupplierName];
    self.activityIdList = [aDecoder decodeObjectForKey:kRecommendHomeActivityIdList];
    self.activityShowUrl = [aDecoder decodeObjectForKey:kRecommendHomeActivityShowUrl];
    self.freeTax = [aDecoder decodeDoubleForKey:kRecommendHomeFreeTax];
    self.skuGoodsPropertyList = [aDecoder decodeObjectForKey:kRecommendHomeSkuGoodsPropertyList];
    self.commentCountStr = [aDecoder decodeObjectForKey:kRecommendHomeCommentCountStr];
    self.skuList = [aDecoder decodeObjectForKey:kRecommendHomeSkuList];
    self.commentCount = [aDecoder decodeDoubleForKey:kRecommendHomeCommentCount];
    self.islike = [aDecoder decodeDoubleForKey:kRecommendHomeIslike];
    self.singleGoodsActivityType = [aDecoder decodeDoubleForKey:kRecommendHomeSingleGoodsActivityType];
    self.brandLogoUrl = [aDecoder decodeObjectForKey:kRecommendHomeBrandLogoUrl];
    self.label = [aDecoder decodeObjectForKey:kRecommendHomeLabel];
    self.brandName = [aDecoder decodeObjectForKey:kRecommendHomeBrandName];
    self.goodsPropertyList = [aDecoder decodeObjectForKey:kRecommendHomeGoodsPropertyList];
    self.goodsNum = [aDecoder decodeDoubleForKey:kRecommendHomeGoodsNum];
    self.albumType = [aDecoder decodeDoubleForKey:kRecommendHomeAlbumType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_zhengdanActivity forKey:kRecommendHomeZhengdanActivity];
    [aCoder encodeObject:_viewCode forKey:kRecommendHomeViewCode];
    [aCoder encodeDouble:_freeTaxMaxAmount forKey:kRecommendHomeFreeTaxMaxAmount];
    [aCoder encodeDouble:_preSale forKey:kRecommendHomePreSale];
    [aCoder encodeObject:_singleGoodsActivityLabel forKey:kRecommendHomeSingleGoodsActivityLabel];
    [aCoder encodeDouble:_goodsId forKey:kRecommendHomeGoodsId];
    [aCoder encodeObject:_zhengdanRulesStr forKey:kRecommendHomeZhengdanRulesStr];
    [aCoder encodeObject:_title forKey:kRecommendHomeTitle];
    [aCoder encodeDouble:_importType forKey:kRecommendHomeImportType];
    [aCoder encodeDouble:_currentPrice forKey:kRecommendHomeCurrentPrice];
    [aCoder encodeDouble:_showColorCard forKey:kRecommendHomeShowColorCard];
    [aCoder encodeObject:_imgUrl forKey:kRecommendHomeImgUrl];
    [aCoder encodeObject:_imgUrlList forKey:kRecommendHomeImgUrlList];
    [aCoder encodeDouble:_zhengdanActivityType forKey:kRecommendHomeZhengdanActivityType];
    [aCoder encodeObject:_slug forKey:kRecommendHomeSlug];
    [aCoder encodeObject:_source forKey:kRecommendHomeSource];
    [aCoder encodeObject:_introduce forKey:kRecommendHomeIntroduce];
    [aCoder encodeDouble:_isTax forKey:kRecommendHomeIsTax];
    [aCoder encodeObject:_locationInfo forKey:kRecommendHomeLocationInfo];
    [aCoder encodeObject:_albumGoodsList forKey:kRecommendHomeAlbumGoodsList];
    [aCoder encodeObject:_shippingFrom forKey:kRecommendHomeShippingFrom];
    [aCoder encodeObject:_flagUrl forKey:kRecommendHomeFlagUrl];
    [aCoder encodeDouble:_actualStorageStatus forKey:kRecommendHomeActualStorageStatus];
    [aCoder encodeInteger:_payAmountLimit forKey:kRecommendHomePayAmountLimit];
    [aCoder encodeDouble:_brandId forKey:kRecommendHomeBrandId];
    [aCoder encodeDouble:_followNum forKey:kRecommendHomeFollowNum];
    [aCoder encodeDouble:_onlineStatus forKey:kRecommendHomeOnlineStatus];
    [aCoder encodeDouble:_likeCount forKey:kRecommendHomeLikeCount];
    [aCoder encodeObject:_taxTag forKey:kRecommendHomeTaxTag];
    [aCoder encodeDouble:_itemType forKey:kRecommendHomeItemType];
    [aCoder encodeDouble:_buyerNum forKey:kRecommendHomeBuyerNum];
    [aCoder encodeDouble:_albumId forKey:kRecommendHomeAlbumId];
    [aCoder encodeDouble:_originalPrice forKey:kRecommendHomeOriginalPrice];
    [aCoder encodeDouble:_isAppPriceOnlyLabel forKey:kRecommendHomeIsAppPriceOnlyLabel];
    [aCoder encodeObject:_smallSingleActivityLabelUrl forKey:kRecommendHomeSmallSingleActivityLabelUrl];
    [aCoder encodeDouble:_styleType forKey:kRecommendHomeStyleType];
    [aCoder encodeDouble:_albumInfoShowType forKey:kRecommendHomeAlbumInfoShowType];
    [aCoder encodeObject:_appImgUrlList forKey:kRecommendHomeAppImgUrlList];
    [aCoder encodeObject:_taxLabel forKey:kRecommendHomeTaxLabel];
    [aCoder encodeDouble:_isShowCart forKey:kRecommendHomeIsShowCart];
    [aCoder encodeObject:_recReason forKey:kRecommendHomeRecReason];
    [aCoder encodeDouble:_isPayTax forKey:kRecommendHomeIsPayTax];
    [aCoder encodeObject:_appActivityTitleList forKey:kRecommendHomeAppActivityTitleList];
    [aCoder encodeObject:_singleActivityLabelUrl forKey:kRecommendHomeSingleActivityLabelUrl];
    [aCoder encodeObject:_taxExplanation forKey:kRecommendHomeTaxExplanation];
    [aCoder encodeObject:_subTitle forKey:kRecommendHomeSubTitle];
    [aCoder encodeObject:_commentPreview forKey:kRecommendHomeCommentPreview];
    [aCoder encodeObject:_payAmountLimitInfo forKey:kRecommendHomePayAmountLimitInfo];
    [aCoder encodeObject:_supplierName forKey:kRecommendHomeSupplierName];
    [aCoder encodeObject:_activityIdList forKey:kRecommendHomeActivityIdList];
    [aCoder encodeObject:_activityShowUrl forKey:kRecommendHomeActivityShowUrl];
    [aCoder encodeDouble:_freeTax forKey:kRecommendHomeFreeTax];
    [aCoder encodeObject:_skuGoodsPropertyList forKey:kRecommendHomeSkuGoodsPropertyList];
    [aCoder encodeObject:_commentCountStr forKey:kRecommendHomeCommentCountStr];
    [aCoder encodeObject:_skuList forKey:kRecommendHomeSkuList];
    [aCoder encodeDouble:_commentCount forKey:kRecommendHomeCommentCount];
    [aCoder encodeDouble:_islike forKey:kRecommendHomeIslike];
    [aCoder encodeDouble:_singleGoodsActivityType forKey:kRecommendHomeSingleGoodsActivityType];
    [aCoder encodeObject:_brandLogoUrl forKey:kRecommendHomeBrandLogoUrl];
    [aCoder encodeObject:_label forKey:kRecommendHomeLabel];
    [aCoder encodeObject:_brandName forKey:kRecommendHomeBrandName];
    [aCoder encodeObject:_goodsPropertyList forKey:kRecommendHomeGoodsPropertyList];
    [aCoder encodeDouble:_goodsNum forKey:kRecommendHomeGoodsNum];
    [aCoder encodeDouble:_albumType forKey:kRecommendHomeAlbumType];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendHome *copy = [[RecommendHome alloc] init];
    
    if (copy) {

        copy.zhengdanActivity = [self.zhengdanActivity copyWithZone:zone];
        copy.viewCode = [self.viewCode copyWithZone:zone];
        copy.freeTaxMaxAmount = self.freeTaxMaxAmount;
        copy.preSale = self.preSale;
        copy.singleGoodsActivityLabel = [self.singleGoodsActivityLabel copyWithZone:zone];
        copy.goodsId = self.goodsId;
        copy.zhengdanRulesStr = [self.zhengdanRulesStr copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.importType = self.importType;
        copy.currentPrice = self.currentPrice;
        copy.showColorCard = self.showColorCard;
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.imgUrlList = [self.imgUrlList copyWithZone:zone];
        copy.zhengdanActivityType = self.zhengdanActivityType;
        copy.slug = [self.slug copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.introduce = [self.introduce copyWithZone:zone];
        copy.isTax = self.isTax;
        copy.locationInfo = [self.locationInfo copyWithZone:zone];
        copy.albumGoodsList = [self.albumGoodsList copyWithZone:zone];
        copy.shippingFrom = [self.shippingFrom copyWithZone:zone];
        copy.flagUrl = [self.flagUrl copyWithZone:zone];
        copy.actualStorageStatus = self.actualStorageStatus;
        copy.payAmountLimit = self.payAmountLimit;
        copy.brandId = self.brandId;
        copy.followNum = self.followNum;
        copy.onlineStatus = self.onlineStatus;
        copy.likeCount = self.likeCount;
        copy.taxTag = [self.taxTag copyWithZone:zone];
        copy.itemType = self.itemType;
        copy.buyerNum = self.buyerNum;
        copy.albumId = self.albumId;
        copy.originalPrice = self.originalPrice;
        copy.isAppPriceOnlyLabel = self.isAppPriceOnlyLabel;
        copy.smallSingleActivityLabelUrl = [self.smallSingleActivityLabelUrl copyWithZone:zone];
        copy.styleType = self.styleType;
        copy.albumInfoShowType = self.albumInfoShowType;
        copy.appImgUrlList = [self.appImgUrlList copyWithZone:zone];
        copy.taxLabel = [self.taxLabel copyWithZone:zone];
        copy.isShowCart = self.isShowCart;
        copy.recReason = [self.recReason copyWithZone:zone];
        copy.isPayTax = self.isPayTax;
        copy.appActivityTitleList = [self.appActivityTitleList copyWithZone:zone];
        copy.singleActivityLabelUrl = [self.singleActivityLabelUrl copyWithZone:zone];
        copy.taxExplanation = [self.taxExplanation copyWithZone:zone];
        copy.subTitle = [self.subTitle copyWithZone:zone];
        copy.commentPreview = [self.commentPreview copyWithZone:zone];
        copy.payAmountLimitInfo = [self.payAmountLimitInfo copyWithZone:zone];
        copy.supplierName = [self.supplierName copyWithZone:zone];
        copy.activityIdList = [self.activityIdList copyWithZone:zone];
        copy.activityShowUrl = [self.activityShowUrl copyWithZone:zone];
        copy.freeTax = self.freeTax;
        copy.skuGoodsPropertyList = [self.skuGoodsPropertyList copyWithZone:zone];
        copy.commentCountStr = [self.commentCountStr copyWithZone:zone];
        copy.skuList = [self.skuList copyWithZone:zone];
        copy.commentCount = self.commentCount;
        copy.islike = self.islike;
        copy.singleGoodsActivityType = self.singleGoodsActivityType;
        copy.brandLogoUrl = [self.brandLogoUrl copyWithZone:zone];
        copy.label = [self.label copyWithZone:zone];
        copy.brandName = [self.brandName copyWithZone:zone];
        copy.goodsPropertyList = [self.goodsPropertyList copyWithZone:zone];
        copy.goodsNum = self.goodsNum;
        copy.albumType = self.albumType;
    }
    
    return copy;
}


@end
