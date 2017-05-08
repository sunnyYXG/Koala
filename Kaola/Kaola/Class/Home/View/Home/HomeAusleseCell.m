//
//  HomeOtherCell.m
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeAusleseCell.h"

@implementation HomeAusleseCell

-(void)createView:(NSString *)title{
    
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, self.height - 20)];
    [self addSubview:label];
    label.backgroundColor = [UIColor orangeColor];
    label.text = title;
    
}

@end
