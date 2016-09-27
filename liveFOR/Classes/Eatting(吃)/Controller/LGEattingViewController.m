//
//  LGEattingViewController.m
//  liveFOR
//
//  Created by lingo on 16/8/2.
//  Copyright © 2016年 lingo. All rights reserved.
//

#import "LGEattingViewController.h"

@interface LGEattingViewController ()

@end

@implementation LGEattingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LGRandomColor;
    [self.tabBarController.tabBar.items objectAtIndex:0].badgeValue = @". .";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
