//
//  RecommendSkuPropertyList.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendSkuPropertyList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *propertyName;
@property (nonatomic, strong) NSString *propertyValue;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
