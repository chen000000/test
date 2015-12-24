//
//  BasePageController.m
//  zhimayun
//
//  Created by zhimayun on 15/12/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "BasePageController.h"
#import "SystemEnum.h"
#import "StringTool.h"

@interface BasePageController ()

@end

@implementation BasePageController
@synthesize mainContainer,bodyContainer,backButton,backButtonIcon,backButtonLabel,titleLabel,titleHeight;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initComponents];
}



/**
 初始化界面上的组件
 */
-(void)initComponents
{
    CGSize appSize = [SystemEnum appSize];
    mainContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, appSize.width, appSize.height)];
    mainContainer.backgroundColor = DefaultColor;
    [self.view addSubview:mainContainer];
    
    titleHeight = appSize.height * 0.08;
    NSInteger bodyContainerHeight = appSize.height - titleHeight;
    bodyContainer = [[UIView alloc] initWithFrame:CGRectMake(0, titleHeight, appSize.width, bodyContainerHeight)];
    [mainContainer addSubview:bodyContainer];
}

/**
 设置标题
 */
-(void)setPageTitle:(NSString *)title
{
    CGSize appSize = [SystemEnum appSize];
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = title;
    titleLabel.textColor = DefaultGrey;
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
    {
        titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
        CGSize size = [StringTool boundingRectWithSize:CGSizeMake(0, 0) UILabel:titleLabel];
        NSInteger titleLabel_x = (appSize.width - size.width)/2;
        NSInteger titleLabel_y = (titleHeight - 20 - size.height)/2+20;
        titleLabel.frame = CGRectMake(titleLabel_x, titleLabel_y, size.width, size.height);
    }
    else
    {
        titleLabel.font = [UIFont systemFontOfSize:20.0f];
        CGSize size = [StringTool boundingRectWithSizeForIos6:CGSizeMake(0, 0) UILabel:titleLabel];
        NSInteger titleLabel_x = (appSize.width - size.width)/2;
        titleLabel.frame = CGRectMake(titleLabel_x, 20, size.width, size.height);
    }
    [mainContainer addSubview:titleLabel];
}


/**
 设置返回按钮
 */
-(void)setPageBackButton:(NSString *)title
{
    CGSize appSize = [SystemEnum appSize];
    NSInteger backButtonIconHeight = (titleHeight - 20) * 0.6;
    NSInteger backButtonIconWidth = backButtonIconHeight * 0.55;
    NSInteger backButtonIcon_y = (titleHeight - 20 - backButtonIconHeight)/2+20;
    NSInteger backButtonIcon_x = appSize.width * 0.03;
    backButtonIcon = [[UIImageView alloc] initWithFrame:CGRectMake(backButtonIcon_x, backButtonIcon_y, backButtonIconWidth, backButtonIconHeight)];
    backButtonIcon.backgroundColor = [UIColor clearColor];
    backButtonIcon.image = [UIImage imageNamed:@"backButton_icon.png"];
    [mainContainer addSubview:backButtonIcon];
    
    
    NSInteger backButtonLabel_x = backButtonIcon_x + backButtonIconWidth + appSize.height * 0.01;
    backButtonLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    backButtonLabel.text = title;
    backButtonLabel.textColor = [UIColor whiteColor];
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
    {
        backButtonLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        CGSize size = [StringTool boundingRectWithSize:CGSizeMake(0, 0) UILabel:backButtonLabel];
        NSInteger backButtonLabel_y = (titleHeight - 20 - size.height)/2+20;
        backButtonLabel.frame = CGRectMake(backButtonLabel_x, backButtonLabel_y, size.width, size.height);
    }
    else
    {
        backButtonLabel.font = [UIFont systemFontOfSize:20.0f];
        CGSize size = [StringTool boundingRectWithSizeForIos6:CGSizeMake(0, 0) UILabel:backButtonLabel];
        NSInteger backButtonLabel_x = (appSize.width - size.width)/2;
        titleLabel.frame = CGRectMake(backButtonLabel_x, 20, size.width, size.height);
    }
     [mainContainer addSubview:backButtonLabel];
    
    
    NSInteger backButtonHeight = titleHeight;
    NSInteger backButtonWidth = backButtonLabel_x + backButtonLabel.frame.size.width + appSize.height * 0.03;
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, backButtonWidth ,backButtonHeight);
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(returnFromPage:) forControlEvents:UIControlEventTouchUpInside];
    [mainContainer addSubview:backButton];
    
    NSInteger body_y = appSize.height * 0.08;
    bodyContainer = [[UIView alloc] initWithFrame:CGRectMake(0, body_y, appSize.width, appSize.height)];
    [mainContainer addSubview:bodyContainer];
}


/**
 返回按钮点击函数
 */
-(void)returnFromPage:(UIButton *)button
{
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
