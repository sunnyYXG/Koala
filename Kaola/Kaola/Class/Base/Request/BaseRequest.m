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
            [mgr GET:self.yxg_url parameters:self.paramsDic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            /*
            NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:home_url]];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];

            NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
            if([cookiesdata length]) {
                NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
                DDLog(@"cookies:%@",cookies);
                NSHTTPCookie *cookie;
                for (cookie in cookies) {
                    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
                }
            }  
*/
            
            //数据请求成功的block回调
            completion(responseObject, YES, @"");
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
        }];
    
}


+(void)yxg_getCookiesWithPost{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSDictionary *dic = @{@"httimestamp":@"1492408547"};
    [manager POST:login_url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
#if 1
        NSLog(@"\n======================================\n");
        NSDictionary *fields = ((NSHTTPURLResponse*)task.response).allHeaderFields;
        NSLog(@"fields = %@",[fields description]);
        NSURL *url = [NSURL URLWithString:@"http://log-collector.kaola.com/api/alarmCommon?_httimestamp=1492407604"];
        NSLog(@"\n======================================\n");
        //获取cookie方法1
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];
        for (NSHTTPCookie *cookie in cookies) {
            NSLog(@"cookie,name:= %@,valuie = %@",cookie.name,cookie.value);
        }
        NSLog(@"\n======================================\n");
        //        //获取cookie方法2
        //        NSString *cookies2 = [((NSHTTPURLResponse*)task.response) valueForKey:@"Set-Cookie"];
        //        NSLog(@"cookies2 = %@",[cookies2 description]);
        /*
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        for (NSHTTPCookie *cookie in cookies) {
            // Here I see the correct rails session cookie
            NSLog(@"cookie: %@", cookie);
        }
        
        NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
        DDLog(@"cookiesData:%@",cookiesData);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject: cookiesData forKey: @"sessionCookies"];
        [defaults synchronize];
*/
        /*
        NSDictionary *fields = [responseObject allHeaderFields];
        NSLog(@"fields = %@",[fields description]);
        NSURL *url = [NSURL URLWithString:login_url];
        //获取cookie方法1
        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];
        NSLog(@"cookies11--%@",cookies);
        
        //获取cookie方法2
        //NSString *cookieString = [[HTTPResponse allHeaderFields] valueForKey:@"Set-Cookie"];
         */

#else
        //获取cookie
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage]cookiesForURL:[NSURL URLWithString:login_url]];
        for (NSHTTPCookie *tempCookie in cookies)
        {
            //打印cookies
            NSLog(@"getCookie:%@",tempCookie);
        }
        
        
        NSDictionary *Request = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        NSUserDefaults *userCookies = [NSUserDefaults standardUserDefaults];
        [userCookies setObject:[Request objectForKey:@"Cookie"] forKey:@"mUserDefaultsCookie"];
        [userCookies synchronize];
        
        DDLog(@"cookies:%@",cookies);

        
#endif
        
        
        

        
        //
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
}




@end
