//
//  RightCollectionViewCell.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "RightCollectionViewCell.h"

@implementation RightCollectionViewCell


-(id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    
    if (self)
    {
        NSArray *arrCell = [[NSBundle mainBundle]loadNibNamed:@"RightCollectionViewCell" owner:self options:nil];
        if (arrCell.count<1)
        {
            return nil;
        }
        if (![[arrCell objectAtIndex:0]isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        self = [arrCell objectAtIndex:0];
    }

    return self;
}

@end
