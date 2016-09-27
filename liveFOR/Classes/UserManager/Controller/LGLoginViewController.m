//
//  LGLoginViewController.m
//  liveFOR
//
//  Created by lingo on 16/5/22.
//  Copyright © 2016年 lingo. All rights reserved.
//

#import "LGLoginViewController.h"
#import "LGTabBarController.h"
#import "LGNavController.h"
#import <Masonry.h>
/**
 *  百度api
 */
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件

#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件

#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件

#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件

#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件

#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

@interface LGLoginViewController ()<UITextFieldDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>

/** imgContent */
@property (nonatomic, weak) UIImageView *loginImgContent;
/** leftHand */
@property (nonatomic, weak) UIImageView *leftHand;
/** rightHand */
@property (nonatomic, weak) UIImageView *rightHand;
/** leftArm */
@property (nonatomic, weak) UIImageView *leftArm;
/** rightArm */
@property (nonatomic, weak) UIImageView *rightArm;
/** loginContent */
@property (nonatomic, weak) UIView *loginContent;
/** userTextField */
@property (nonatomic, weak) UITextField *userAccountTF;
/** userPassword */
@property (nonatomic, weak) UITextField *userPasswordTF;
/** loginbtn */
@property (nonatomic, weak) UIButton *loginBtn;
/** baiduServer */
@property (nonatomic, strong) BMKLocationService *locationService;
/**  */
@property (nonatomic, strong) BMKGeoCodeSearch *geoCode;

@end

@implementation LGLoginViewController
- (BMKGeoCodeSearch *)geoCode
{
    if (!_geoCode) {
        _geoCode = [[BMKGeoCodeSearch alloc] init];
        _geoCode.delegate = self;
    }
    return _geoCode;
}

- (void)dealloc
{
    _geoCode.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    /** 确认父子关系 */
    //imgContent
    UIImageView *loginImgContent = [[UIImageView alloc] init];
    self.loginImgContent = loginImgContent;
    loginImgContent.image = [UIImage imageNamed:@"owl-login"];
    [self.view addSubview:loginImgContent];
    
   //leftHand
    UIImageView *leftHand = [[UIImageView alloc] init];
    leftHand.image = [UIImage imageNamed:@"icon_hand"];
    self.leftHand = leftHand;
    [self.view addSubview:leftHand];
   
    //rightHand
    UIImageView *rightHand = [[UIImageView alloc] init];
    rightHand.image = [UIImage imageNamed:@"icon_hand"];
    self.rightHand = rightHand;
    [self.view addSubview:rightHand];
    
    //leftArm
    UIImageView *leftArm = [[UIImageView alloc] init];
    leftArm.image = [UIImage imageNamed:@"owl-login-arm-left"];
    self.leftArm = leftArm;
    [loginImgContent addSubview:leftArm];
    
    //rightArm
    UIImageView *rightArm = [[UIImageView alloc] init];
    rightArm.image = [UIImage imageNamed:@"owl-login-arm-right"];
    self.rightArm = rightArm;
    [loginImgContent addSubview:rightArm];

    //loginContent
    UIView *loginContent = [[UIView alloc] init];
    self.loginContent = loginContent;
    loginContent.backgroundColor = [UIColor grayColor];
    loginContent.layer.borderColor = [UIColor blackColor].CGColor;
    loginContent.layer.borderWidth = 0.5;
    loginContent.layer.cornerRadius = 4.0;
    loginContent.layer.masksToBounds = YES;
    [self.view addSubview:loginContent];
    
    //userAccountTF
    UITextField *userAccountTF = [[UITextField alloc] init];
    userAccountTF.tintColor = [UIColor whiteColor];
    userAccountTF.placeholder = @"账户";
   // userAccountTF.backgroundColor = LGRandomColor;
    userAccountTF.delegate = self;
    userAccountTF.layer.cornerRadius = 4;
    userAccountTF.layer.masksToBounds = YES;
    userAccountTF.layer.borderWidth = 0.5;
    self.userAccountTF = userAccountTF;
    userAccountTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    userAccountTF.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgUser.image = [UIImage imageNamed:@"iconfont-user"];
    [userAccountTF.leftView addSubview:imgUser];
    [loginContent addSubview:userAccountTF];
    
    //userPasswordTF
    UITextField *userPasswordTF = [[UITextField alloc] init];
    userPasswordTF.placeholder = @"密码";
   // userPasswordTF.backgroundColor = LGRandomColor;
    userPasswordTF.delegate = self;
    userPasswordTF.secureTextEntry = YES;
    userPasswordTF.layer.cornerRadius = 4;
    userPasswordTF.layer.masksToBounds = YES;
    userPasswordTF.layer.borderWidth = 0.5;
    userPasswordTF.tintColor = [UIColor whiteColor];
    userPasswordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userPasswordTF = userPasswordTF;
    userPasswordTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    userPasswordTF.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    imgPwd.image = [UIImage imageNamed:@"iconfont-password"];
    [userPasswordTF.leftView addSubview:imgPwd];
    [loginContent addSubview:userPasswordTF];
    
    //登陆按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn = loginBtn;
    loginBtn.backgroundColor = [UIColor orangeColor];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.layer.cornerRadius = 8;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
     
    [self.view addSubview:loginBtn];
    
  //  UIView *superView = self.view;
    /** masonry布局 */
    [loginImgContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(211);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(108);
    }];
    
    [loginContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginImgContent.mas_bottom);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(160);
    }];
    
    [userAccountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(30);
        make.height.mas_equalTo(44);
    }];
    
    [userPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(userAccountTF);
        make.top.mas_equalTo(90);
        make.height.mas_equalTo(44);
    }];
    
    [leftArm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(1);
        make.top.mas_equalTo(90);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(65);
    }];
    
    [rightArm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-1);
        make.top.mas_equalTo(90);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(65);
    }];
    
    [leftHand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LGScreenW/2 - 100);
        make.top.equalTo(loginContent.mas_top).offset(-22);
