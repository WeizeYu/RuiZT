//
//  ChangePasswordViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"基本信息";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:singleTap];
}
- (void)closeKeyboard {
    [self.view endEditing:YES];
}

- (void)dealloc {
    NSLog(@"ChangePasswordViewController is dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
