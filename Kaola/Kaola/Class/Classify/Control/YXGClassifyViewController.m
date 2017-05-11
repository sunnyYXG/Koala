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
#import "MainDataModels.h"
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
    [self addERCodeSearchNavBar:NavBarViewType ERcodeSearchType:ERcodeAndSearchType];

    [self.view addSubview:self.iTableview.tableView];
    _iTableview.tableView.backgroundColor = [UIColor whiteColor];
    CGRect frame = CGRectMake(0, 64, 100, self.view.height - 108);
    self.iTableview.tableView.frame = frame;
    
    ClassfyRequest *request = [ClassfyRequest yxg_request];
    self.request = request;
    
    [self CreatRightCollectionView];
    
    WEAK_BLOCK_SELF(YXGClassifyViewController);
    self.iTableview.clickCellBlock = ^(ClassfyCategoryTreeMenuList *treeMenu){
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
            self.type_category = CategoryDataTypeRecForYou;
            [self loadDataRecForYouWithUrl:recForYou_url];
            break;
        case 2:
            self.type_category = CategoryDataTypeMain;
            [self loadDataWithUrl:category_url];
            break;
        case 3:
            self.type_category = CategoryDataTypeBrandWall;
            break;
        case 4:
            self.type_category = CategoryDataTypePavilion;
            break;

        default:
            break;
    }

}

#pragma mark - CategoryDataTypeRecForYou
- (void)loadDataRecForYouWithUrl:(NSString *)url{
    self.request.yxg_url = url;
    self.request.paramsDic = [ClassfyRequest params];
    [self loadData];
}
#pragma mark - CategoryDataTypeMain
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

            ClassfyHandleData *handle = [ClassfyHandleData new];
            handle.HandleBlock = ^(ForYouTopBanner *TopBanner,NSArray *Datas,NSArray *SectionTitles){
                self.TopBanner = TopBanner;
                _Datas = Datas;
                _SectionTitles = SectionTitles;
            };
            [handle handleWithResponse:response withCategoryDataType:self.type_category];
        }
        [block_self.rightCollectionView reloadData];
        
    }];
}


-(void)CreatRightCollectionView{

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
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _SectionTitles.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
    [cell configureCellWithSection:indexPath.section row:indexPath.row data:_Datas withCategoryDataType:self.type_category];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type_category == 1) {
        if (indexPath.section == 3) {
            return CGSizeMake(SCREEN_WIDTH - 100, 140);
        }else{
            return CGSizeMake(self.rightCollectionView.width/3, self.rightCollectionView.width/3 + 30);
        }
    }else{
        return CGSizeMake((self.rightCollectionView.width - 5)/3, (self.rightCollectionView.width)/3 + 30);
    }
}

#pragma mark - 自定义collectionView头视图
//返回 headView的大小 size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0 && self.TopBanner) return CGSizeMake(300, 150);
    return CGSizeMake(300, 50);

}
//获取 headView的方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    NSString *CellIdentifier = @"HeaderCRView";
    //从缓存中获取 Headercell
    HeaderCRView *cell = (HeaderCRView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell configureData:self.TopBanner section:indexPath.section sectionTitle:_SectionTitles[indexPath.section]];
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
