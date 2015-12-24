//
//  SystemEnum.m
//  zhimayun
//
//  Created by zhimayun on 15/11/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "SystemEnum.h"

@implementation SystemEnum

+(CGSize)appSize
{
    
    CGRect bounds = [UIScreen mainScreen].bounds ;
    CGSize size;
    NSInteger applicationWidth;
    NSInteger applicationHeight;
    
//    if(bounds.size.height <  bounds.size.width)
//    {
//        applicationWidth =  bounds.size.width;
//        applicationHeight =  bounds.size.height;
//    }
//    else
//    {
//        applicationWidth =  bounds.size.height;
//        applicationHeight =  bounds.size.width;
//    }
    
    applicationWidth =  bounds.size.width;
    applicationHeight =  bounds.size.height;
    
    size = CGSizeMake(applicationWidth, applicationHeight);
    return size;
}

@end
