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
//    NSDictionary *params = [self params];

        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
         mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    
            [mgr GET:self.yxg_url parameters:self.paramsDic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            //数据请求成功的block回调
            completion(responseObject, YES, @"");
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
        }];
    
}

-(NSDictionary *)params{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_httimestamp"] = [self HTtimeStamp];
    params[@"lastActivityPos"] = @"0";
    params[@"lastGoodsPos"] = @"0";
    params[@"pageNo"] = @"1";
    return params;
}

/*

 */

- (NSString *)HTtimeStamp{
    
    double timeStamp = ceil([[NSDate date] timeIntervalSince1970]);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setGeneratesDecimalNumbers:false];
    NSNumber *timeNumber = [NSNumber numberWithDouble:timeStamp];
    NSString *timeString = [formatter stringFromNumber:timeNumber];
    
    return timeString;
//    return [NSNumber numberWithLongLong:[timeString longLongValue]];
}


@end
