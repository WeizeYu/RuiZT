//
//  CompanyChangeViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "CompanyChangeViewController.h"

@interface CompanyChangeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CompanyChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"公司资料";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];
    
    self.scrollView.delegate = self;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:singleTap];
    
    
}

- (void)closeKeyboard {
    [self.view endEditing:YES];
}

- (void)dealloc {
    NSLog(@"CompanyChangeViewController is dealloc");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
