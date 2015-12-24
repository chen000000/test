//
//  LoginMediator.m
//  zhimayun
//
//  Created by zhimayun on 15/11/26.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "LoginMediator.h"
#import "LoginViewController.h"
#import "NetManager.h"
#import "UserLoginMsg.h"


@implementation LoginMediator

+(NSString *)NAME {
    return @"LoginMediator";
}

-(LoginViewController *)viewComponent {
    return viewComponent;
}

-(void)initializeMediator {
    self.mediatorName = [LoginMediator NAME];
}

-(void)onRegister {
    [self.viewComponent setDelegate:self];
}

-(NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:LoginSuccess,LoginFail, nil];
}

-(void)handleNotification:(id<INotification>)notification {
    //[self.viewComponent setView:nil];
    if ([[notification name] isEqualToString:LoginSuccess]) {
        [self.viewComponent onLoginSuccess];
        [self sendNotification:ShowHomeView body:nil];
    }
    else if ([[notification name] isEqualToString:LoginFail]) {
         NSString * failLabel =  [notification body];
        [self.viewComponent onLoginFail:failLabel];
    }
}

-(void)sendUserLoginMsg:(NSMutableDictionary *)userInfoDictionary
{
    UserLoginMsg * userLoginMsg = [[UserLoginMsg alloc] init];
    userLoginMsg.data = userInfoDictionary;
    [NetManager send:userLoginMsg];
}

@end
