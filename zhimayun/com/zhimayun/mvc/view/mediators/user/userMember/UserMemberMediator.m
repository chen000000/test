//
//  UserMemberMediator.m
//  zhimayun
//
//  Created by zhimayun on 15/12/22.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "UserMemberMediator.h"
#import "ApplicationFacade.h"

@implementation UserMemberMediator

+(NSString *)NAME {
    return @"UserMemberMediator";
}

-(UserMemberViewController *)viewComponent {
    return viewComponent;
}

-(void)initializeMediator {
    self.mediatorName = [UserMemberMediator NAME];
}

-(void)onRegister {
    [self.viewComponent setDelegate:self];
}

-(NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:@"", nil];
}

-(void)handleNotification:(id<INotification>)notification {
   
}

-(void)showSettings
{
    [self sendNotification:ShowSettingsView body:nil];
}


@end
