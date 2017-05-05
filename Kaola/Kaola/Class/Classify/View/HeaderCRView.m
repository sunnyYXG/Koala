//
//  HeaderCRView.m
//  Kaola
//
//  Created by rongyun on 17/5/3.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HeaderCRView.h"
#import "ForYouDataModels.h"

@implementation HeaderCRView

-(void)configureData:(ForYouTopBanner *)banner section:(NSInteger)section sectionTitle:(NSString *)title{
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text = title;
    titleLab.textColor = UIColorFromRGB(46, 46, 46);
    [titleLab setFont:[UIFont systemFontOfSize:16.0f]];
    [self addSubview:titleLab];

//    self.backgroundColor = [UIColor orangeColor];
//    titleLab.backgroundColor = [UIColor redColor];
    
     UIView *line = [UIView new];
     line.backgroundColor = UIColorFromRGB(219, 219, 219);
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.width - 10, 0.5));
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).with.offset(0);
        
    }];

    if (section == 0) {
        line.hidden = YES;
        UIImageView *IV = [[UIImageView alloc]init];
        [IV sd_setImageWithURL:[NSURL URLWithString:banner.activityPic]];
        [self addSubview:IV];
        

        [IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.edges.mas_offset(UIEdgeInsetsMake(10, 10, 60, 10));
        }];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(IV.width, 30));
            make.left.equalTo(IV.mas_left);
            make.right.equalTo(IV.mas_right);
            make.top.equalTo(IV.mas_bottom).with.offset(20);

        }];

    }else{
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.edges.mas_offset(UIEdgeInsetsMake(10, 10, 10, 10));
        }];

    }
}

@end
