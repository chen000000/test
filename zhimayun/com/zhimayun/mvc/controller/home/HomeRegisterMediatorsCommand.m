//
//  HomeRegisterMediatorsCommand.m
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "HomeRegisterMediatorsCommand.h"
#import "HomeViewController.h"
#import "UserAdminMediator.h"

@implementation HomeRegisterMediatorsCommand


-(void)execute:(id<INotification>)notification {
    
    HomeViewController * homeViewController = [notification body];
    [facade registerMediator:[UserAdminMediator withViewComponent:homeViewController.userAdmin]];
}

@end
