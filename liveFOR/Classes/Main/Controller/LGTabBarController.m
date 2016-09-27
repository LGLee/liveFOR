//
//  LGTabBarController.m
//  liveFOR
//
//  Created by lingo on 16/5/20.
//  Copyright © 2016年 lingo. All rights reserved.
//

#import "LGTabBarController.h"
#import "LGEattingViewController.h"
#import "LGChatViewController.h"
#import "LGJokeViewController.h"
#import "LGMeViewController.h"
#import "LGNavController.h"

@interface LGTabBarController ()

@end

@implementation LGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllChildrenViewController];
}

#pragma mark -
/**
 *  添加所有的子控制器
 */
- (void)setupAllChildrenViewController
{
    [self setupOneChildViewController:[[LGEattingViewController alloc] init] title:@"吃" image:[UIImage imageNamed:@"btn_add"] selectedImage:[UIImage imageNamed:@"actionbar_audio_call_icon"]];
    [self setupOneChildViewController:[[LGChatViewController alloc] init] title:@"聊天" image:[UIImage imageNamed:@"btn_add"] selectedImage:[UIImage imageNamed:@"actionbar_audio_call_icon"]];
    [self setupOneChildViewController:[[LGJokeViewController alloc] init] title:@"笑话" image:[UIImage imageNamed:@"btn_add"] selectedImage:[UIImage imageNamed:@"actionbar_audio_call_icon"]];
  //  [self setupOneChildViewController:[[LGMeViewController alloc] init] title:@"我" image:[UIImage imageNamed:@"btn_add"] selectedImage:[UIImage imageNamed:@"actionbar_audio_call_icon"]];
    
}


- (void)setupOneChildViewController:(UIViewController *)viewController title:(NSString *)title  image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    viewController.title = title;
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectedImage;
    LGNavController *nav = [[LGNavController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
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
