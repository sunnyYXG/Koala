//
//  ItemList.h
//
//  Created by sunny_FX  on 2017/3/31
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *description2;
@property (nonatomic, assign) double propertyShowType;
@property (nonatomic, strong) NSString *description1;
@property (nonatomic, assign) double originalPrice;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *imgUrlList;
@property (nonatomic, strong) NSString *averagePriceLable;
@property (nonatomic, assign) double productgrade;
@property (nonatomic, assign) double itemListSelf;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, assign) double showColorCard;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double brandId;
@property (nonatomic, assign) double itemListIdentifier;
@property (nonatomic, assign) double onlineStatus;
@property (nonatomic, strong) NSString *linkUrl;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *smallSingleActivityLabelUrl;
@property (nonatomic, assign) double currentPrice;
@property (nonatomic, assign) double actualStorageStatus;
@property (nonatomic, strong) NSArray *appImgUrlList;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double isAppPriceOnlyLabel;
@property (nonatomic, strong) NSString *goodsNumLabel;
@property (nonatomic, strong) NSString *customLabel;
@property (nonatomic, strong) NSString *introduce;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
