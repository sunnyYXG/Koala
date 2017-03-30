//
//  BaseRequest.m
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest


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
