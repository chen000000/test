//
//  SettingsViewController.h
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "BasePageController.h"

@protocol SettingsViewControllerDelegate

  -(void)showHome;

@end

@interface SettingsViewController : BasePageController



/**设置代理**/
@property (strong, nonatomic)  id<SettingsViewControllerDelegate> delegate;

@end
