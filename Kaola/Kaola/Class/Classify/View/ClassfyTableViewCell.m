//
//  ClassfyTableViewCell.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ClassfyTableViewCell.h"
#import "ClassfyCategoryTreeMenuList.h"

@implementation ClassfyTableViewCell

-(void)setTreeMenuList:(ClassfyCategoryTreeMenuList *)TreeMenuList{
    self.title = [Factory createLabelWithTitle:TreeMenuList.title frame:CGRectMake(10, 10, 80, 20) fontSize:14.0f];
    self.line = [Factory createViewWithBackgroundColor:UIColorFromRGB(213, 213, 213) frame:CGRectMake(99, 0, 1, 40)];
    
    self.title.layer.masksToBounds = YES;
    self.title.layer.cornerRadius = 5;
    self.title.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.line];
    [self addSubview:self.title];
    [self setbackgroundColor:self.type_cell];
}

-(void)selectFirstCell:(BOOL)yet row:(NSInteger)row{
    if (row == 0 && !yet) {
        self.type_cell = ClassfyTableViewCellTypeColor;
    }
    [self setbackgroundColor:self.type_cell];

}
- (void)setbackgroundColor:(ClassfyTableViewCellType)type{
    if (type == 2) {
        self.title.textColor = [UIColor whiteColor];
        self.title.backgroundColor = UIColorFromRGB(54, 54, 54);
    }else{
        self.title.textColor = [UIColor blackColor];
        self.title.backgroundColor = [UIColor whiteColor];
    }
}


@end
