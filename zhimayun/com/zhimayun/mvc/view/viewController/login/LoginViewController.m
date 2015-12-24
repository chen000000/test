//
//  LoginViewController.m
//  zhimayun
//
//  Created by zhimayun on 15/11/23.
//  Copyright © 2015年 zhimayun. All rights reserved.
//

#import "LoginViewController.h"
#import "SystemEnum.h"
#import "UIView+Toast.h"
#import "ProgressHUDTool.h"


@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize delegate,mainContainer,activityContainer,indexImage,backGroundImage,nameTextField,passWordTextField,loginButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initComponents];
    
    // Do any additional setup after loading the view.
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
    CGSize appSize = [SystemEnum appSize];
    mainContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, appSize.width, appSize.height)];
    activityContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, appSize.width, appSize.height)];
    
    indexImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, appSize.width, appSize.height)];
    indexImage.image = [UIImage imageNamed:@"Default-568h@2x.png"];
    
    backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, appSize.width, appSize.height)];
    backGroundImage.image = [UIImage imageNamed:@"login_bg.png"];
    
    [self.view addSubview:backGroundImage];
    [self.view addSubview:mainContainer];
    [mainContainer addSubview:activityContainer];
    
    NSInteger logoImageHeight = appSize.height * 0.25;
    NSInteger logoImageWidth = logoImageHeight *0.58;
    UIImageView * logoImage = [[UIImageView alloc] initWithFrame:CGRectMake((appSize.width - logoImageWidth)/2, appSize.height * 0.1, logoImageWidth, logoImageHeight)];
    logoImage.image = [UIImage imageNamed:@"login_logo.png"];
    [activityContainer addSubview:logoImage];
    
    NSInteger userIconHeight = appSize.height * 0.03;
    NSInteger userIcon_y = logoImage.frame.origin.y + logoImage.frame.size.height + appSize.height * 0.05;
    UIImageView * userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(appSize.width*0.25, userIcon_y, userIconHeight, userIconHeight)];
    userIcon.image = [UIImage imageNamed:@"login_user.png"];
    [activityContainer addSubview:userIcon];
    
    NSInteger userLineImage_y = userIcon.frame.origin.y + userIcon.frame.size.height + appSize.height * 0.01;
    NSInteger userLineImageWidth = appSize.width *0.5;
    UIImageView * userLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(appSize.width*0.25, userLineImage_y, userLineImageWidth, appSize.height*0.003)];
    userLineImage.image = [UIImage imageNamed:@"login_textLine.png"];
    [activityContainer addSubview:userLineImage];
    
    NSInteger nameTextField_x = userIcon.frame.origin.x + userIcon.frame.size.width + appSize.width * 0.01;
    NSInteger nameTextFieldWidth = appSize.width *0.5 - userIcon.frame.size.width - appSize.width * 0.01;
    NSInteger nameTextFieldHeight = userIcon.frame.size.height;
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(nameTextField_x, userIcon_y, nameTextFieldWidth, nameTextFieldHeight)];
    [nameTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [nameTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    nameTextField.delegate = self;
    nameTextField.returnKeyType = UIReturnKeyDone;
    nameTextField.textColor = [UIColor whiteColor];
    nameTextField.font = [UIFont systemFontOfSize:15.0f];
    nameTextField.textAlignment = NSTextAlignmentCenter;
    nameTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    nameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0f],NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [activityContainer addSubview:nameTextField];
    
    NSInteger passIcon_y = userIcon.frame.origin.y + userIcon.frame.size.height + appSize.height * 0.05;
    UIImageView * passIcon = [[UIImageView alloc] initWithFrame:CGRectMake(appSize.width*0.25, passIcon_y, userIconHeight, userIconHeight)];
    passIcon.image = [UIImage imageNamed:@"login_pass.png"];
    [activityContainer addSubview:passIcon];
    
    NSInteger passLineImage_y = passIcon.frame.origin.y + passIcon.frame.size.height + appSize.height * 0.01;
    UIImageView * passLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(appSize.width*0.25, passLineImage_y, userLineImageWidth, appSize.height*0.003)];
    passLineImage.image = [UIImage imageNamed:@"login_textLine.png"];
    [activityContainer addSubview:passLineImage];
    
    passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(nameTextField_x, passIcon_y, nameTextFieldWidth, nameTextFieldHeight)];
    [passWordTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [passWordTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    passWordTextField.delegate = self;
    passWordTextField.secureTextEntry=YES;
    passWordTextField.returnKeyType = UIReturnKeyDone;
    passWordTextField.textColor = [UIColor whiteColor];
    passWordTextField.font = [UIFont systemFontOfSize:15.0f];
    passWordTextField.textAlignment = NSTextAlignmentCenter;
    passWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入登录密码" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0f],NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [activityContainer addSubview:passWordTextField];
    
    
    NSInteger loginButtonWidth = appSize.width * 0.35;
    NSInteger loginButtonHeight = loginButtonWidth * 0.23;
    NSInteger loginButton_y = passLineImage.frame.origin.y + appSize.height * 0.035;
    loginButton = [[UIButton alloc] initWithFrame:CGRectMake( (appSize.width - loginButtonWidth)/2, loginButton_y , loginButtonWidth , loginButtonHeight)];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"login_button.png"] forState:UIControlStateNormal];
    [loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [loginButton setTitleColor:[UIColor colorWithRed:50/255.0 green:204/255.0 blue:194/255.0 alpha:1.0f] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(onLogin) forControlEvents:UIControlEventTouchUpInside];
    [activityContainer addSubview:loginButton];
    
    NSInteger forgetPasswordWidth = appSize.width * 0.2;
    NSInteger forgetPasswordHeight = forgetPasswordWidth * 0.23;
    NSInteger forgetPassword_y = loginButton.frame.origin.y + loginButton.frame.size.height + appSize.height * 0.025;
    UIButton * forgetPassword = [[UIButton alloc] initWithFrame:CGRectMake((appSize.width - forgetPasswordWidth)/2,forgetPassword_y,forgetPasswordWidth,forgetPasswordHeight)];
    [forgetPassword setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    forgetPassword.titleLabel.font = [UIFont systemFontOfSize:13.5f];
    [forgetPassword addTarget:self action:@selector(onForgetPassword) forControlEvents:UIControlEventTouchUpInside];
    [mainContainer addSubview:forgetPassword];
    
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    //[self.view addSubview:indexImage];
}


/**
 登入按钮事件函数
 */
-(void)onLogin
{
    BOOL textOk = [self checkText];
    //textOk = YES;
    if(textOk)
    {
        [ProgressHUDTool showWithStatus:@"加载中,请稍后" target:self];
        loginButton.enabled = NO;
        
        [nameTextField resignFirstResponder];
        [passWordTextField resignFirstResponder];
        
        NSMutableDictionary *userInfoDictionary = [[NSMutableDictionary  alloc] init];
        [userInfoDictionary setValue:passWordTextField.text forKey:@"pass"];
        [userInfoDictionary setValue:nameTextField.text  forKey:@"name"];
        
        [delegate sendUserLoginMsg:userInfoDictionary];
    }
}

/**
 忘记密码
 */
-(void)onForgetPassword
{
    
}

/**
 检查用户名，密码输入值
 */
-(BOOL)checkText
{
    if(nameTextField.text.length == 0)
    {
        [self.view makeToast:@"请输入用户名！" duration:1.0 position:CSToastPositionBottom];
        return NO;
    }
    if([nameTextField.text rangeOfString:@" "].location != NSNotFound)
    {
        [self.view makeToast:@"用户名里不能包含空格！" duration:1.0 position:CSToastPositionBottom];
        return NO;
    }
    if(![self mobileRegex:nameTextField.text])
    {
        [self.view makeToast:@"用户名格式不正确！" duration:1.0 position:CSToastPositionBottom];
        return NO;
    }
    if(passWordTextField.text.length == 0)
    {
        [self.view makeToast:@"密码不能为空！" duration:1.0 position:CSToastPositionBottom];
        return NO;
    }
    if([passWordTextField.text rangeOfString:@" "].location != NSNotFound)
    {
        [self.view makeToast:@"密码里不能包含空格！" duration:1.0 position:CSToastPositionBottom];
        return NO;
    }
    if(passWordTextField.text.length < 6)
    {
        [self.view makeToast:@"密码长度不能少于6位！" duration:1.0 position:CSToastPositionBottom];
        return NO;
    }
    if(![self isIncludeLetterOrNum:passWordTextField.text])
    {
         [self.view makeToast:@"密码只能由数字和字母组成！" duration:1.0 position:CSToastPositionBottom];
        return NO;
    }
    
    return YES;
}


/**
 检查电话号码格式
 */
-(BOOL)mobileRegex:(NSString *)mobile
{
    NSString *regex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *regexDic = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexDic evaluateWithObject:mobile];
}

