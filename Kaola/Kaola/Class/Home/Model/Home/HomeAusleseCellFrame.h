//
//  HomeAusleseCellFrame.h
//  Kaola
//
//  Created by rongyun on 17/5/8.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeAusleseDataModels.h"

@interface HomeAusleseCellFrame : NSObject

@property (nonatomic) HomeItemList *item;

@property (nonatomic) CGRect imageFrame;
@property (nonatomic) CGRect titleFrame;
@property (nonatomic) CGRect descFrame;
@property (nonatomic) CGRect topLineFrame;
@property (nonatomic) CGRect rightClick;

@property (nonatomic) NSURL *IV_url;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *desc;

/*
@property (nonatomic) UIImageView *IV;
@property (nonatomic) UILabel *titleLab;
@property (nonatomic) UILabel *descLab;
@property (nonatomic) UIView *topLine;
@property (nonatomic) UIButton *rightBtn;
*/
/** cell的高度*/
@property (nonatomic)CGFloat cellHeight;

@end
