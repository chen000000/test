//
//  ProgressHUDTool.m
//  zhimayun
//
//  Created by zhimayun on 15/11/25.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "ProgressHUDTool.h"
#import "SystemEnum.h"

static UIFont * progressHUDFont;

@implementation ProgressHUDTool



+ (void)showWithStatus: (NSString *)status target:(id)targetDelegate
{
    UIViewController * target  =  targetDelegate;
    UIView * hudView = [self sharedHudView];
    GifView * loadingView = [self sharedLoadingView];
    UILabel * stringLabel = [self sharedStringLabel];
    UIView * container = [self sharedContainer];
    stringLabel.text = status;
    //container.userInteractionEnabled = NO;
    [target.view addSubview:container];
    [container addSubview:hudView];
    [hudView addSubview:loadingView];
    [hudView addSubview:stringLabel];
    
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"progressHUD" ofType:@"gif"]];
    [loadingView data:localData];
}

+ (void)remove
{
    GifView * loadingView = [self sharedLoadingView];
    UIView * container = [self sharedContainer];
    UILabel * stringLabel = [self sharedStringLabel];
    stringLabel.text = @"";
    [loadingView stop];
    [container removeFromSuperview];
}


+(GifView *)sharedLoadingView
{
    static GifView * loadingView;
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        UIView * hudView = [self sharedHudView];
        NSInteger width = hudView.frame.size.height * 0.6;
        NSInteger height = width;
        NSInteger x = (hudView.frame.size.width - width)/2;
        NSInteger y = hudView.frame.size.height * 0.1;
        loadingView = [[GifView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        
    });
    return loadingView;
}

+(UILabel *)sharedStringLabel
{
    static UILabel * stringLabel;
    static dispatch_once_t once;
     dispatch_once(&once, ^ {
         UIView * hudView = [self sharedHudView];
         NSInteger width = hudView.frame.size.width;
         NSInteger height = hudView.frame.size.height * 0.3;
         NSInteger x = 0;
         NSInteger y = hudView.frame.size.height * 0.7;
    
         stringLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
         //stringLabel.backgroundColor = [UIColor clearColor];
         stringLabel.adjustsFontSizeToFitWidth = YES;
         stringLabel.textAlignment = NSTextAlignmentCenter;
         stringLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
         stringLabel.numberOfLines = 0;
         if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
         {
             stringLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
         }
         else
         {
             stringLabel.font = [UIFont systemFontOfSize:14.0f];
         }
         stringLabel.textColor = [UIColor blackColor];
         
     });
                   
    return  stringLabel;
}


+(UIView *)sharedHudView
{
    static UIView * hudView;
    static dispatch_once_t once;
     dispatch_once(&once, ^ {
         
         CGSize appSize = [SystemEnum appSize];
         NSInteger width = appSize.width * 0.5;
         NSInteger height = width * 0.7;
         NSInteger x = appSize.width * 0.25;
         NSInteger y = (appSize.height - height)/2;
         
         hudView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
         hudView.backgroundColor = [UIColor whiteColor];
         hudView.layer.cornerRadius = 14;
         hudView.layer.masksToBounds = YES;
         
    });
    
    return hudView;
}


+(UIView *)sharedContainer;
{
    static UIView * container;
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        container = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        container.backgroundColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:0.4];
        
    });
    return container;
}


@end
