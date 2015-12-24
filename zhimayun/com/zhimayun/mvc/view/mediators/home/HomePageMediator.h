//
//  HomePageMediator.h
//  zhimayun
//
//  Created by zhimayun on 15/12/21.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "Mediator.h"
#import "HomeViewController.h"

#define ShowUserAdminView @"ShowUserAdminView"
#define ShowDoorKeysAdmin @"ShowDoorKeysAdmin"
#define ShowPropertyAdmin @"ShowPropertyAdmin"

@interface HomePageMediator : Mediator<HomeViewControllerDelegate>
{
    
}

@end