//        make.top.mas_equalTo(loginImgContent.frame.origin.y - 22);
        make.width.height.mas_equalTo(40);
    }];
    
    [rightHand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(40);
        make.left.mas_equalTo(LGScreenW/2 + 62);
       // make.top.mas_equalTo(loginImgContent.frame.origin.y - 22);
        make.top.equalTo(loginContent.mas_top).offset(-22);
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginContent.mas_bottom).offset(30);
        make.leading.equalTo(loginContent.mas_leading).offset(30);
        make.trailing.equalTo(loginContent.mas_trailing).offset(-30);
        make.height.mas_equalTo(44);
        
    }];
    
    //baiduMap
    [self BMKlocService];
    
}
#pragma mark - 事件点击
- (void)loginBtnClick
{
    LGTabBarController *tabBarVC = [[LGTabBarController alloc] init];
    LGKeyWindow.rootViewController = tabBarVC;
    CATransition *anim = [CATransition animation];
    anim.duration =  0.5;
    anim.type = @"rippleEffect";
    [LGKeyWindow.layer addAnimation:anim forKey:nil];
    LGLog(@"点击了登陆");
}

#pragma mark - textFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:self.userAccountTF]) {//是账户文本框
        [UIView animateWithDuration:0.5 animations:^{
            
            
        } completion:^(BOOL finished) {
        }];
    }
    else if([textField isEqual:self.userPasswordTF])//是密码
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            
        } completion:^(BOOL finished) {
        }];
    }
}

#pragma mark - test

- (void)BMKlocService
{
    _locationService = [[BMKLocationService alloc] init];
    _locationService.delegate = self;
    [_locationService startUserLocationService];
}
//获取到用户地理信息
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    BMKReverseGeoCodeOption *geo = [[BMKReverseGeoCodeOption alloc] init];
    geo.reverseGeoPoint = userLocation.location.coordinate;
    [self.geoCode reverseGeoCode:geo];
    LGLog(@"%f --%f---",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_locationService stopUserLocationService];
}

#pragma mark - 反地理编码的结果
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (result) {
        
        LGLog(@"%@",result.address);
        
    }else
    {
        LGLog(@"获取地理位置失败");
    }
}

//- (void)onGetAddrResult:(BMKAddrInfo *)result errorCode:(int)error


@end
