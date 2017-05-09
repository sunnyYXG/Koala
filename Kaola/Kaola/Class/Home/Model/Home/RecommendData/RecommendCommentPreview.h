//
//  RecommendCommentPreview.h
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecommendCommentPreview : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *goodsCommentId;
@property (nonatomic, strong) NSString *avatarKaola;
@property (nonatomic, strong) NSString *commentContent;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, strong) NSString *nicknameKaola;
@property (nonatomic, assign) BOOL linkSwitch;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
