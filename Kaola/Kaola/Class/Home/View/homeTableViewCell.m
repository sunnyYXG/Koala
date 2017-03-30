//
//  homeTableViewCell.m
//  Kaola
//
//  Created by rongyun on 17/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "homeTableViewCell.h"

@implementation homeTableViewCell

-(void)initConfigWithData:(NSInteger)row{
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }
    UILabel *label = [Factory createLabelWithTitle:[NSString stringWithFormat:@"这是第%ld行",row] frame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 80)];
//    label.backgroundColor = [UIColor orangeColor];
    [self addSubview:label];
}
@end
