//
//  ProgressHUDTool.h
//  zhimayun
//
//  Created by zhimayun on 15/11/25.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GifView.h"

@interface ProgressHUDTool : NSObject


/**loading图**/
+(GifView *)sharedLoadingView;

/**容器**/
+(UIView *)sharedContainer;

/**
 *显示加载loading
 *status:状态文字
 *target:显示对象界面
 */
+ (void)showWithStatus: (NSString *)status target:(id)targetDelegate;

/**
 *移除loading
 */
+ (void)remove;

@end
