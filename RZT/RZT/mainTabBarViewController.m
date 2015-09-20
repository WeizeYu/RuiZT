//
//  mainTabBarViewController.m
//  RZT
//
//  Created by yuweize on 15/9/16.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "mainTabBarViewController.h"
#define selectedButtonDefault 0

@interface mainTabBarViewController ()

@end

@implementation mainTabBarViewController

-(void)awakeFromNib{
    self.selectedIndex = selectedButtonDefault;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarController.tabBarItem.titlePositionAdjustment=UIOffsetMake(-15, 0);
    // 字体颜色 选中
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.0F], NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    //self.tabBar.hidden = YES;
   

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
