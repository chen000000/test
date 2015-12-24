//
//  BaseMsg.m
//  PureMvcDemo1
//
//  Created by zhimayun on 15/11/17.
//
//

#import "BaseMsg.h"

@implementation BaseMsg
@synthesize data;



+(NSString *)NAME {
    return @"Please write the msg name";
}

-(void)send
{
    [AFNetworkTool postJSONWithBlock:[[self class] NAME] parameters:self.data block:^(id postData, NSError *error) {
        if(!error)
        {
            [self callBackBlock:postData];
        }
    }];
}

-(void)callBackBlock:(id)postData
{
    NSLog(@"Please write the %@ block",[[self class] NAME]);
}

@end
