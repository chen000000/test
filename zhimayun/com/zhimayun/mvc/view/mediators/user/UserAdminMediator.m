//
//  UserAdminMediator.m
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "UserAdminMediator.h"
#import "ApplicationFacade.h"

@implementation UserAdminMediator

+(NSString *)NAME {
    return @"UserAdminMediator";
}

-(UserAdmin *)viewComponent {
    return viewComponent;
}

-(void)initializeMediator {
    self.mediatorName = [UserAdminMediator NAME];
}

-(void)onRegister {
    [self.viewComponent setDelegate:self];
    [self registerMediators];
}

-(NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:ShowUserMemberView, nil];
}

-(void)handleNotification:(id<INotification>)notification {
    
    if ([[notification name] isEqualToString:ShowUserMemberView]) {
        [self.viewComponent onShowUserMemberView];
    }
}

-(void)registerMediators
{
    [self sendNotification:UserAdminRegisterMediators body:self.viewComponent];
}

@end
