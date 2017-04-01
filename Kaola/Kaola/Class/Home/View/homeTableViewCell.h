//
//  homeTableViewCell.h
//  Kaola
//
//  Created by rongyun on 17/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseTableViewCell.h"
@class HomeTableViewCellFrame;

@protocol homeTableViewCellDelegate <NSObject>

- (void)pushBannerWebViewWithURL:(NSString *)url;

@end

@interface homeTableViewCell : BaseTableViewCell

@property (nonatomic)id<homeTableViewCellDelegate>delegate;
/** 首页cellFrame模型*/
@property (nonatomic, strong) HomeTableViewCellFrame *cellFrame;
@property (nonatomic)UIScrollView *sc;
@property (nonatomic)Home *home;
@property (nonatomic)NSMutableArray *links_URL;

@end

