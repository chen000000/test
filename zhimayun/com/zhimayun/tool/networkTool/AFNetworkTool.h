//
//  AFNetworkTool.h
//  PureMvcDemo1
//
//  Created by zhimayun on 15/11/19.
//
//

/**
 要使用常规的AFN网络访问
*/

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFNetworkTool : NSObject


/**检测网路状态**/
+ (void)netWorkStatus;



/**
 *JSON方式post提交数据
 *urlStr:服务器地址
 *parameters:提交的内容参数
 *block:返回函数
 */
+ (NSURLSessionDataTask *)postJSONWithBlock:(NSString *)urlStr parameters:(id)parameters block:(void (^)(NSArray *posts, NSError *error))block;

@end
