//
//  LocationInfo.h
//
//  Created by   on 17/3/30
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LocationInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dwIdentificationInfo;
@property (nonatomic, strong) NSString *recIdentificationInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
