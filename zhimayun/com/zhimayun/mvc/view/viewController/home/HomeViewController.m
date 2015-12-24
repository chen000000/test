//
//  HomeViewController.m
//  zhimayun
//
//  Created by zhimayun on 15/12/21.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "HomeViewController.h"
#import "SystemEnum.h"
#import "StringTool.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize delegate,pageContainer,itemsBarContainer,propertyLabel,meLabel,propertyIcon,meIcon,propertyTabButton,meTabButton,lockTabButton,userAdmin;

- (instancetype)init
{
    self = [super init];
    if (self){
        self.userAdmin = [[UserAdmin alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


/**
 初始化界面上的组件
 */
-(void)initComponents
{
    [super initComponents];
    self.bodyContainer.backgroundColor = DefaultGrey;
    
    CGSize appSize = [SystemEnum appSize];
    NSInteger itemsBarContainerHeight = appSize.width * 0.24;
    pageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, appSize.width, appSize.height)];
    [self.mainContainer addSubview:pageContainer];
    
//---------------------------------------------底部分栏---------------------------------------------------------------------------------------------------------
    itemsBarContainer = [[UIView alloc] initWithFrame:CGRectMake(0, appSize.height-itemsBarContainerHeight, appSize.width, itemsBarContainerHeight)];
    [self.mainContainer addSubview:itemsBarContainer];
    UIImageView * itemsBarBackImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, appSize.width, itemsBarContainerHeight)];
    itemsBarBackImage.image = [UIImage imageNamed:@"home_itemsBarBg.png"];
    [itemsBarContainer addSubview:itemsBarBackImage];
    
    
    NSInteger labelWidth;
    NSInteger labelHeight;
    NSInteger label_y = itemsBarBackImage.frame.size.height * 0.58;
    NSInteger propertyLabel_x = appSize.width * 0.09;
    propertyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    propertyLabel.text = @"物业  Property";
    //propertyLabel.adjustsFontSizeToFitWidth = YES;
    propertyLabel.textColor = [UIColor blackColor];
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
    {
        propertyLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        CGSize size = [StringTool boundingRectWithSize:CGSizeMake(0, 0) UILabel:propertyLabel];
        propertyLabel.frame = CGRectMake(propertyLabel_x, label_y, size.width, size.height);
        labelWidth = size.width;
        labelHeight = size.height;
    }
    else
    {
        propertyLabel.font = [UIFont systemFontOfSize:13.5f];
        CGSize size = [StringTool boundingRectWithSizeForIos6:CGSizeMake(0, 0) UILabel:propertyLabel];
        propertyLabel.frame = CGRectMake(propertyLabel_x, label_y, size.width, size.height);
        labelWidth = size.width;
        labelHeight = size.height;
    }
    [itemsBarContainer addSubview:propertyLabel];
    
    
    NSInteger iconWidth = appSize.width * 0.06;
    NSInteger iconHeight = iconWidth * 0.68;
    NSInteger icon_y = label_y + (labelHeight - iconHeight)/2;
    NSInteger propertyIcon_x = appSize.width * 0.02;
    propertyIcon = [[UIImageView alloc] initWithFrame:CGRectMake(propertyIcon_x, icon_y, iconWidth, iconHeight)];
    propertyIcon.backgroundColor = [UIColor clearColor];
    propertyIcon.image = [UIImage imageNamed:@"home_propertyIcon.png"];
    [itemsBarContainer addSubview:propertyIcon];
    
    NSInteger tabButtonHeight = itemsBarBackImage.frame.size.height * 0.7;
    NSInteger tabButton_y = itemsBarBackImage.frame.size.height - tabButtonHeight;
    propertyTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    propertyTabButton.frame = CGRectMake(0, tabButton_y, propertyLabel_x + labelWidth ,tabButtonHeight);
    propertyTabButton.showsTouchWhenHighlighted = YES;
    [propertyTabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [itemsBarContainer addSubview:propertyTabButton];
    
    
    icon_y = label_y + (labelHeight - iconHeight)/2;
    NSInteger meIconIcon_x = appSize.width * 0.7;
    meIcon = [[UIImageView alloc] initWithFrame:CGRectMake(meIconIcon_x, icon_y, iconHeight, iconHeight)];
    meIcon.backgroundColor = [UIColor clearColor];
    meIcon.image = [UIImage imageNamed:@"home_meIcon.png"];
    [itemsBarContainer addSubview:meIcon];
    
    
    NSInteger meLabel_x = meIconIcon_x + iconHeight + appSize.width * 0.015;
    meLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    meLabel.text = @"我  Me";
    meLabel.textColor = [UIColor blackColor];
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
    {
        meLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        CGSize size = [StringTool boundingRectWithSize:CGSizeMake(0, 0) UILabel:meLabel];
        meLabel.frame = CGRectMake(meLabel_x, label_y, size.width, size.height);
        labelWidth = size.width;
    }
    else
    {
        meLabel.font = [UIFont systemFontOfSize:13.5f];
        CGSize size = [StringTool boundingRectWithSizeForIos6:CGSizeMake(0, 0) UILabel:meLabel];
        meLabel.frame = CGRectMake(meLabel_x, label_y, size.width, size.height);
        labelWidth = size.width;
    }
    [itemsBarContainer addSubview:meLabel];
    
    
    meTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    meTabButton.frame = CGRectMake(meIconIcon_x, tabButton_y, meLabel_x + labelWidth ,tabButtonHeight);
    meTabButton.showsTouchWhenHighlighted = YES;
    [meTabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [itemsBarContainer addSubview:meTabButton];
    
    
    NSInteger lockTabButton_y = itemsBarBackImage.frame.size.height * 0.18;
    NSInteger lockTabButtonHeight = itemsBarBackImage.frame.size.height * 0.78;
    NSInteger lockTabButton_x = (itemsBarBackImage.frame.size.width - lockTabButtonHeight)/2;
    lockTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lockTabButton.frame = CGRectMake(lockTabButton_x, lockTabButton_y, lockTabButtonHeight ,lockTabButtonHeight);
    lockTabButton.backgroundColor = [UIColor clearColor];
    [lockTabButton setBackgroundImage:[UIImage imageNamed:@"home_lockTabIcon.png"] forState:UIControlStateNormal];
    [lockTabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [itemsBarContainer addSubview:lockTabButton];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

/**
 tabButton分页按钮点击函数
 */
-(void)tabButtonClick:(UIButton *)button
{
    if([button isEqual:propertyTabButton])
    {
       propertyLabel.textColor = DefaultColor;
       meLabel.textColor = [UIColor blackColor];
       propertyIcon.image = [UIImage imageNamed:@"home_propertyIconSelected.png"];
       meIcon.image = [UIImage imageNamed:@"home_meIcon.png"];
       [delegate showPropertyAdmin];
    }
    else if([button isEqual:meTabButton])
    {
        meLabel.textColor = DefaultColor;
        propertyLabel.textColor = [UIColor blackColor];
        meIcon.image = [UIImage imageNamed:@"home_meIconSelected.png"];
        propertyIcon.image = [UIImage imageNamed:@"home_propertyIcon.png"];
        [delegate showUserAdmin];
    }
    else if([button isEqual:lockTabButton])
    {
        meLabel.textColor = [UIColor blackColor];
        propertyLabel.textColor = [UIColor blackColor];
        meIcon.image = [UIImage imageNamed:@"home_meIcon.png"];
        propertyIcon.image = [UIImage imageNamed:@"home_propertyIcon.png"];
        [delegate showDoorKeysAdmin];
    }
    
}


//-----------------------------------由Mediator调用-------------------------------------------------------------

-(void)onShow
{
    
}

-(void)onShowUserAdmin
{
    for (UIView *subview in self.pageContainer.subviews)
    {
        [subview removeFromSuperview];
    }
    [self.pageContainer addSubview:self.userAdmin.view];
}

-(void)onShowDoorKeysAdmin
{
    for (UIView *subview in self.pageContainer.subviews)
    {
        [subview removeFromSuperview];
    }
}

-(void)onShowPropertyAdmin
{
    for (UIView *subview in self.pageContainer.subviews)
    {
        [subview removeFromSuperview];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
