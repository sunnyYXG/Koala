//
//  HomeTableViewCellFrame.h
//  Kaola
//
//  Created by rongyun on 17/3/31.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModelHandle.h"
/**
 *  数据类型
 */
typedef NS_ENUM(NSUInteger, HomeServiceDataMediaType) {
    /** 一张大图*/
    HomeServiceDataMediaTypeBigImages = 1,
    /** 两张小图*/
    HomeServiceDataMediaTypeLittleImages = 2,
    /** 其他*/
    HomeServiceDataMediaTypeOther = 3,
    
};

/**
 *  数据类型 (cell model)为HomeServiceDataMediaTypeOther 的数据 进行深度分析
 */
typedef NS_ENUM(NSUInteger, HomeServiceDataMediaTypeOtherType) {
    /** 默认*/
    HomeServiceDataMediaTypeOther_TypeDefault = 0,
    /** 没有图片简介*/
    HomeServiceDataMediaTypeOther_TypeNOAny = 1,
    /** 简介使用title*/
    HomeServiceDataMediaTypeOther_TypeTitle = 2,
    /** 简介使用description_1*/
    HomeServiceDataMediaTypeOther_TypeDescription = 3,
    
};

@interface HomeTableViewCellFrame : NSObject{
    Home *_home;
}

/** 数据类型*/
@property (nonatomic, assign) HomeServiceDataMediaType media_type;

@property (nonatomic, assign) HomeServiceDataMediaTypeOtherType info_type;

//+(HomeServiceDataMediaTypeOtherType)HomeCellModelType:(ItemList *)item;

@property (nonatomic)Home *home;
@property (nonatomic)HomeModelHandle *homeModelHandle;
@property (nonatomic)CGRect image_Frame;
@property (nonatomic)CGRect sc_Frame;

/** cell中小图片的frame*/
@property (nonatomic)NSMutableArray *images_Frame;

/** cell中小图片的url*/
@property (nonatomic)NSMutableArray *images_URL;

/** cell中小图片的简介(view)的frame*/
@property (nonatomic)NSMutableArray *InfoS_Frame;

/** cell的高度*/
@property (nonatomic)CGFloat cellHeight;

@end
