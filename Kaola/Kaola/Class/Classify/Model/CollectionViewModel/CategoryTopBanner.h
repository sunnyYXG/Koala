//
//  CategoryTopBanner.h
//
//  Created by   on 17/4/26
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CategoryTopBanner : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *activityName;
@property (nonatomic, strong) NSString *activityPic;
@property (nonatomic, strong) NSString *activityUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
