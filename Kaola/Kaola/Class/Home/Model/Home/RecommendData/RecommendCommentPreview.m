//
//  RecommendCommentPreview.m
//
//  Created by   on 17/5/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RecommendCommentPreview.h"


NSString *const kRecommendCommentPreviewGoodsCommentId = @"goodsCommentId";
NSString *const kRecommendCommentPreviewAvatarKaola = @"avatarKaola";
NSString *const kRecommendCommentPreviewCommentContent = @"commentContent";
NSString *const kRecommendCommentPreviewGoodsId = @"goodsId";
NSString *const kRecommendCommentPreviewNicknameKaola = @"nicknameKaola";
NSString *const kRecommendCommentPreviewLinkSwitch = @"linkSwitch";


@interface RecommendCommentPreview ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendCommentPreview

@synthesize goodsCommentId = _goodsCommentId;
@synthesize avatarKaola = _avatarKaola;
@synthesize commentContent = _commentContent;
@synthesize goodsId = _goodsId;
@synthesize nicknameKaola = _nicknameKaola;
@synthesize linkSwitch = _linkSwitch;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.goodsCommentId = [self objectOrNilForKey:kRecommendCommentPreviewGoodsCommentId fromDictionary:dict];
            self.avatarKaola = [self objectOrNilForKey:kRecommendCommentPreviewAvatarKaola fromDictionary:dict];
            self.commentContent = [self objectOrNilForKey:kRecommendCommentPreviewCommentContent fromDictionary:dict];
            self.goodsId = [[self objectOrNilForKey:kRecommendCommentPreviewGoodsId fromDictionary:dict] doubleValue];
            self.nicknameKaola = [self objectOrNilForKey:kRecommendCommentPreviewNicknameKaola fromDictionary:dict];
            self.linkSwitch = [[self objectOrNilForKey:kRecommendCommentPreviewLinkSwitch fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsCommentId forKey:kRecommendCommentPreviewGoodsCommentId];
    [mutableDict setValue:self.avatarKaola forKey:kRecommendCommentPreviewAvatarKaola];
    [mutableDict setValue:self.commentContent forKey:kRecommendCommentPreviewCommentContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kRecommendCommentPreviewGoodsId];
    [mutableDict setValue:self.nicknameKaola forKey:kRecommendCommentPreviewNicknameKaola];
    [mutableDict setValue:[NSNumber numberWithBool:self.linkSwitch] forKey:kRecommendCommentPreviewLinkSwitch];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.goodsCommentId = [aDecoder decodeObjectForKey:kRecommendCommentPreviewGoodsCommentId];
    self.avatarKaola = [aDecoder decodeObjectForKey:kRecommendCommentPreviewAvatarKaola];
    self.commentContent = [aDecoder decodeObjectForKey:kRecommendCommentPreviewCommentContent];
    self.goodsId = [aDecoder decodeDoubleForKey:kRecommendCommentPreviewGoodsId];
    self.nicknameKaola = [aDecoder decodeObjectForKey:kRecommendCommentPreviewNicknameKaola];
    self.linkSwitch = [aDecoder decodeBoolForKey:kRecommendCommentPreviewLinkSwitch];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsCommentId forKey:kRecommendCommentPreviewGoodsCommentId];
    [aCoder encodeObject:_avatarKaola forKey:kRecommendCommentPreviewAvatarKaola];
    [aCoder encodeObject:_commentContent forKey:kRecommendCommentPreviewCommentContent];
    [aCoder encodeDouble:_goodsId forKey:kRecommendCommentPreviewGoodsId];
    [aCoder encodeObject:_nicknameKaola forKey:kRecommendCommentPreviewNicknameKaola];
    [aCoder encodeBool:_linkSwitch forKey:kRecommendCommentPreviewLinkSwitch];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendCommentPreview *copy = [[RecommendCommentPreview alloc] init];
    
    if (copy) {

        copy.goodsCommentId = [self.goodsCommentId copyWithZone:zone];
        copy.avatarKaola = [self.avatarKaola copyWithZone:zone];
        copy.commentContent = [self.commentContent copyWithZone:zone];
        copy.goodsId = self.goodsId;
        copy.nicknameKaola = [self.nicknameKaola copyWithZone:zone];
        copy.linkSwitch = self.linkSwitch;
    }
    
    return copy;
}


@end
