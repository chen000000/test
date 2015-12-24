//
//  VCAdmin.h
//  zhimayun
//
//  Created by zhimayun on 15/11/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "HomeViewController.h"

/**
 系统视图界面管理者
 */

@interface VCAdmin : UIViewController
{
    
}
/**登入界面**/
@property (strong, nonatomic)  LoginViewController * loginViewController;

/**主功能界面**/
@property (strong, nonatomic)  HomeViewController * homeViewController;

/**设置界面**/
@property (strong, nonatomic)  SettingsViewController * settingsViewController;

/**当前显示界面**/
@property (strong, nonatomic)  UIViewController * currentViewController;


/**
 *切换主功能界面,由Mediator调用
 */
-(void)onShowHomeView;

/**
 *切换登入界面,由Mediator调用
 */
-(void)onShowLoginView;

/**
 *切换设置界面,由Mediator调用
 */
-(void)onShowSettingsView;

@end
