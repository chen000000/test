//
//  BaseMsg.h
//  PureMvcDemo1
//
//  Created by zhimayun on 15/11/17.
//
//

#import "SimpleCommand.h"
#import "AFNetworkTool.h"
#import "ApplicationFacade.h"

@interface BaseMsg : SimpleCommand


+(NSString *)NAME;

@property NSDictionary * data;

-(void)send;

-(void)callBackBlock:(id)postData;

@end
