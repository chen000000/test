//
//  ApplicationFacade.m
//  zhimayun
//
//  Created by zhimayun on 15/11/20.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "ApplicationFacade.h"
#import "StartupCommand.h"
#import "HomeRegisterMediatorsCommand.h"
#import "UserAdminRegisterMediatorsCommand.h"


@implementation ApplicationFacade

-(void)startup:(id)app {
    [self sendNotification:Startup body:app];
}


+(ApplicationFacade *)getInstance {
    return (ApplicationFacade *)[super getInstance];
}

-(void)initializeController {
    [super initializeController];
    [self registerCommand:Startup commandClassRef:[StartupCommand class]];
    [self registerCommand:HomeRegisterMediators commandClassRef:[HomeRegisterMediatorsCommand class]];
    [self registerCommand:UserAdminRegisterMediators commandClassRef:[UserAdminRegisterMediatorsCommand class]];
}

@end
