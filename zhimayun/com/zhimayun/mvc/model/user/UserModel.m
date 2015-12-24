//
//  UserModel.m
//  zhimayun
//
//  Created by zhimayun on 15/11/26.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
@synthesize name,password,accountId,mobilePhone;

+(NSString *)NAME {
    return @"UserModel";
}

-(void)initializeProxy {
    [super initializeProxy];
    self.proxyName = [UserModel NAME];
}

//-(NSString *)accountId
//{
//    return accountId;
//}
//
//
//-(void)setAccountId:(NSString *)accountId
//{
//}

@end
