//
//  homeTableViewCell.m
//  Kaola
//
//  Created by rongyun on 17/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "homeTableViewCell.h"
#import "HomeTableViewCellFrame.h"
#import "BannerViewController.h"

@implementation homeTableViewCell

-(UIScrollView *)sc{
    if (!_sc) {
        _sc = [[UIScrollView alloc]init];
        _sc.showsHorizontalScrollIndicator = FALSE;//水平滚动条是否显示
        _sc.backgroundColor = [UIColor whiteColor];
        _sc.userInteractionEnabled = YES;
    }
    return _sc;
}
-(Home *)home{
    if (!_home) {
        _home = [[Home alloc]init];
    }
    return _home;
}
-(NSMutableArray *)links_URL{
    if (!_links_URL) {
        _links_URL = [[NSMutableArray alloc]init];
    }
    return _links_URL;
}

-(void)setCellFrame:(HomeTableViewCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) {
        return ;
    }
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OptionImageIsTap:)];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;

    _cellFrame = cellFrame;
    self.home = cellFrame.home;
    if (cellFrame.media_type == 1) {

        UIImageView *IV = [self createIVWIthFrame:cellFrame.image_Frame imageUrl:self.home.imageUrl tag:0 tap:tap];
        [self addSubview:IV];

    }else if (cellFrame.media_type == 2) {
        for (NSInteger i = 0; i < self.home.itemList.count; i++) {
            
            NSValue *value = cellFrame.images_Frame[i];
            CGRect rect = [value CGRectValue];

            UITapGestureRecognizer *tap = [self createTap];
            UIImageView *IV = [self createIVWIthFrame:rect imageUrl:cellFrame.images_URL[i] tag:i tap:tap];
            [self addSubview:IV];

            ItemList *item = (ItemList *)self.home.itemList[i];
            [self.links_URL addObject:item.linkUrl];
        }
    }else if (cellFrame.media_type == 3){
        CGFloat w = SCREEN_WIDTH/3 - 10;
        self.sc.frame = cellFrame.sc_Frame;
        [self addSubview:self.sc];
        
        UIImageView *IV = [self createIVWIthFrame:cellFrame.image_Frame imageUrl:self.home.imageUrl tag:0 tap:tap];
        [self addSubview:IV];

        for (NSInteger i = 0; i < cellFrame.images_Frame.count; i++) {
            
            NSValue *value = cellFrame.images_Frame[i];
            CGRect rect = [value CGRectValue];
            
            UITapGestureRecognizer *tap = [self createTap];
            UIImageView *IV = [self createIVWIthFrame:rect imageUrl:nil tag:i tap:tap];
            [self.sc addSubview:IV];
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(IV.left, IV.bottom + 10, IV.width, self.sc.height - IV.height - 10)];
            view.backgroundColor = [UIColor orangeColor];
            if (i == cellFrame.images_Frame.count - 1) {
                IV.image = [UIImage imageNamed:@"Class"];
            }else{
                [IV sd_setImageWithURL:[NSURL URLWithString:cellFrame.images_URL[i]] placeholderImage:nil];
                [self.sc addSubview:view];
            }
            [self.links_URL addObject:self.home.linkUrl];

        }
        
        [self.sc setContentSize:CGSizeMake(cellFrame.images_Frame.count * (w + 10) + 10, cellFrame.cellHeight - SCREEN_WIDTH * 0.55 - 10)];


    }
    
}
- (void)OptionImageIsTap:(UITapGestureRecognizer *)tap {
    NSString *url = self.home.linkUrl;
    if ([self.delegate respondsToSelector:@selector(pushBannerWebViewWithURL:)]) {
        [self.delegate pushBannerWebViewWithURL:url];
    }

}
- (void)OptionImageIsTap1:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)[self.sc viewWithTag:tap.view.tag];
    NSString *url = self.links_URL[imageView.tag];
    if ([self.delegate respondsToSelector:@selector(pushBannerWebViewWithURL:)]) {
        [self.delegate pushBannerWebViewWithURL:url];
    }
    
}

-(UITapGestureRecognizer *)createTap{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OptionImageIsTap1:)];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    return tap;
}

-(UIImageView *)createIVWIthFrame:(CGRect)frame imageUrl:(NSString *)url tag:(NSInteger)tag tap:(UITapGestureRecognizer *)tap{
    UIImageView *IV = [[UIImageView alloc]initWithFrame:frame];
    [IV sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    IV.tag = tag;
    IV.userInteractionEnabled = YES;
    [IV addGestureRecognizer:tap];
    return IV;


}

@end
