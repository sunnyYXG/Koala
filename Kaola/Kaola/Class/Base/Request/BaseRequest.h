//
//  BaseRequest.h
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NHAPIDicCompletion)(id response, BOOL success, NSString *message);

@interface BaseRequest : NSObject


/** 开始请求，如果设置了代理，不需要block回调*/
- (void)yxg_sendRequest;
/** 开始请求，没有设置代理，或者设置了代理，需要block回调，block回调优先级高于代理*/
- (void)yxg_sendRequestWithCompletion:(NHAPIDicCompletion)completion;

@end
