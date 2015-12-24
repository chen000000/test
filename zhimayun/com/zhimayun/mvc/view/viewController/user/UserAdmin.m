//
//  UserAdmin.m
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "UserAdmin.h"

@interface UserAdmin ()

@end

@implementation UserAdmin
@synthesize  delegate,currentViewController,userMemberViewController;

- (instancetype)init
{
    self = [super init];
    if (self){
        self.userMemberViewController = [[UserMemberViewController alloc] init];
        //self.settingsViewController = [[SettingsViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:userMemberViewController];
    
    [self.view addSubview:self.userMemberViewController.view];
    currentViewController = userMemberViewController;
    
}

//-----------------------------------由Mediator调用-------------------------------------------------------------
-(void)onShowUserMemberView
{
    [self transitionFromViewController:currentViewController toViewController:self.userMemberViewController duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve  animations:^{
    }  completion:^(BOOL finished) {
        if (finished) {
            currentViewController = self.userMemberViewController;
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
