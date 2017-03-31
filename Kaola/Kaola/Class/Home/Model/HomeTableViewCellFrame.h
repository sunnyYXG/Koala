//
//  HomeTableViewCellFrame.h
//  Kaola
//
//  Created by rongyun on 17/3/31.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface HomeTableViewCellFrame : NSObject{
    Home *_home;
}

/** 数据类型*/
@property (nonatomic, assign) HomeServiceDataMediaType media_type;

@property (nonatomic)Home *home;

//子菜单
@property (nonatomic)CGRect IVFrame;

@property (nonatomic)NSMutableArray *IVSFrame;
@property (nonatomic)NSMutableArray *images;


@property (nonatomic)CGFloat cellHeight;

@end
