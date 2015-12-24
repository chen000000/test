//
//  AFNetworkTool.m
//  PureMvcDemo1
//
//  Created by zhimayun on 15/11/19.
//
//

#import "AFNetworkTool.h"
#import "AFAppDotNetAPIClient.h"

@implementation AFNetworkTool


#pragma mark 检测网路状态
+ (void)netWorkStatus
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%ld", status);
    }];
}

#pragma mark - JSON方式post提交数据
+ (NSURLSessionDataTask *)postJSONWithBlock:(NSString *)urlStr parameters:(id)parameters block:(void (^)(NSArray *posts, NSError *error))block
{
    [AFAppDotNetAPIClient sharedClient].requestSerializer = [AFJSONRequestSerializer serializer];
    
    return [[AFAppDotNetAPIClient sharedClient] GET:urlStr parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        if (block) {
            block(JSON, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
    
    
    
}

@end
