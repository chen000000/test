//
//  VCAdminMediator.m
//  zhimayun
//
//  Created by zhimayun on 15/11/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "VCAdminMediator.h"
#import "VCAdmin.h"

@implementation VCAdminMediator

+(NSString *)NAME {
    return @"VCAdminMediator";
}

-(VCAdmin *)viewComponent {
    return viewComponent;
}

-(void)initializeMediator {
    self.mediatorName = [VCAdminMediator NAME];
}

-(NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:ShowLoginView,ShowHomeView,ShowSettingsView, nil];
}

-(void)handleNotification:(id<INotification>)notification {
    
    if ([[notification name] isEqualToString:ShowLoginView]) {
        
    }
    else if([[notification name] isEqualToString:ShowHomeView])
    {
         [self.viewComponent onShowHomeView];
    }
    else if([[notification name] isEqualToString:ShowSettingsView])
    {
         [self.viewComponent onShowSettingsView];
    }
}


@end