/**
 是否由数字和字母组成
 */
-(BOOL)isIncludeLetterOrNum:(NSString *)mobile
{
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *regexDic = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexDic evaluateWithObject:mobile];
    
}


/**
 代理函数，点return键盘弹下去
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

/**
 键盘出现或改变时事件函数
 */
- (void)keyboardShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    
    
    CGRect loginButtonFrame = loginButton.frame;
    CGRect containerFrame = activityContainer.frame;
    CGSize appSize = [SystemEnum appSize];
    
    NSInteger keyboard_y = appSize.height - height;
    NSInteger loginButton_y = loginButtonFrame.origin.y + loginButtonFrame.size.height + appSize.height * 0.025;
    
    if(keyboard_y < loginButton_y)
    {
        NSInteger offset = loginButton_y - keyboard_y;
        containerFrame.origin.y = 0 - offset;
        activityContainer.frame = containerFrame;
    }
}

/**
 键盘退出时事件函数
 */
- (void)keyboardHide:(NSNotification *)aNotification
{
     CGRect containerFrame = activityContainer.frame;
     containerFrame.origin.y = 0;
     activityContainer.frame = containerFrame;
}


//-----------------------------------由Mediator调用-------------------------------------------------------------

-(void)onLoginSuccess
{
   [ProgressHUDTool remove];
   loginButton.enabled = YES;
}

-(void)onLoginFail:(NSString *) failLabel
{
    [ProgressHUDTool remove];
    [self.view makeToast:failLabel duration:1.0 position:CSToastPositionBottom];
    loginButton.enabled = YES;
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
