//
//  LGNetwork.m
//  liveFOR
//
//  Created by lingo on 16/5/21.
//  Copyright © 2016年 lingo. All rights reserved.
//

#import "LGNetwork.h"
#import <AFNetworking.h>

@interface LGNetwork ()

/** netWorkManager */
@property (nonatomic, strong)AFHTTPSessionManager *manager;

@end

@implementation LGNetwork
implementationSingle(LGNetwork);

#pragma mark - 网络请求管理者lazy
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] init];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 15.0;
        [_manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json",@"text/javascript", @"text/html",@"text/css",@"application/x-javascript", nil]];
    }
    return _manager;
}



#pragma mark - post
- (void)postURL:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress *progress))progress success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    LGLog(@"urlString = [%@] parameters = [%@]",URLString,parameters);
    [self.manager POST:URLString parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(task,error);
    }];

}





@end
