//
//  BasePageController.h
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePageController : UIViewController
{
    
}

/**主容器**/
@property (strong, nonatomic) UIView * mainContainer;

/**内容体容器**/
@property (strong, nonatomic) UIView * bodyContainer;

/**标题**/
@property (strong, nonatomic) UILabel * titleLabel;

/**标题栏高度**/
@property  NSInteger titleHeight;

/**返回按钮icon**/
@property (strong, nonatomic) UIImageView * backButtonIcon;

/**返回按钮Label**/
@property (strong, nonatomic) UILabel * backButtonLabel;

/**返回按钮控件**/
@property (strong, nonatomic) UIButton * backButton;

/**
 初始化界面上的组件
 */
-(void)initComponents;

/**
 设置标题
 */
-(void)setPageTitle:(NSString *)title;

/**
 设置返回按钮
 */
-(void)setPageBackButton:(NSString *)title;

/**
 返回按钮点击函数
 */
-(void)returnFromPage:(UIButton *)button;

@end
