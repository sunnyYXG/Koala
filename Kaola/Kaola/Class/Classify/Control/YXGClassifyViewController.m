//
//  ClassifyViewController.m
//  YXGDemo
//
//  Created by sunny_FX on 2017/3/25.
//  Copyright © 2017年 YXG. All rights reserved.
//

#import "YXGClassifyViewController.h"
#import "YXGClassfyTableView.h"
#import "RightCollectionViewCell.h"

@interface YXGClassifyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,YXGClassfyTableViewDelegate>

@property (nonatomic)YXGClassfyTableView *iTableview;
@end

@implementation YXGClassifyViewController

-(YXGClassfyTableView *)iTableview{
    if (!_iTableview) {
        _iTableview = [[YXGClassfyTableView alloc]init];
        _iTableview.delegate = self;
    }
    return _iTableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.iTableview.tableView];
    _iTableview.tableView.backgroundColor = [UIColor whiteColor];
    CGRect frame = CGRectMake(0, 64, 100, self.view.height - 108);
    self.iTableview.tableView.frame = frame;
    
    [self CreatRightCollectionView];
    
//    [self.iTableview CollectionReloadBlock:^(NSInteger selectedIndex) {
//        _selectedIndex = selectedIndex;
//        DDLog(@"rrrrr:%ld",selectedIndex);
//        [_rightCollectionView reloadData];
//    }];
    

}

- (void)CollectionReloadBlockWithID:(NSInteger)row{
    _selectedIndex = row;
    [_rightCollectionView reloadData];
}
-(void)CreatRightCollectionView
{
    _myData = [[NSArray alloc]initWithObjects:@"笔记本",@"休闲裤",@"牛仔裤",@"手机",@"净化器",@"火锅",@"OPPO",@"面膜",@"漱口水",@"测试",@"测试1", nil];

    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(100, 64, self.view.frame.size.width-100, self.view.frame.size.height - 108) collectionViewLayout:flowayout];
    
    [_rightCollectionView registerClass:[RightCollectionViewCell class] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
    
    [_rightCollectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _rightCollectionView.delegate = self;
    _rightCollectionView.dataSource = self;
    
    [self.view addSubview:_rightCollectionView];
    
    
}

#pragma mark------CollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _myData.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
    //根据左边点击的indepath更新右边内容;
    switch (_selectedIndex % 2)
    {
        case 0:
            cell.collectionView_imageview.image = [UIImage imageNamed:@"3.jpg"];
            break;
        case 1:
            cell.collectionView_imageview.image = [UIImage imageNamed:@"4.jpg"];
            break;
        default:
            break;
    }
    
    cell.collectionView_Label.text = _myData[indexPath.row];
    
    return cell;
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 5, 0, 10);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 120);
    
    
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
