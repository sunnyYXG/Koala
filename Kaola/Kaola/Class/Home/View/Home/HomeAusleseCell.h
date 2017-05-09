//
//  HomeOtherCell.h
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
@class HomeAusleseCellFrame,HomeItemList;

@interface HomeAusleseCell : BaseTableViewCell


- (void)createView:(NSString *)title;

@property (nonatomic) HomeAusleseCellFrame *cellFrame;
@property (nonatomic) HomeItemList *item;


@property (nonatomic) UIImageView *IV;
@property (nonatomic) UILabel *titleLab;
@property (nonatomic) UILabel *descLab;
@property (nonatomic) UIView *topLine;
@property (nonatomic) UIButton *rightBtn;

@end
