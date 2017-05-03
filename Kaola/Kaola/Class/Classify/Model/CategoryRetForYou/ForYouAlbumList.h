//
//  ForYouAlbumList.h
//
//  Created by   on 17/5/3
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ForYouAlbumList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isShowBuyCountInAlbumTitle;
@property (nonatomic, strong) NSString *recReason;
@property (nonatomic, strong) NSString *albumId;
@property (nonatomic, strong) NSArray *goodsUrlList;
@property (nonatomic, assign) double favorNum;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double buyCount;
@property (nonatomic, assign) double productNum;
@property (nonatomic, assign) double albumType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
