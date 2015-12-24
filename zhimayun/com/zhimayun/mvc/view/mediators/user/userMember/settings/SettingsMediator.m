//
//  SettingsMediator.m
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "SettingsMediator.h"
#import "ApplicationFacade.h"

@implementation SettingsMediator

+(NSString *)NAME {
    return @"SettingsMediator";
}

-(SettingsViewController *)viewComponent {
    return viewComponent;
}

-(void)initializeMediator {
    self.mediatorName = [SettingsMediator NAME];
}

-(void)onRegister {
    [self.viewComponent setDelegate:self];
}

-(NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:@"", nil];
}

-(void)handleNotification:(id<INotification>)notification {
    
}


-(void)showHome
{
    [self sendNotification:ShowHomeView body:nil];
}

@end
