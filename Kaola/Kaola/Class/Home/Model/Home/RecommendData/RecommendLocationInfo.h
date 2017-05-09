//
//  RecommendLocationInfo.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendLocationInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dwIdentificationInfo;
@property (nonatomic, strong) NSString *recIdentificationInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
