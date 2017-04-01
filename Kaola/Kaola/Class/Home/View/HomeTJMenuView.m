//
//  HomeTJMenuView.m
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeTJMenuView.h"

@implementation HomeTJMenuView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createView];
    }
    return self;
}
-(void)createView{
    for (NSInteger i = 0; i < 5; i ++) {
        UIView *view = [[UIView alloc]init];
        [self addSubview:view];

        CGFloat w = (self.width-60)/5;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i * (w + 10) + 10);
            make.top.mas_equalTo(10);
            make.width.mas_equalTo(w);
            make.height.mas_equalTo(self.height - 20);
        }];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, self.height - 20)];
        [button setImage:[UIImage imageNamed:@"home_press"] forState:UIControlStateNormal];
        [button setTitle:@"请点击" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12.f] ;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, button.width/4 + 5,button.height/2,button.width/4 + 5);
        button.titleEdgeInsets = UIEdgeInsetsMake(button.height/2,-(button.width/3 + 5), 0,0);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [view addSubview:button];
    }
}
@end
