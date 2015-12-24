//
//  NetManager.h
//  PureMvcDemo1
//
//  Created by zhimayun on 15/11/17.
//
//

#import "Facade.h"
#import "BaseMsg.h"

@interface NetManager : Facade

+(void)send:(BaseMsg*) msg;

@end
