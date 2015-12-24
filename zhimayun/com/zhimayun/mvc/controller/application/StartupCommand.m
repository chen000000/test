//
//  StartupCommand.m
//  zhimayun
//
//  Created by zhimayun on 15/11/20.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "StartupCommand.h"
#import "VCAdmin.h"
#import "UserModel.h"
#import "VCAdminMediator.h"
#import "LoginMediator.h"
#import "HomePageMediator.h"
#import "SettingsMediator.h"


@implementation StartupCommand

/**
 实现系统启动的业务逻辑
 */
-(void)execute:(id<INotification>)notification {
    
    [facade registerProxy:[UserModel proxy]];
    
    VCAdmin * vcAdmin = [notification body];
    [facade registerMediator:[VCAdminMediator withViewComponent:vcAdmin]];
    [facade registerMediator:[LoginMediator withViewComponent:vcAdmin.loginViewController]];
    [facade registerMediator:[HomePageMediator withViewComponent:vcAdmin.homeViewController]];
    [facade registerMediator:[SettingsMediator withViewComponent:vcAdmin.settingsViewController]];
}

@end
