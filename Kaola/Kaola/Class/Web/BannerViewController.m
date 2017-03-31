//
//  BannerViewController.m
//  Kaola
//
//  Created by rongyun on 17/3/31.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BannerViewController.h"

@interface BaseViewController ()<UIWebViewDelegate>


@end

@implementation BannerViewController

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.delegate = self;
        _webView.scrollView.backgroundColor = [UIColor whiteColor];
        //        _webView.scrollView.scrollEnabled = NO;
        _webView.scrollView.scrollsToTop = NO;
        //        _webView.scalesPageToFit = YES;
    }
    return _webView;
}
-(BannerList *)banner{
    if (!_banner) {
        _banner = [[BannerList alloc]init];
    }
    return _banner;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网页文件";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.webView];
    self.banner = (BannerList *)[self.userInfo objectForKey:@"banner"];
    [self configureWebViewWith:self.banner.linkUrl];
    
}


#pragma mark - UIWebViewDelegate 加载html5页面
-(void)configureWebViewWith:(NSString *)url{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    CGFloat htmlHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
    CGFloat offsetHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    _webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, offsetHeight);
    [_scrollView setContentSize:CGSizeMake(CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_webView.frame))];

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
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
