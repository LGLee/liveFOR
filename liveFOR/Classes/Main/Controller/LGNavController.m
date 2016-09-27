//
//  LGNavController.m
//  liveFOR
//
//  Created by lingo on 16/5/20.
//  Copyright © 2016年 lingo. All rights reserved.
//

#import "LGNavController.h"

@interface LGNavController ()

@end

@implementation LGNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor blackColor];
    NSMutableDictionary *titleAttsDict = [NSMutableDictionary dictionary];
    titleAttsDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttsDict[NSFontAttributeName] = [UIFont systemFontOfSize:20.0];
    self.navigationBar.titleTextAttributes = titleAttsDict;
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
