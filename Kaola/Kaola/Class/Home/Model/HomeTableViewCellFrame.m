//
//  HomeTableViewCellFrame.m
//  Kaola
//
//  Created by rongyun on 17/3/31.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "HomeTableViewCellFrame.h"

@implementation HomeTableViewCellFrame

-(NSMutableArray *)IVSFrame{
    if (!_IVSFrame) {
        _IVSFrame = [[NSMutableArray alloc]init];
    }
    return _IVSFrame;
}

-(NSMutableArray *)images{
    if (!_images) {
        _images = [[NSMutableArray alloc]init];
    }
    return _images;
}

-(void)setHome:(Home *)home{
    
    if (home == nil) return;
    _home = home;

    if (home.itemList.count == 0) {
        self.media_type = HomeServiceDataMediaTypeBigImages;
        self.IVFrame = CGRectMake(0, 5, SCREEN_WIDTH , 80);
        self.cellHeight = self.IVFrame.size.height + 10;
        
    }else{

        if (home.itemList.count == 2) {
            self.media_type = HomeServiceDataMediaTypeLittleImages;
            for (NSInteger i = 0; i < home.itemList.count; i ++) {
                CGRect frame = CGRectMake(i * SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 100);
                NSValue *value = [NSValue valueWithCGRect:frame];
                [self.IVSFrame addObject:value];
                ItemList *item = (ItemList *)home.itemList[i];
                [self.images addObject:item.imgUrl];
            }
            self.cellHeight = 100;
        }
        
        if (home.itemList.count > 2 ) {
            self.media_type = HomeServiceDataMediaTypeOther;
            self.IVFrame = CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_WIDTH * 0.55);

            CGFloat w = self.IVFrame.size.width/3 - 10;

            for (NSInteger i = 0; i < home.itemList.count; i ++) {
                CGRect frame = CGRectMake(i * w + (i + 1) * 10, 10, w, w);
                NSValue *value = [NSValue valueWithCGRect:frame];
                [self.IVSFrame addObject:value];
                ItemList *item = (ItemList *)home.itemList[i];
                if (item.imgUrl == nil) {
                    [self.images addObject:item.logoUrl];

                }else{
                    [self.images addObject:item.imgUrl];
                }
            }
            self.cellHeight = self.IVFrame.size.height *2 - 30;
        
        }
    }
}

@end
