//
//  LoginViewController.h
//  zhimayun
//
//  Created by zhimayun on 15/11/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol LoginViewControllerDelegate

   -(void)sendUserLoginMsg:(NSMutableDictionary *) userInfoDictionary;

@end

/**
 登入视图界面
 */
@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    
}
/**主容器**/
@property (strong, nonatomic) UIView * mainContainer;

/**活动容器**/
@property (strong, nonatomic) UIView * activityContainer;

/**进入默认loading图片**/
@property (strong, nonatomic)  UIImageView * indexImage;

/**登入界面背景图片**/
@property (strong, nonatomic)  UIImageView * backGroundImage;

/**用户名输入文本框**/
@property (strong, nonatomic) UITextField * nameTextField;

/** 密码输入文本框**/
@property (strong, nonatomic) UITextField * passWordTextField;

/** 登入按钮**/
@property (strong, nonatomic) UIButton * loginButton;

/**设置代理**/
@property (strong, nonatomic)  id<LoginViewControllerDelegate> delegate;

/**
 *登入成功,由Mediator调用
 */
-(void)onLoginSuccess;

/**
 *登入失败,由Mediator调用
 */
-(void)onLoginFail:(NSString *) failLabel;

@end
