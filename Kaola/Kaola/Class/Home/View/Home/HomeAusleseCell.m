//
//  HomeOtherCell.m
//  Kaola
//
//  Created by rongyun on 17/4/1.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeAusleseCell.h"
#import "HomeAusleseCellFrame.h"
#import "HomeAusleseDataModels.h"

@implementation HomeAusleseCell

-(void)createView:(NSString *)title{
    
//    for (UIView *view in self.subviews) {
//        if (view) {
//            [view removeFromSuperview];
//        }
//    }

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, self.height - 20)];
    [self addSubview:label];
    label.backgroundColor = [UIColor orangeColor];
    label.text = title;
    
}

-(void)setCellFrame:(HomeAusleseCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) return;
    _cellFrame = cellFrame;
    
    _IV       = [UIImageView new];
    _titleLab = [UILabel new];
    _descLab  = [UILabel new];
    _topLine  = [UIView new];
    _rightBtn = [UIButton new];
    
    [self addSubview:_IV];
    [self addSubview:_titleLab];
    [self addSubview:_descLab];
    [self addSubview:_topLine];
    [self addSubview:_rightBtn];
    
    _IV.frame = cellFrame.imageFrame;
    _titleLab.frame = cellFrame.titleFrame;
    _descLab.frame = cellFrame.descFrame;
    _topLine.frame = cellFrame.topLineFrame;
    _rightBtn.frame = cellFrame.rightClick;
    
    _topLine.backgroundColor = UIColorFromRGB(219, 219, 219);
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"right_row"] forState:UIControlStateNormal];
    
    [_IV sd_setImageWithURL:cellFrame.IV_url];
    _titleLab.text = cellFrame.title;
    
    //处理html数据
    if( cellFrame.desc.length > 0 ){
        NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[cellFrame.desc dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        
        _descLab.attributedText = attrStr;;
        
    }

//    _IV.backgroundColor = [UIColor orangeColor];
//    _titleLab.backgroundColor = [UIColor redColor];
//    _descLab.backgroundColor = [UIColor grayColor];
}

@end
