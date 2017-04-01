//
//  BannerViewController.h
//  Kaola
//
//  Created by rongyun on 17/3/31.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseViewController.h"

@interface BannerViewController : BaseViewController

@property (nonatomic)UIWebView *webView;
@property (nonatomic)NSDictionary *BannerDic;
@property (nonatomic) NSString *bannerUrl;
@property (nonatomic)UIScrollView *scrollView;
@end
