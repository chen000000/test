//
//  SystemEnum.h
//  zhimayun
//
//  Created by zhimayun on 15/11/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

//默认颜色按钮以及标题栏
#define DefaultColor [UIColor colorWithRed:37/255.0 green:182/255.0 blue:237/255.0 alpha:1.0f]
//黑色颜色
#define DefaultBlack [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0f]
//灰色颜色
#define DefaultGrey [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0f]
//下划线颜色
#define DefaultLine [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0f]
//灰色文字颜色
#define DefaultTextGrey [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0f]

/**
 系统相关宏
 */
@interface SystemEnum : NSObject

/**获取系统屏幕大小**/
+(CGSize)appSize;

@end
