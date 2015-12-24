//
//  StringTool.h
//  zhimayun
//
//  Created by zhimayun on 15/12/22.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StringTool : NSObject


/**计算文本空间大小**/
+ (CGSize)boundingRectWithSize:(CGSize)size UILabel:(UILabel *) label;

/**计算文本空间大小(ios6)**/
+ (CGSize)boundingRectWithSizeForIos6:(CGSize)size UILabel:(UILabel *) label;

@end
