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
    [self addSubview:titleLab];

    if (section == 0) {
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
