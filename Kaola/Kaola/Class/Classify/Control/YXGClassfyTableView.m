//
//  YXGClassfyTableView.m
//  Kaola
//
//  Created by rongyun on 17/4/24.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "YXGClassfyTableView.h"
#import "ClassfyTableViewCell.h"
#import "ClassfyRequest.h"
#import "ClassfyDataModels.h"
#import "ClassfyModelHandle.h"
#import "ClassfyCategoryTreeMenuList.h"
@interface YXGClassfyTableView ()

@property (nonatomic)ClassfyModel *baseModel;
@property (nonatomic)ClassfyTableViewCell *last_cell;

@end

@implementation YXGClassfyTableView

- (NSArray *)cellFrameArray {
    if (!_cellFrameArray) {
        _cellFrameArray = [NSMutableArray new];
    }
    return _cellFrameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ClassfyRequest *request = [ClassfyRequest yxg_request];
    self.request = request;
    [self loadDataWithUrl:classfy_url];
    self.select_first_cell = NO;
    // Do any additional setup after loading the view.
}

- (void)loadDataWithUrl:(NSString *)url{
    self.request.yxg_url = url;
    self.request.paramsDic = [ClassfyRequest params];
    [self loadData];
}
-(NSInteger)yxg_numberOfSections{
    return 1;
}
-(NSInteger)yxg_numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
-(CGFloat)yxg_cellheightAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(BaseTableViewCell *)yxg_cellAtIndexPath:(NSIndexPath *)indexPath{
    ClassfyTableViewCell *cell = [ClassfyTableViewCell cellWithTableView:self.tableView identifier:[NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row]];
    cell.TreeMenuList = self.data[indexPath.row];
    [cell selectFirstCell:self.select_first_cell row:indexPath.row];
    if (indexPath.row == 0 && cell.type_cell == 2) self.last_cell = cell;
    return cell;
}
-(void)yxg_didSelectCellAtIndexPath:(NSIndexPath *)indexPath cell:(BaseTableViewCell *)cell{
    //滚动选中的cell
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    //撤销上次选中的cell
    self.last_cell.type_cell = ClassfyTableViewCellTypeNil;
    [self.last_cell setbackgroundColor:self.last_cell.type_cell];

    //设置当前点击的cell
    ClassfyTableViewCell *now_cell = (ClassfyTableViewCell *)cell;
    now_cell.type_cell = ClassfyTableViewCellTypeColor;
    [now_cell setbackgroundColor:now_cell.type_cell];
    
    //保存选中的cell
    self.last_cell = now_cell;
    
    //第一次进来默认选中的是第一个cell
    self.select_first_cell = YES;
    
    
    ClassfyCategoryTreeMenuList *treeMune = self.data[indexPath.row];
    if (self.clickCellBlock) {
        self.clickCellBlock(treeMune);
    }
    
//    if (self.Block)  {
//        self.Block(indexPath.row);
//    }

}

- (void)loadData{
    if (!self.request) return;
    WEAK_BLOCK_SELF(YXGClassfyTableView);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            block_self.baseModel = (ClassfyModel *)[ClassfyModel yy_modelWithJSON:response];
            block_self.data = [ClassfyModelHandle ClassfyModelHandle:block_self.baseModel.body.categoryTreeMenuList];
        }
        [block_self yxg_reloadData];
    }];
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
