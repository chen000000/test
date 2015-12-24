//
//  VCAdmin.m
//  zhimayun
//
//  Created by zhimayun on 15/11/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "VCAdmin.h"
#import "SystemEnum.h"

@interface VCAdmin ()

@end

@implementation VCAdmin
@synthesize loginViewController,homeViewController,currentViewController,settingsViewController;


- (instancetype)init
{
    self = [super init];
    if (self){
        self.loginViewController = [[LoginViewController alloc] init];
        self.homeViewController = [[HomeViewController alloc] init];
        self.settingsViewController = [[SettingsViewController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:loginViewController];
    [self addChildViewController:homeViewController];
    [self addChildViewController:settingsViewController];
    
    [self.view addSubview:self.loginViewController.view];
    currentViewController = loginViewController;
    
}





//-----------------------------------由Mediator调用-------------------------------------------------------------
-(void)onShowHomeView
{

    [self transitionFromViewController:currentViewController toViewController:self.homeViewController duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve  animations:^{
    }  completion:^(BOOL finished) {
        if (finished) {
            currentViewController = self.homeViewController;
            
        }else{
           
        }
    }];
}


-(void)onShowLoginView
{
    [self transitionFromViewController:currentViewController toViewController:self.loginViewController duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    }  completion:^(BOOL finished) {
        if (finished) {
            currentViewController = self.loginViewController;
        }
    }];
}

-(void)onShowSettingsView
{
    [self transitionFromViewController:currentViewController toViewController:self.settingsViewController duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    }  completion:^(BOOL finished) {
        if (finished) {
            currentViewController = self.settingsViewController;
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
