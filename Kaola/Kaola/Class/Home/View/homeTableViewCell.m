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
//    for (UIView *view in self.subviews) {
//        if (view) {
//            [view removeFromSuperview];
//        }
//    }

    _cellFrame = cellFrame;
    self.home = cellFrame.home;
//    self.backgroundColor = [UIColor orangeColor];

    if (cellFrame.media_type == 1) {
        [self HomeServiceDataMediaTypeBigImages:cellFrame.image_Frame url:self.home.imageUrl];

    }else if (cellFrame.media_type == 2) {
        [self HomeServiceDataMediaTypeLittleImages:self.home images_Frame:cellFrame.images_Frame images_URL:cellFrame.images_URL];
        
    }else if (cellFrame.media_type == 3){
        [self HomeServiceDataMediaTypeOther:cellFrame url:self.home.imageUrl];

    }
    
}

-(void)HomeServiceDataMediaTypeBigImages:(CGRect)frame url:(NSString *)url{

    UITapGestureRecognizer *tap = [self createTapWtirhAction:@selector(BigImagesTap:)];
    UIImageView *IV = [self createIVWIthFrame:frame imageUrl:url tag:0 tap:tap];
    [self addSubview:IV];
}

-(void)HomeServiceDataMediaTypeLittleImages:(Home *)home images_Frame:(NSArray *)images_Frame images_URL:(NSArray *)images_URL{
    for (NSInteger i = 0; i < home.itemList.count; i++) {
        
        NSValue *value = images_Frame[i];
        CGRect rect = [value CGRectValue];
        
        UITapGestureRecognizer *tap = [self createTapWtirhAction:@selector(LittleImagesTap:)];
        UIImageView *IV = [self createIVWIthFrame:rect imageUrl:images_URL[i] tag:i tap:tap];
        [self addSubview:IV];
        
        ItemList *item = (ItemList *)home.itemList[i];
        [self.links_URL addObject:item.linkUrl];
    }
}

-(void)HomeServiceDataMediaTypeOther:(HomeTableViewCellFrame *)cellFrame url:(NSString *)url{
    UITapGestureRecognizer *tap = [self createTapWtirhAction:@selector(BigImagesTap:)];

    CGFloat w = SCREEN_WIDTH/3 - 10;
    self.sc.frame = cellFrame.sc_Frame;
    [self addSubview:self.sc];
    
    UIImageView *IV = [self createIVWIthFrame:cellFrame.image_Frame imageUrl:url tag:0 tap:tap];
    [self addSubview:IV];
    
    for (NSInteger i = 0; i < cellFrame.images_Frame.count; i++) {
        
        NSValue *value = cellFrame.images_Frame[i];
        CGRect rect = [value CGRectValue];
        
        UITapGestureRecognizer *tap = [self createTapWtirhAction:@selector(LittleImagesTap:)];
        UIImageView *IV = [self createIVWIthFrame:rect imageUrl:nil tag:i tap:tap];
        [self.sc addSubview:IV];
        
        if (i == cellFrame.images_Frame.count - 1) {
            IV.image = [UIImage imageNamed:@"SeeMore"];
        }else{
            
            [IV sd_setImageWithURL:[NSURL URLWithString:cellFrame.images_URL[i]] placeholderImage:nil];
            if (cellFrame.info_type != 1) {
                UIView *ItemView = [[UIView alloc]initWithFrame:[cellFrame.InfoS_Frame[i] CGRectValue]];
                [self.sc addSubview:ItemView];
                
                [self configIntroduce:(ItemList *)self.home.itemList[i] ItemView:ItemView infoType:cellFrame.info_type];
            }
        }
        [self.links_URL addObject:self.home.linkUrl];
        
    }
    
    [self.sc setContentSize:CGSizeMake(cellFrame.images_Frame.count * (w + 10) + 10, cellFrame.cellHeight - SCREEN_WIDTH * 0.55 - 10)];
}

- (void)configIntroduce:(ItemList *)item ItemView:(UIView *)ItemView infoType:(HomeServiceDataMediaTypeOtherType)data_type{
    switch (data_type) {
        case 2:
            [self HomeServiceDataMediaTypeOther_TypeTitle:item ItemView:ItemView];
            break;
        case 3:
            [self HomeServiceDataMediaTypeOther_TypeDescription:item ItemView:ItemView];
            break;
            
        default:
            break;
    }
    
}

- (void)HomeServiceDataMediaTypeOther_TypeDescription:(ItemList *)item ItemView:(UIView *)ItemView{
    
    UILabel *label = [Factory createLabelWithTitle:item.description1 frame:CGRectMake(0, 0, ItemView.width, ItemView.height - 20)];
    label.textAlignment = NSTextAlignmentCenter;
    [ItemView addSubview:label];
}

- (void)HomeServiceDataMediaTypeOther_TypeTitle:(ItemList *)item ItemView:(UIView *)ItemView{
    NSString *goods = @"";
    if (item.goodsNumLabel) {
        goods = item.goodsNumLabel;
    }
    UILabel *label = [Factory createLabelWithTitle:[NSString stringWithFormat:@"%@%@",goods,item.title] frame:CGRectMake(0, 0, ItemView.width, ItemView.height - 40)];
    label.numberOfLines = 2;
    [ItemView addSubview:label];
    [HelperTools setTextColor:label AndRange:NSMakeRange(0, goods.length) AndColor:ColorFromRGB(255, 133, 131)];
    
    NSString *currentPrice = [NSString stringWithFormat:@"¥%.0f",item.currentPrice];
    NSString *originalPrice = [NSString stringWithFormat:@"¥%.0f",item.originalPrice];

    UILabel *Price = [Factory createLabelWithTitle:[NSString stringWithFormat:@"%@ %@",currentPrice,originalPrice] frame:CGRectMake(0, label.bottom, ItemView.width,20)];
    Price.textAlignment = NSTextAlignmentCenter;
    [ItemView addSubview:Price];

    [HelperTools setTextColor:Price AndRange:NSMakeRange(0, currentPrice.length) AndColor:ColorFromRGB(198, 36, 17)];
    [HelperTools setTextColor:Price AndRange:NSMakeRange(currentPrice.length + 1, originalPrice.length) AndColor:ColorFromRGB(146, 146, 146) AndFont:12];
    
}


- (void)BigImagesTap:(UITapGestureRecognizer *)tap {
    NSString *url = self.home.linkUrl;
    if ([self.delegate respondsToSelector:@selector(pushBannerWebViewWithURL:)]) {
        [self.delegate pushBannerWebViewWithURL:url];
    }

}
- (void)LittleImagesTap:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)[self.sc viewWithTag:tap.view.tag];
    NSString *url = self.links_URL[imageView.tag];
    if ([self.delegate respondsToSelector:@selector(pushBannerWebViewWithURL:)]) {
        [self.delegate pushBannerWebViewWithURL:url];
    }
    
}

-(UITapGestureRecognizer *)createTapWtirhAction:(nullable SEL)action{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
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
