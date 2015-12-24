//
//  UserModel.h
//  zhimayun
//
//  Created by zhimayun on 15/11/26.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Proxy.h"

@interface UserModel : Proxy
{
    
}

/**用户名字**/
@property (strong, nonatomic) NSString * name;

/**用户密码**/
@property (strong, nonatomic) NSString * password;

/**账户ID**/
@property (strong, nonatomic) NSString * accountId;

/**手机号码**/
@property (strong, nonatomic) NSString * mobilePhone;




@end
