//
//  RecommendZhengdanActivity.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendZhengdanActivity : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *activityTitle;
@property (nonatomic, strong) NSString *activityUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
