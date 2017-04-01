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
        self.media_type = HomeServiceDataMediaTypeBigImages;
        self.image_Frame = CGRectMake(0, 5, SCREEN_WIDTH , 80);
        self.cellHeight = self.image_Frame.size.height + 10;
        
    }else{

        if (home.itemList.count == 2) {
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
        
        if (home.itemList.count > 2 ) {
            self.media_type = HomeServiceDataMediaTypeOther;
            self.image_Frame = CGRectMake(0, 10, SCREEN_WIDTH , SCREEN_WIDTH * 0.55);
            self.cellHeight = self.image_Frame.size.height *2 - 20;
            self.sc_Frame = CGRectMake(0, self.image_Frame.size.height + self.image_Frame.origin.y, SCREEN_WIDTH, self.cellHeight - SCREEN_WIDTH * 0.55 - 10);
            
            CGFloat w = self.image_Frame.size.width/3 - 10;
            
            for (NSInteger i = 0; i < home.itemList.count; i ++) {
                CGRect frame = CGRectMake(i * w + (i + 1) * 10, 10, w, w);
                NSValue *value = [NSValue valueWithCGRect:frame];
                [self.images_Frame addObject:value];
                ItemList *item = (ItemList *)home.itemList[i];
                if (item.imgUrl == nil) {
                    [self.images_URL addObject:item.logoUrl];
                }else{
                    [self.images_URL addObject:item.imgUrl];
                }
                
                if (i == home.itemList.count - 1 ) {
                    i++;
                    CGRect frame = CGRectMake(i * w + (i + 1) * 10, 10, w, w);
                    NSValue *value = [NSValue valueWithCGRect:frame];
                    [self.images_Frame addObject:value];
                }
            }
            
        }
    }
}

@end
