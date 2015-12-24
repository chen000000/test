//
//  HomeViewController.h
//  zhimayun
//
//  Created by zhimayun on 15/12/21.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageController.h"
#import "UserMemberViewController.h"
#import "UserAdmin.h"

@protocol HomeViewControllerDelegate

-(void)registerMediators;
-(void)showUserAdmin;
-(void)showDoorKeysAdmin;
-(void)showPropertyAdmin;

@end


/**
 主功能视图界面
 */
@interface HomeViewController : BasePageController
{
    
}


/**显示页面容器**/
@property (strong, nonatomic) UIView * pageContainer;

/**Item分页控件容器**/
@property (strong, nonatomic) UIView * itemsBarContainer;

/**物业按钮文字**/
@property (strong, nonatomic) UILabel * propertyLabel;

/**我的按钮文字**/
@property (strong, nonatomic) UILabel * meLabel;

/**物业图标**/
@property (strong, nonatomic) UIImageView * propertyIcon;

/**我的图标**/
@property (strong, nonatomic) UIImageView * meIcon;

/**物业分页按钮**/
@property (strong, nonatomic) UIButton * propertyTabButton;

/**我的分页按钮**/
@property (strong, nonatomic) UIButton * meTabButton;

/**我的分页按钮**/
@property (strong, nonatomic) UIButton * lockTabButton;


/**用户中心界面**/
@property (strong, nonatomic)  UserAdmin * userAdmin;


/**设置代理**/
@property (strong, nonatomic)  id<HomeViewControllerDelegate> delegate;


/**
 *切换功能主界面,由Mediator调用
 */
-(void)onShow;

/**
 *切换会员中心界面,由Mediator调用
 */
-(void)onShowUserAdmin;

/**
 *切换开锁界面,由Mediator调用
 */
-(void)onShowDoorKeysAdmin;

/**
 *切换物业界面,由Mediator调用
 */
-(void)onShowPropertyAdmin;



@end
