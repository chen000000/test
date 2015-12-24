//
//  UserMemberViewController.h
//  zhimayun
//
//  Created by zhimayun on 15/12/22.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageController.h"

@protocol UserMemberViewControllerDelegate

   -(void)showSettings;

@end


@interface UserMemberViewController : BasePageController<UITableViewDataSource,UITableViewDelegate>
{
    
}

/**用户中心相关表**/
@property (strong, nonatomic) UITableView * memberTable;

/**个人信息按钮**/
@property (strong, nonatomic) UIButton * memberIDButton;

/**身份认证按钮**/
@property (strong, nonatomic) UIButton * memberReviewButton;

/**列表Sections数据**/
@property (strong, nonatomic) NSArray * tableSectionsList;

/**icon图片表**/
@property (strong, nonatomic) NSArray * iconItemsList;

/**设置代理**/
@property (strong, nonatomic)  id<UserMemberViewControllerDelegate> delegate;


@end
