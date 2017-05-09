//
//  HomeAusleseCellFrame.m
//  Kaola
//
//  Created by rongyun on 17/5/8.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeAusleseCellFrame.h"

#define top_x_y 10

#define IV_w_h 60

#define lab_h 30

@implementation HomeAusleseCellFrame

-(void)setItem:(HomeItemList *)item{
    if (!item) return;
    _item = item;
    
    _imageFrame = CGRectMake(top_x_y, top_x_y, IV_w_h, IV_w_h);
    _titleFrame = CGRectMake(top_x_y + IV_w_h + 5, top_x_y, SCREEN_WIDTH - top_x_y - IV_w_h - 25, lab_h);
    _descFrame = CGRectMake(CGRectGetMinX(self.titleFrame), CGRectGetMaxY(self.titleFrame), CGRectGetWidth(self.titleFrame), CGRectGetHeight(self.titleFrame));
    _topLineFrame = CGRectMake(top_x_y, 0, SCREEN_WIDTH - 20, 0.5);
    _rightClick = CGRectMake(CGRectGetMaxX(self.titleFrame), CGRectGetMaxY(self.titleFrame) - 7, 15, 15);
    
    _IV_url = [NSURL URLWithString:item.imageUrl];
    _title = item.title;
    _desc = item.desc;
    
    /*
    _IV       = [UIImageView new];
    _titleLab = [UILabel new];
    _descLab  = [UILabel new];
    _topLine  = [UIView new];
    _rightBtn = [UIButton new];
    
    [_IV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(IV_w_h, IV_w_h));
        make.left.equalTo(self).offset(top_x_y);
        make.top.equalTo(self).offset(top_x_y);
    }];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - top_x_y - IV_w_h - 5, lab_h));
        make.left.equalTo(_IV.mas_right).with.offset(5);
        make.top.equalTo(_IV.mas_top);
    }];
    
    [_descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - top_x_y - IV_w_h - 5, lab_h));
        make.left.equalTo(_titleLab.mas_left).with.offset(0);
        make.top.equalTo(_titleLab.mas_bottom).with.offset(0);

    }];
    
    _cellHeight = _descLab.bottom + 10;
     */
    _cellHeight = IV_w_h + 20;

}

@end
