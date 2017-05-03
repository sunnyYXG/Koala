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
#import "ClassfyCategoryTreeMenuList.h"
#import "ClassfyRequest.h"

#import "HeaderCRView.h"

#import "ForYouDataModels.h"
#import "ClassfyHandleData.h"

@interface YXGClassifyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

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
    _iTableview.tableView.backgroundColor = [UIColor whiteColor];
    CGRect frame = CGRectMake(0, 64, 100, self.view.height - 108);
    self.iTableview.tableView.frame = frame;
    
    ClassfyRequest *request = [ClassfyRequest yxg_request];
    self.request = request;
    
    [self CreatRightCollectionView];
    
    WEAK_BLOCK_SELF(YXGClassifyViewController);
    self.iTableview.clickCellBlock = ^(ClassfyCategoryTreeMenuList *treeMenu){
        DDLog(@"title:%@ -- type:%.0f -- categoryId:%.0f",treeMenu.title,treeMenu.type,treeMenu.categoryId);
        _categoryId = treeMenu.categoryId;
        [block_self loadDataWithCategoryType:treeMenu.type];
    };
/*
    WeakSelf(weak_self);
     self.iTableview.Block = ^(NSInteger selectedIndex) {
         _selectedIndex = selectedIndex;
         [weak_self.rightCollectionView reloadData];
     };
    
    self.type_category = CategoryDataTypeRecForYou;
    ClassfyRequest *request = [ClassfyRequest yxg_request];
    self.request = request;
*/
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadDataWithCategoryType:1];
}

- (void)loadDataWithCategoryType:(NSInteger)type{

    switch (type) {
        case 1:
            self.SectionTitles = @[@"常用分类",@"热门分类",@"推荐品牌",@"精选专辑"];
            self.type_category = CategoryDataTypeRecForYou;
            [self loadDataRecForYouWithUrl:recForYou_url];
            break;
        case 2:
            [self loadDataWithUrl:category_url];
            break;
        case 3:
            
            break;
        case 4:
            
            break;

        default:
            break;
    }

}

//为你推荐数据
- (void)loadDataRecForYouWithUrl:(NSString *)url{
    self.request.yxg_url = url;
    self.request.paramsDic = [ClassfyRequest params];
    [self loadData];
}
//其他分类数据
- (void)loadDataWithUrl:(NSString *)url{
    self.request.yxg_url = url;
    self.request.paramsDic = [ClassfyRequest categoryParamsWithCategoryID:[HelperTools stringWith_int:_categoryId]];
    [self loadData];
}

-(void)loadData{
    [self startProgress];
    WEAK_BLOCK_SELF(YXGClassifyViewController);
    [self.request yxg_sendRequestWithCompletion:^(id response, BOOL success, NSString *message) {
        if (success) {
            [self stopProgress];
            block_self.baseModel = (ForYouCategory *)[ForYouCategory yy_modelWithJSON:response];
            NSDictionary *dic = [ClassfyHandleData ClassfyModelHandle:block_self.baseModel];
            _Datas = @[[dic objectForKey:@"commonList"],[dic objectForKey:@"hotList"],[dic objectForKey:@"brandList"],[dic objectForKey:@"albumList"]];
        }
        [block_self.rightCollectionView reloadData];
    }];
}


-(void)CreatRightCollectionView
{
//    _Datas = [[NSArray alloc]initWithObjects:@"图片",@"休闲裤",@"牛仔裤",@"手机",@"净化器",@"火锅",@"OPPO",@"面膜",@"漱口水",@"测试",@"测试1", nil];

    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(100, 64, self.view.frame.size.width-100, self.view.frame.size.height - 108) collectionViewLayout:flowayout];
    
    [_rightCollectionView registerClass:[RightCollectionViewCell class] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
    
    [_rightCollectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _rightCollectionView.delegate = self;
    _rightCollectionView.dataSource = self;
    
    [self.view addSubview:_rightCollectionView];
    
    
    //这里的HeaderCRView 是自定义的header类型
    [_rightCollectionView registerClass:[HeaderCRView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderCRView"];

}

#pragma mark------CollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_Datas[section] count];
//    return _Datas.count;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _SectionTitles.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
    //根据左边点击的indepath更新右边内容;
    switch (_categoryId % 2)
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
    if (indexPath.section == 0) {
        ForYouCommonCategoryList *common = (ForYouCommonCategoryList *)_Datas[indexPath.section][indexPath.row];
        cell.collectionView_Label.text = common.categoryName;

    }else if(indexPath.section == 1){
        ForYouHotCategoryList *common = (ForYouHotCategoryList *)_Datas[indexPath.section][indexPath.row];
        cell.collectionView_Label.text = common.categoryName;

    }else if(indexPath.section == 2){
        ForYouBrandList *common = (ForYouBrandList *)_Datas[indexPath.section][indexPath.row];
        cell.collectionView_Label.text = common.brandName;
        
    }else if(indexPath.section == 3){
        ForYouAlbumList *common = (ForYouAlbumList *)_Datas[indexPath.section][indexPath.row];
        cell.collectionView_Label.text = common.title;
        
    }


    
    return cell;
    
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 5, 0, 10);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 120);
}


//返回 headView的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) return CGSizeMake(300, 150);
    return CGSizeMake(300, 50);

}
//获取 headView的方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    NSString *CellIdentifier = @"HeaderCRView";
    //从缓存中获取 Headercell
    HeaderCRView *cell = (HeaderCRView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell configureData:self.baseModel.body.topBanner section:indexPath.section sectionTitle:_SectionTitles[indexPath.section]];
    return cell;
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
