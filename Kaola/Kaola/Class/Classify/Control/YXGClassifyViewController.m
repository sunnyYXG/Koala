//
//  ClassifyViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGClassifyViewController.h"
#import "YXGClassfyTableView.h"

@interface YXGClassifyViewController ()

@property (nonatomic)YXGClassfyTableView *iTableview;
@end

@implementation YXGClassifyViewController

-(YXGClassfyTableView *)iTableview{
    if (!_iTableview) {
        _iTableview = [[YXGClassfyTableView alloc]init];
    }
    return _iTableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.iTableview.tableView];
    CGRect frame = CGRectMake(0, 64, 100, self.view.height);
    self.iTableview.tableView.frame = frame;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
