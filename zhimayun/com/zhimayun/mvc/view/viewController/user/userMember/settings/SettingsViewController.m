//
//  SettingsViewController.m
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 初始化界面上的组件
 */
-(void)initComponents
{
    [super initComponents];
    self.bodyContainer.backgroundColor = [UIColor whiteColor];
    [self setPageTitle:@"设置"];
    [self setPageBackButton:@"返回"];
}


/**
 返回按钮点击函数
 */
-(void)returnFromPage:(UIButton *)button
{
    [delegate showHome];
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
