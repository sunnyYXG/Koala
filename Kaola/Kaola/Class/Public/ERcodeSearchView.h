//
//  ERcodeSearchView.h
//  Kaola
//
//  Created by rongyun on 17/5/11.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeNavTabBar.h"

typedef void (^ERcodeSearchViewBlock)(UIViewController *Ctr);
typedef void (^ERcodeSearchViewBlockPresent)(UIViewController *AlertCtr);

typedef NS_ENUM(NSInteger,ERcodeSearchType) {
    ERcodeAndSearchType = 1,
    ERcodeAndMessageType = 2,

};


@interface ERcodeSearchView : UIView<UISearchBarDelegate>

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UIButton *ERCodeBtn;

@property (nonatomic, copy) ERcodeSearchViewBlock SearchPushBlock;
@property (nonatomic, copy) ERcodeSearchViewBlockPresent ERcodePresentBlock;

@property (nonatomic)HomeNavTabBar *segmentView;


-(void)configureViewWithType:(ERcodeSearchType)type;
@end
