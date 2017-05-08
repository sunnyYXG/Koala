//
//  HomeItemList.h
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomeItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double itemId;
@property (nonatomic, strong) NSString *recReason;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) double albumType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
