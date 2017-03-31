//
//  homeTableViewCell.m
//  Kaola
//
//  Created by rongyun on 17/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "homeTableViewCell.h"
#import "HomeTableViewCellFrame.h"
@implementation homeTableViewCell


-(void)setCellFrame:(HomeTableViewCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) {
        return ;
    }
    for (UIView *view in self.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }

    _cellFrame = cellFrame;
    Home *home = cellFrame.home;

    if (cellFrame.media_type == 1) {
        UIImageView *IV = [[UIImageView alloc]initWithFrame:cellFrame.IVFrame];
        [IV sd_setImageWithURL:[NSURL URLWithString:home.imageUrl] placeholderImage:nil];
        [self addSubview:IV];
    }else if (cellFrame.media_type == 2) {
        for (NSInteger i = 0; i < home.itemList.count; i++) {
            NSValue *value = cellFrame.IVSFrame[i];
            CGRect rect = [value CGRectValue];
            UIImageView *IV = [[UIImageView alloc]initWithFrame:rect];
            [IV sd_setImageWithURL:[NSURL URLWithString:cellFrame.images[i]] placeholderImage:nil];
            [self addSubview:IV];

        }
    }else if (cellFrame.media_type == 3){
        CGFloat w = SCREEN_WIDTH/3 - 10;
        UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH * 0.55, SCREEN_WIDTH,cellFrame.cellHeight - SCREEN_WIDTH * 0.55)];
        sc.showsHorizontalScrollIndicator = FALSE;//水平滚动条是否显示
        [self addSubview:sc];
        UIImageView *IV = [[UIImageView alloc]initWithFrame:cellFrame.IVFrame];
        [IV sd_setImageWithURL:[NSURL URLWithString:home.imageUrl] placeholderImage:nil];
        [self addSubview:IV];
        
        for (NSInteger i = 0; i < cellFrame.images.count; i++) {
            NSValue *value = cellFrame.IVSFrame[i];
            CGRect rect = [value CGRectValue];
            UIImageView *IV = [[UIImageView alloc]initWithFrame:rect];
            [IV sd_setImageWithURL:[NSURL URLWithString:cellFrame.images[i]] placeholderImage:nil];
            [sc addSubview:IV];
            
        }
        
        [sc setContentSize:CGSizeMake(cellFrame.images.count * (w + 10) + 10, cellFrame.cellHeight - SCREEN_WIDTH * 0.55)];//SCREEN_WIDTH * 0.55 + 10


    }
    
}
@end
