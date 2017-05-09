//
//  RecommendHome.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendLocationInfo, RecommendCommentPreview;

@interface RecommendHome : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *zhengdanActivity;
@property (nonatomic, strong) NSString *viewCode;
@property (nonatomic, assign) double freeTaxMaxAmount;
@property (nonatomic, assign) double preSale;
@property (nonatomic, strong) NSString *singleGoodsActivityLabel;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, strong) NSArray *zhengdanRulesStr;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double importType;
@property (nonatomic, assign) double currentPrice;
@property (nonatomic, assign) double showColorCard;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSArray *imgUrlList;
@property (nonatomic, assign) double zhengdanActivityType;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, assign) double isTax;
@property (nonatomic, strong) RecommendLocationInfo *locationInfo;
@property (nonatomic, strong) NSArray *albumGoodsList;
@property (nonatomic, strong) NSString *shippingFrom;
@property (nonatomic, strong) NSString *flagUrl;
@property (nonatomic, assign) double actualStorageStatus;
@property (nonatomic, assign) NSInteger payAmountLimit;
@property (nonatomic, assign) double brandId;
@property (nonatomic, assign) double followNum;
@property (nonatomic, assign) double onlineStatus;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSString *taxTag;
@property (nonatomic, assign) double itemType;
@property (nonatomic, assign) double buyerNum;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double originalPrice;
@property (nonatomic, assign) double isAppPriceOnlyLabel;
@property (nonatomic, strong) NSString *smallSingleActivityLabelUrl;
@property (nonatomic, assign) double styleType;
@property (nonatomic, assign) double albumInfoShowType;
@property (nonatomic, strong) NSArray *appImgUrlList;
@property (nonatomic, strong) NSString *taxLabel;
@property (nonatomic, assign) double isShowCart;
@property (nonatomic, strong) NSString *recReason;
@property (nonatomic, assign) double isPayTax;
@property (nonatomic, strong) NSArray *appActivityTitleList;
@property (nonatomic, strong) NSString *singleActivityLabelUrl;
@property (nonatomic, strong) NSString *taxExplanation;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) RecommendCommentPreview *commentPreview;
@property (nonatomic, strong) NSString *payAmountLimitInfo;
@property (nonatomic, strong) NSString *supplierName;
@property (nonatomic, strong) NSArray *activityIdList;
@property (nonatomic, strong) NSString *activityShowUrl;
@property (nonatomic, assign) double freeTax;
@property (nonatomic, strong) NSArray *skuGoodsPropertyList;
@property (nonatomic, strong) NSString *commentCountStr;
@property (nonatomic, strong) NSArray *skuList;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, assign) double islike;
@property (nonatomic, assign) double singleGoodsActivityType;
@property (nonatomic, strong) NSString *brandLogoUrl;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSArray *goodsPropertyList;
@property (nonatomic, assign) double goodsNum;
@property (nonatomic, assign) double albumType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
