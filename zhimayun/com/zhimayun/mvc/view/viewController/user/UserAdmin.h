//
//  UserAdmin.h
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserMemberViewController.h"
#import "SettingsViewController.h"

@protocol UserAdminDelegate


@end

@interface UserAdmin : UIViewController
{
 
}

/**会员中心界面**/
@property (strong, nonatomic)  UserMemberViewController * userMemberViewController;


/**当前显示界面**/
@property (strong, nonatomic)  UIViewController * currentViewController;


/**设置代理**/
@property (strong, nonatomic)  id<UserAdminDelegate> delegate;


/**
 *切换会员中心界面,由Mediator调用
 */
-(void)onShowUserMemberView;


@end
