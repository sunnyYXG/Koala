//
//  KLDiscoveryTabView.h
//
//  Created by   on 17/5/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface KLDiscoveryTabView : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *apiTail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
