//
//  UserAdminRegisterMediatorsCommand.m
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "UserAdminRegisterMediatorsCommand.h"
#import "UserAdmin.h"
#import "SettingsMediator.h"
#import "UserMemberMediator.h"

@implementation UserAdminRegisterMediatorsCommand


-(void)execute:(id<INotification>)notification
{
    UserAdmin * userAdmin = [notification body];
    [facade registerMediator:[UserMemberMediator withViewComponent:userAdmin.userMemberViewController]];
    //[facade registerMediator:[SettingsMediator withViewComponent:userAdmin.settingsViewController]];
    
}

@end
