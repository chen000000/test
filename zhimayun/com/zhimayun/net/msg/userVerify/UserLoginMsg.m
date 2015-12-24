//
//  UserLoginMsg.m
//  zhimayun
//
//  Created by zhimayun on 15/11/26.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "UserLoginMsg.h"
#import "UserModel.h"

@implementation UserLoginMsg

+(NSString *)NAME {
    return @"SheQuApi/userLogin";
}

-(void)execute:(id<INotification>)notification {
    
    self.data = [notification body];
    [self send];
    //[facade sendNotification:LoginSuccess body:nil];
}



-(void)callBackBlock:(id)postData
{
    NSString * message  = [postData valueForKeyPath:@"messageValue"];
    if(message != nil)
    {
         [facade sendNotification:LoginFail body:message];
    }
    else
    {
        NSString * address = [postData valueForKeyPath:@"CurrenAddress"];
        
        UserModel * userModel = (UserModel *)[facade retrieveProxy:[UserModel NAME]];
        userModel.name = [postData valueForKeyPath:@"trueName"];
        userModel.accountId = [postData valueForKeyPath:@"userName"];
        userModel.mobilePhone = [postData valueForKeyPath:@"phone"];
        
        
        [facade sendNotification:LoginSuccess body:nil];
        
        NSLog(@"%@",userModel.accountId);
    }
    
}

@end
