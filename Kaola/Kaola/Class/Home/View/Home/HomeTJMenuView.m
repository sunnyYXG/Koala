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
    }
    return self;
}

-(void)setMenus:(NSArray *)menus{
    for (NSInteger i = 0; i < menus.count; i ++) {
        UIView *view = [[UIView alloc]init];
        [self addSubview:view];
        
        CGFloat w = (self.width-60)/5;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i * (w + 10) + 10);
            make.top.mas_equalTo(10);
            make.width.mas_equalTo(w);
            make.height.mas_equalTo(self.height - 20);
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Html5ImageIsTap:)];
        tap.numberOfTouchesRequired = 1;
        tap.numberOfTapsRequired = 1;
        tap.delegate = self;

        
        UIImageView *IV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, w, self.height - 20)];
        IV.tag = 100 + i;
        IV.userInteractionEnabled = YES;
        [IV addGestureRecognizer:tap];
//        IV.image = [UIImage imageNamed:menus[i]];
        [IV sd_setImageWithURL:menus[i]];
        
        [view addSubview:IV];
    }

}


- (void)Html5ImageIsTap:(UITapGestureRecognizer *)tap {
    
    NSString *url = self.h5_urls[tap.view.tag - 100];
    if ([self.delegate respondsToSelector:@selector(pushWebViewWithURL:)]) {
        [self.delegate pushWebViewWithURL:url];
    }
    
}

@end
