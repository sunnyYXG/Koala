//
//  YXGHomeViewController.h
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseRequest.h"
@interface YXGHomeViewController : BaseTableViewController

@property (nonatomic, strong) BaseRequest *request;
@property (nonatomic)NSArray *List;
@end
