//
//  UserMemberViewController.m
//  zhimayun
//
//  Created by zhimayun on 15/12/22.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "UserMemberViewController.h"
#import "SystemEnum.h"
#import "StringTool.h"

@interface UserMemberViewController ()

@end

@implementation UserMemberViewController
@synthesize delegate,memberTable,memberIDButton,memberReviewButton,tableSectionsList,iconItemsList;

- (instancetype)init
{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
    
}

/**
 初始化数据
 */
-(void)initData
{
    tableSectionsList = @[@[@"我的小区",@"开门记录"],@[@"活动中心",@"邀请家人"],@[@"设置",@"关于芝麻云",@"操作流程演示"]];
    iconItemsList = @[@[@"member_villageIcon.png",@"member_openHistoryIcon.png"],@[@"member_activityIcon.png",@"member_inviteIcon.png"],@[@"member_settingIcon.png",@"member_aboutIcon.png",@"member_demonstratedIcon.png"]];
}


/**
 初始化界面上的组件
 */
-(void)initComponents
{
    [super initComponents];
    CGSize appSize = [SystemEnum appSize];
    self.bodyContainer.backgroundColor = [UIColor whiteColor];
    [self setPageTitle:@"我"];
    
//---------------------------------用户中心Table表---------------------------------------------------------------------------------------
    NSInteger titleHeight = appSize.height * 0.08;
    NSInteger memberTableHeight = appSize.height - titleHeight;
    memberTable = [[UITableView alloc] initWithFrame:CGRectMake(0,0,appSize.width,memberTableHeight) style:UITableViewStyleGrouped];
    memberTable.delegate = self;
    memberTable.dataSource = self;
    memberTable.showsHorizontalScrollIndicator = NO;
    memberTable.showsVerticalScrollIndicator = NO;
    memberTable.backgroundColor = DefaultGrey;
    memberTable.bounces = YES;
    [self.bodyContainer addSubview:memberTable];
    
//---------------------------------Table表的tableHeaderView视图---------------------------------------------------------------------------------------
    UIView * tableHeader = [[UIView alloc] init];
    
    NSInteger headerBackGroundImageHeight =  memberTable.frame.size.width * 0.37;
    UIImageView *  headerBackGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, memberTable.frame.size.width, headerBackGroundImageHeight)];
    headerBackGroundImage.backgroundColor = [UIColor clearColor];
    headerBackGroundImage.image = [UIImage imageNamed:@"member_headerBg.png"];
    [tableHeader addSubview:headerBackGroundImage];
   
    NSInteger memberIDAndReviewHeight = headerBackGroundImageHeight * 0.4;
    NSInteger memberID_y = headerBackGroundImageHeight;
    UIView * memberIDAndReview = [[UIView alloc] initWithFrame:CGRectMake(0, memberID_y, memberTable.frame.size.width, memberIDAndReviewHeight)];
    memberIDAndReview.backgroundColor = [UIColor whiteColor];
    [tableHeader addSubview:memberIDAndReview];
    
    UIView * cutOffLine = [[UIView alloc] initWithFrame:CGRectMake(memberTable.frame.size.width/2, 0, 0.5, memberIDAndReviewHeight)];
    cutOffLine.backgroundColor = DefaultLine;
    [memberIDAndReview addSubview:cutOffLine];
    
    NSInteger memberIDIcon_x;
    NSInteger memberIDIconHeight = memberIDAndReview.frame.size.height * 0.6;
    NSInteger memberIDIcon_y = (memberIDAndReview.frame.size.height - memberIDIconHeight)/2;
    UIImageView * memberIDIcon = [[UIImageView alloc] init];
    memberIDIcon.backgroundColor = [UIColor clearColor];
    memberIDIcon.image = [UIImage imageNamed:@"member_IDIcon.png"];
    [memberIDAndReview addSubview:memberIDIcon];
    
    CGSize memberIDLabelSize;
    NSInteger memberIDLabel_x;
    UILabel * memberIDLabel = [[UILabel alloc] init];
    memberIDLabel.text = @"个人信息";
    memberIDLabel.textColor = [UIColor blackColor];
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
    {
        memberIDLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        memberIDLabelSize = [StringTool boundingRectWithSize:CGSizeMake(0, 0) UILabel:memberIDLabel];
    }
    else
    {
        memberIDLabel.font = [UIFont systemFontOfSize:13.5f];
        memberIDLabelSize = [StringTool boundingRectWithSizeForIos6:CGSizeMake(0, 0) UILabel:memberIDLabel];
    }
    memberIDIcon_x = (memberIDAndReview.frame.size.width /2  - (memberIDIconHeight + memberIDLabelSize.width + memberIDAndReview.frame.size.width*0.025))/2;
    memberIDLabel_x = memberIDIcon_x + memberIDIconHeight + memberIDAndReview.frame.size.width*0.025;
    memberIDIcon.frame = CGRectMake(memberIDIcon_x, memberIDIcon_y, memberIDIconHeight, memberIDIconHeight);
    memberIDLabel.frame =  CGRectMake(memberIDLabel_x, (memberIDAndReview.frame.size.height - memberIDLabelSize.height)/2, memberIDLabelSize.width, memberIDLabelSize.height);
    [memberIDAndReview addSubview:memberIDLabel];
    
    
    NSInteger memberReviewIcon_x;
    UIImageView * memberReviewIcon = [[UIImageView alloc] init];
    memberReviewIcon.backgroundColor = [UIColor clearColor];
    memberReviewIcon.image = [UIImage imageNamed:@"member_ReviewIcon.png"];
    [memberIDAndReview addSubview:memberReviewIcon];
    
    CGSize memberReviewLabelSize;
    NSInteger memberReviewLabel_x;
    UILabel * memberReviewLabel = [[UILabel alloc] init];
    memberReviewLabel.text = @"身份认证";
    memberReviewLabel.textColor = [UIColor blackColor];
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
    {
        memberReviewLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        memberReviewLabelSize = [StringTool boundingRectWithSize:CGSizeMake(0, 0) UILabel:memberReviewLabel];
    }
    else
    {
        memberReviewLabel.font = [UIFont systemFontOfSize:13.5f];
        memberReviewLabelSize = [StringTool boundingRectWithSizeForIos6:CGSizeMake(0, 0) UILabel:memberReviewLabel];
    }
    memberReviewIcon_x = memberIDAndReview.frame.size.width /2 +(memberIDAndReview.frame.size.width /2  - (memberIDIconHeight + memberReviewLabelSize.width + memberIDAndReview.frame.size.width*0.025))/2;
    memberReviewLabel_x = memberReviewIcon_x + memberIDIconHeight + memberIDAndReview.frame.size.width*0.025;
    memberReviewIcon.frame = CGRectMake(memberReviewIcon_x, memberIDIcon_y, memberIDIconHeight, memberIDIconHeight);
    memberReviewLabel.frame =  CGRectMake(memberReviewLabel_x, (memberIDAndReview.frame.size.height - memberReviewLabelSize.height)/2, memberReviewLabelSize.width, memberReviewLabelSize.height);
    [memberIDAndReview addSubview:memberReviewLabel];
    
    
    NSInteger memberIDButtonWidth = memberIDAndReview.frame.size.width /2;
    NSInteger memberIDButtonHeight = memberIDAndReview.frame.size.height;
    memberIDButton = [UIButton buttonWithType:UIButtonTypeCustom];
    memberIDButton.frame = CGRectMake(0, 0, memberIDButtonWidth ,memberIDButtonHeight);
    memberIDButton.showsTouchWhenHighlighted = YES;
    [memberIDButton addTarget:self action:@selector(memberIDButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [memberIDAndReview addSubview:memberIDButton];
    
    NSInteger memberReviewButton_x = memberIDAndReview.frame.size.width /2;
    memberReviewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    memberReviewButton.frame = CGRectMake(memberReviewButton_x, 0, memberIDButtonWidth ,memberIDButtonHeight);
    memberReviewButton.showsTouchWhenHighlighted = YES;
    [memberReviewButton addTarget:self action:@selector(memberIDButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [memberIDAndReview addSubview:memberReviewButton];
    
    tableHeader.frame = CGRectMake(0, 0, memberTable.frame.size.width, headerBackGroundImageHeight + memberIDAndReviewHeight);
    memberTable.tableHeaderView = tableHeader;
    
}

//-------------------TableView代理借口实现-----------------------------------------------------------------------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return tableSectionsList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)[tableSectionsList objectAtIndex:section]).count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return memberTable.frame.size.height*0.02;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==2) {
        return memberTable.frame.size.height * 0.2;
    }else{
        return 0.0001f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return memberTable.frame.size.height*0.07;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSInteger iconHeight = cell.frame.size.height * 0.6;
    NSInteger icon_x = cell.frame.size.width * 0.1;
    NSInteger icon_y = (cell.frame.size.height - iconHeight)/2;
    UIImageView * icon = [[UIImageView alloc] init];
    icon.image = [UIImage imageNamed:iconItemsList[indexPath.section][indexPath.row]];
    icon.frame = CGRectMake(icon_x,icon_y, iconHeight, iconHeight);
    [cell addSubview:icon];
    
    CGSize cellTextSize;
    NSInteger cellText_x = cell.frame.size.width *0.05 + icon_x + iconHeight;
    UILabel * cellText = [[UILabel alloc] init];
    cellText.text = tableSectionsList[indexPath.section][indexPath.row];
    cellText.textColor = DefaultBlack;
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)])
    {
        cellText.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        cellTextSize = [StringTool boundingRectWithSize:CGSizeMake(0, 0) UILabel:cellText];
    }
    else
    {
        cellText.font = [UIFont systemFontOfSize:13.5f];
        cellTextSize = [StringTool boundingRectWithSizeForIos6:CGSizeMake(0, 0) UILabel:cellText];
    }
    cellText.frame = CGRectMake(cellText_x, (cell.frame.size.height - cellTextSize.height)/2, cellTextSize.width, cellTextSize.height);
    [cell addSubview:cellText];
    
   return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //我的小区
    if (indexPath.section==0&&indexPath.row==0) {
        
    }
    
    //  开门记录
    if (indexPath.section==0&&indexPath.row==1) {
        
    }
    
    //  活动中心
    if(indexPath.section == 1 && indexPath.row == 0)
    {
        
    }
    
    //  邀请家人
    if(indexPath.section == 1&&indexPath.row==1)
    {
        
    }
    
    //  设置
    if(indexPath.section == 2 && indexPath.row == 0)
    {
        [delegate showSettings];
    }
    
    //  关于芝麻云
    if (indexPath.section==2&&indexPath.row==1)
    {
        
    }
    
    //操作流程演示
    if (indexPath.section==2&&indexPath.row==2)
    {
        
    }
}


/**
 身份认证按钮点击函数
 */
-(void)memberIDButtonClick:(UIButton *)button
{
    if([button isEqual:memberIDButton])
    {
        
        
    }
    else if([button isEqual:memberReviewButton])
    {
        
        
    }
}

//-----------------------------------由Mediator调用-------------------------------------------------------------




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
