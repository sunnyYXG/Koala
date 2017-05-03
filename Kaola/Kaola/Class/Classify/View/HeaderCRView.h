//
//  HeaderCRView.h
//  Kaola
//
//  Created by rongyun on 17/5/3.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ForYouTopBanner;

@interface HeaderCRView : UICollectionReusableView

- (void)configureData:(ForYouTopBanner *)banner section:(NSInteger)section sectionTitle:(NSString *)title;

@end
