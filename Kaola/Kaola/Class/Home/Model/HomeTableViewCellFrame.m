//
//  HomeTableViewCellFrame.m
//  Kaola
//
//  Created by rongyun on 17/3/31.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeTableViewCellFrame.h"

@implementation HomeTableViewCellFrame

-(NSMutableArray *)images_Frame{
    if (!_images_Frame) {
        _images_Frame = [[NSMutableArray alloc]init];
    }
    return _images_Frame;
}
-(NSMutableArray *)InfoS_Frame{
    if (!_InfoS_Frame) {
        _InfoS_Frame = [[NSMutableArray alloc]init];
    }
    return _InfoS_Frame;
}

-(NSMutableArray *)images_URL{
    if (!_images_URL) {
        _images_URL = [[NSMutableArray alloc]init];
    }
    return _images_URL;
}
-(void)setHome:(Home *)home{
    
    if (home == nil) return;
    _home = home;

    if (home.itemList.count == 0) {
        [self HomeServiceDataMediaTypeBigImages];
    }else{
        if (home.itemList.count == 2) {
            [self HomeServiceDataMediaTypeLittleImages:home];
        }
        if (home.itemList.count > 2 ) {
            [self HomeServiceDataMediaTypeOther:home];
        }
    }
}

- (void)HomeServiceDataMediaTypeBigImages{
    self.media_type = HomeServiceDataMediaTypeBigImages;
    
    self.image_Frame = CGRectMake(0, 5, SCREEN_WIDTH , 80);
    self.cellHeight = self.image_Frame.size.height + 10;
}

- (void)HomeServiceDataMediaTypeLittleImages:(Home *)home{
    self.media_type = HomeServiceDataMediaTypeLittleImages;
    
    for (NSInteger i = 0; i < home.itemList.count; i ++) {
        CGRect frame = CGRectMake(i * SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 100);
        NSValue *value = [NSValue valueWithCGRect:frame];
        [self.images_Frame addObject:value];
        ItemList *item = (ItemList *)home.itemList[i];
        [self.images_URL addObject:item.imgUrl];
    }
    self.cellHeight = 100;
}

- (void)HomeServiceDataMediaTypeOther:(Home *)home{
    self.media_type = HomeServiceDataMediaTypeOther;
    self.info_type = HomeServiceDataMediaTypeOther_TypeDefault;
    
    self.image_Frame = CGRectMake(0, 10, SCREEN_WIDTH , SCREEN_WIDTH * 0.55);
    self.cellHeight = self.image_Frame.size.height * 2 - 20;
    self.sc_Frame = CGRectMake(0, self.image_Frame.size.height + self.image_Frame.origin.y, SCREEN_WIDTH, self.cellHeight - SCREEN_WIDTH * 0.55 - 10);
    
    CGFloat w = self.image_Frame.size.width/3 - 10;

    //小图片的数据类型 是否有简介 以及简介的取值内容
    self.info_type = [self HomeCellModelType:(ItemList *)[home.itemList firstObject] h:self.sc_Frame.size.height - w - 10];

    for (NSInteger i = 0; i < home.itemList.count; i ++) {
        //cell中小图片的frame
        CGRect frame = CGRectMake(i * w + (i + 1) * 10, 10, w, w);
        NSValue *value = [NSValue valueWithCGRect:frame];
        [self.images_Frame addObject:value];
        
        //cell中小图片的简介(view)的frame
        UIView *IV = [[UIView alloc]initWithFrame:frame];
        CGRect InfoFrame = CGRectMake(IV.left, IV.bottom + 10, IV.width, self.sc_Frame.size.height - IV.height - 10);
        NSValue *InfoValue = [NSValue valueWithCGRect:InfoFrame];
        [self.InfoS_Frame addObject:InfoValue];
        
        //cell中小图片的url
        ItemList *item = (ItemList *)home.itemList[i];
//        if (item.imgUrl == nil) {
//            [self.images_URL addObject:item.logoUrl];
//        }else{
            [self.images_URL addObject:item.imgUrl];
//        }
        
        
        if (i == home.itemList.count - 1 ) {
            i++;
            CGRect frame = CGRectMake(i * w + (i + 1) * 10, 10, w, w);
            NSValue *value = [NSValue valueWithCGRect:frame];
            [self.images_Frame addObject:value];
        }
        
    }

}


- (HomeServiceDataMediaTypeOtherType)HomeCellModelType:(ItemList *)item h:(CGFloat)h{
    
    if (item.description1) {
        if ( item.description1.length == 0) {
            self.cellHeight = self.cellHeight - h;
            self.sc_Frame = CGRectMake(0, self.image_Frame.size.height + self.image_Frame.origin.y, SCREEN_WIDTH, self.cellHeight - SCREEN_WIDTH * 0.55 - 10);

            return HomeServiceDataMediaTypeOther_TypeNOAny;
            
        } else {
            return HomeServiceDataMediaTypeOther_TypeDescription;
            
        }
    }else{
        self.cellHeight = self.cellHeight + 20;
        self.sc_Frame = CGRectMake(0, self.image_Frame.size.height + self.image_Frame.origin.y, SCREEN_WIDTH, self.cellHeight - SCREEN_WIDTH * 0.55 - 10);

        return HomeServiceDataMediaTypeOther_TypeTitle;
        
    }
}


@end
