//
//  ClassfyTableViewCell.h
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
@class ClassfyCategoryTreeMenuList;

typedef NS_ENUM(NSUInteger, ClassfyTableViewCellType) {
    ClassfyTableViewCellTypeNil = 1,
    ClassfyTableViewCellTypeColor = 2,
    
};


@interface ClassfyTableViewCell : BaseTableViewCell

@property (nonatomic)ClassfyTableViewCellType type_cell;
@property (nonatomic)ClassfyCategoryTreeMenuList *TreeMenuList;

@property (nonatomic)UIView *titleView;
@property (nonatomic)UILabel *title;
@property (nonatomic)UIView *line;


- (void)selectFirstCell:(BOOL)yet row:(NSInteger)row;
- (void)setbackgroundColor:(ClassfyTableViewCellType)type;
@end
