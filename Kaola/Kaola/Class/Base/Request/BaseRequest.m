//
//  BaseRequest.m
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

#pragma mark - 构造
+ (instancetype)yxg_request {
    return [[self alloc] init];
}

+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url {
    return [self yxg_requestWithUrl:yxg_url isPost:NO];
}

+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url isPost:(BOOL)yxg_isPost {
    return [self yxg_requestWithUrl:yxg_url isPost:yxg_isPost delegate:nil];
}

+ (instancetype)yxg_requestWithUrl:(NSString *)yxg_url isPost:(BOOL)yxg_isPost delegate:(id <BaseRequestReponseDelegate>)yxg_delegate {
    BaseRequest *request = [self yxg_request];
    request.yxg_url = yxg_url;
    request.yxg_isPost = yxg_isPost;
    request.yxg_delegate = yxg_delegate;
    return request;
}

-(void)setYxg_url:(NSString *)yxg_url{
    if (yxg_url.length == 0 || [yxg_url isKindOfClass:[NSNull class]]) {
        return ;
    }
    _yxg_url = yxg_url;

}
-(void)yxg_sendRequest{
    [self yxg_sendRequestWithCompletion:nil];
}
- (void)yxg_sendRequestWithCompletion:(NHAPIDicCompletion)completion {
    
        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
            [mgr GET:home_url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            completion(responseObject, YES, @"");

//            _baseModel = [[BaseClass alloc]init];
//            _baseModel = (BaseClass *)[BaseClass yy_modelWithJSON:responseObject];
//            DDLog(@"yymodel:%@",_baseModel.body);
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
        }];
}
@end
