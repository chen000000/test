//
//  LoginMediator.h
//  zhimayun
//
//  Created by zhimayun on 15/11/26.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "Mediator.h"
#import "LoginViewController.h"

#define LoginSuccess @"LoginSuccess"
#define LoginFail @"LoginFail"

@interface LoginMediator : Mediator<LoginViewControllerDelegate>
{
    
}

@end
