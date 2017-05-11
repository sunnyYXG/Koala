//
//  ERcodeSearchView.m
//  Kaola
//
//  Created by rongyun on 17/5/11.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ERcodeSearchView.h"
#import "QRCodeGenerateVC.h"
#import "QRCodeScanningVC.h"
#import <AVFoundation/AVFoundation.h>


@implementation ERcodeSearchView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.searchBar];
        [self addSubview:self.ERCodeBtn];
        [self addSubview:self.segmentView];
    }
    return self;
}
-(HomeNavTabBar *)segmentView{
    if (!_segmentView) {
        _segmentView = [[HomeNavTabBar alloc] initWithFrame:CGRectMake(self.width/4, 20 , self.width/2, 44)];
        _segmentView.backgroundColor = UIColorFromRGB(249, 249, 249);
    }
    return _segmentView;
}

#pragma mark - 搜索框
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(47, 20, SCREEN_WIDTH - 94, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"搜索";
        _searchBar.showsCancelButton = NO;
        _searchBar.searchBarStyle=UISearchBarStyleMinimal;
        [_searchBar setContentMode:UIViewContentModeLeft];
        
    }
    return _searchBar;
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [UIView animateWithDuration:0.3 animations:^{
        _ERCodeBtn.hidden = YES;
        
//        if (self.CtrBlockPush) {
//            self.CtrBlockPush([YXGHomeOtherController new]);
//        }
        _searchBar.frame = CGRectMake(0, 20, SCREEN_WIDTH, 44);
        _searchBar.showsCancelButton = YES;
    }];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _ERCodeBtn.hidden = NO;
    _searchBar.frame = CGRectMake(47, 20, SCREEN_WIDTH - 94, 44);
    _searchBar.showsCancelButton = NO;
    [_searchBar resignFirstResponder];
    _searchBar.text = @"";
}


#pragma mark - 二维码
- (UIButton *)ERCodeBtn{
    if (!_ERCodeBtn) {
        _ERCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 31, 22, 22)];
        //        _ERCodeBtn.backgroundColor = [UIColor orangeColor];
        //        [_ERCodeBtn setBackgroundImage:[UIImage imageNamed:@"ERCode"] forState:UIControlStateNormal];
        [_ERCodeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_ERCodeBtn setTitle:@"+" forState:UIControlStateNormal];
        [_ERCodeBtn addTarget:self action:@selector(scanningQRCode:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _ERCodeBtn;
}
#pragma mark - 生成二维码方法
- (void)generateQRCode:(id)sender {
    QRCodeGenerateVC *VC = [[QRCodeGenerateVC alloc] init];
    [self PushViewController:VC];
}

#pragma mark - 扫描二维码方法
- (void)scanningQRCode:(id)sender {
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        QRCodeScanningVC *vc = [[QRCodeScanningVC alloc] init];
                        [self PushViewController:vc];
                    });
                    
                    NSLog(@"当前线程 - - %@", [NSThread currentThread]);
                    // 用户第一次同意了访问相机权限
                    NSLog(@"用户第一次同意了访问相机权限");
                    
                } else {
                    
                    // 用户第一次拒绝了访问相机权限
                    NSLog(@"用户第一次拒绝了访问相机权限");
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            QRCodeScanningVC *vc = [[QRCodeScanningVC alloc] init];
            [self PushViewController:vc];
        } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self PresentViewController:alertC];
            
        } else if (status == AVAuthorizationStatusRestricted) {
            NSLog(@"因为系统原因, 无法访问相册");
        }
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alertA];
        [self PresentViewController:alertC];
    }
    
}

- (void)PushViewController:(UIViewController *)VC{
    if (self.SearchPushBlock) {
        self.SearchPushBlock(VC);
    }
}

- (void)PresentViewController:(UIViewController *)VC{
    if (self.ERcodePresentBlock) {
        self.ERcodePresentBlock(VC);
    }
}

-(void)configureViewWithType:(ERcodeSearchType)type{
    switch (type) {
        case ERcodeAndSearchType:
            self.segmentView.hidden = YES;
            break;
         
        case ERcodeAndMessageType:
            self.searchBar.hidden = YES;
            self.segmentView.hidden = NO;
            break;

        default:
            break;
    }
}
@end
