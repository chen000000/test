//
//  ApplicationFacade.h
//  zhimayun
//
//  Created by zhimayun on 15/11/20.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "Facade.h"

#import "VCAdminMediator.h"
#import "LoginMediator.h"
#import "HomePageMediator.h"
#import "UserAdminMediator.h"
#import "UserMemberMediator.h"
#import "SettingsMediator.h"

#define Startup @"Startup"
#define HomeRegisterMediators @"HomeRegisterMediators"
#define UserAdminRegisterMediators @"UserAdminRegisterMediators"

@interface ApplicationFacade : Facade
{
    
}

+(ApplicationFacade *)getInstance;

-(void)startup:(id)app;

@end
