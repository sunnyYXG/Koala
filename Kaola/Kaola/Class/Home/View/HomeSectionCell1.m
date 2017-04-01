//
//  HomeOtherCell.m
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeSectionCell1.h"

@implementation HomeSectionCell1

-(void)createView:(NSInteger)row{
    
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, self.height - 20)];
    [self addSubview:label];
    label.backgroundColor = [UIColor orangeColor];
    label.text = [NSString stringWithFormat:@"zheshi==%ld",row];
    
}

@end
