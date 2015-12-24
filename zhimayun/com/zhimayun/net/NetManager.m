//
//  NetManager.m
//  PureMvcDemo1
//
//  Created by zhimayun on 15/11/17.
//
//

#import "NetManager.h"

@implementation NetManager


+(void)send:(BaseMsg*) msg
{
    //BaseMsg * baseMsg = msg;
    
    [[NetManager getInstance] registerCommand:[[msg class] NAME] commandClassRef:[msg class]];
    [[NetManager getInstance] sendNotification:[[msg class] NAME] body:msg.data];
    
}


@end
