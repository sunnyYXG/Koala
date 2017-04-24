//
//  ClassfyBody.h
//
//  Created by   on 17/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ClassfyBody : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *categoryTreeMenuList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
