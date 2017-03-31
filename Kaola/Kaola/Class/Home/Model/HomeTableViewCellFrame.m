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

    for (ItemList *item in home.itemList) {
//        DDLog(@"ddd%@",item);
    }
    DDLog(@"ddd%ld",home.itemList.count);

    self.cellHeight = 180;
    if (home.itemList.count == 0) {
        self.media_type = HomeServiceDataMediaTypeBigImages;
        
        self.IVFrame = CGRectMake(0, 10, SCREEN_WIDTH - 20, 100);
        self.cellHeight = _IVFrame.size.height;
        
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
        
        }
    }
//    _IVFrame = CGRectMake(0, 10, SCREEN_WIDTH, 100);
    
}

@end
