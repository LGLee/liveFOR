//
//  LGNetwork.h
//  liveFOR
//
//  Created by lingo on 16/5/21.
//  Copyright © 2016年 lingo. All rights reserved.
//  对于afn的网络请求封装类

#import <Foundation/Foundation.h>
#import "Single.h"
@interface LGNetwork : NSObject


interfaceSingle(LGNetwork);


- (void)postURL:(NSString *)URLString parameters:(id)parameters progress:(void(^)(NSProgress *progress))progress success:(void(^)(NSURLSessionDataTask *task,id responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

@end
