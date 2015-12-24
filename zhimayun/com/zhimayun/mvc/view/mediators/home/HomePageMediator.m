//
//  HomePageMediator.m
//  zhimayun
//
//  Created by zhimayun on 15/12/21.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "HomePageMediator.h"
#import "ApplicationFacade.h"

@implementation HomePageMediator

+(NSString *)NAME {
    return @"HomePageMediator";
}

-(HomeViewController *)viewComponent {
    return viewComponent;
}

-(void)initializeMediator {
    self.mediatorName = [HomePageMediator NAME];
}

-(void)onRegister {
    [self.viewComponent setDelegate:self];
    [self registerMediators];
}

-(NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:ShowUserAdminView,ShowDoorKeysAdmin,ShowPropertyAdmin,nil];
}

-(void)handleNotification:(id<INotification>)notification {
    if ([[notification name] isEqualToString:ShowUserAdminView]) {
        [self.viewComponent onShowUserAdmin];
    }
    else if([[notification name] isEqualToString:ShowDoorKeysAdmin])
    {
        [self.viewComponent onShowDoorKeysAdmin];
    }
    else if([[notification name] isEqualToString:ShowPropertyAdmin])
    {
        [self.viewComponent onShowPropertyAdmin];
    }
}

-(void)registerMediators
{
    [self sendNotification:HomeRegisterMediators body:self.viewComponent];
}

-(void)showUserAdmin
{
    [self sendNotification:ShowUserAdminView body:nil];
}

-(void)showDoorKeysAdmin
{
    [self sendNotification:ShowDoorKeysAdmin body:nil];
}

-(void)showPropertyAdmin
{
    [self sendNotification:ShowPropertyAdmin body:nil];
}


@end
