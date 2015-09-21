//
//  PersonViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/17.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonTableViewCell.h"
#import "DeatailTableViewCell.h"
#import "PersonInfoViewController.h"
#import "MyAccountViewController.h"
#import "CompanyViewController.h"
#import "CompanyChangeViewController.h"

@interface PersonViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *personTableView;
@property (strong, nonatomic) NSMutableArray *itemsArray;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
        NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    self.itemsArray = [NSMutableArray arrayWithObjects:@"我的账户", @"企业认证", @"公司资料", nil];
    
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];
    self.personTableView.backgroundColor = [UIColor clearColor];
    self.personTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.personTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self.view addSubview:self.personTableView];
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden=false;
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
// self.tabBarController.tabBar.hidden=true;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark----------------------delegate-----------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        cell = (PersonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PersonTableViewCell"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"PersonTableViewCell" owner:self options:nil];
            cell = [array objectAtIndex:0];
        }
    }
    else {
        DeatailTableViewCell *detailCell = (DeatailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeatailTableViewCell"];
        if (detailCell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DeatailTableViewCell" owner:self options:nil];
            detailCell = [array objectAtIndex:0];
            
            [detailCell setData:[self.itemsArray objectAtIndex:(indexPath.row - 1)]];
        }
        
        cell = detailCell;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 110;
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    if (indexPath.row == 0) {
        PersonInfoViewController *piVc = [[PersonInfoViewController alloc]init];
        [self.navigationController pushViewController:piVc animated:YES];
    }
    else if (indexPath.row == 1) {
        MyAccountViewController *maVc = [[MyAccountViewController alloc]init];
        [self.navigationController pushViewController:maVc animated:YES];
    }
    else if (indexPath.row == 2) {
        CompanyViewController *coVc = [[CompanyViewController alloc]init];
        [self.navigationController pushViewController:coVc animated:YES];
    }
    else if (indexPath.row == 3) {
        CompanyChangeViewController *ccVc = [[CompanyChangeViewController alloc]init];
        [self.navigationController pushViewController:ccVc animated:YES];
    }
}
#pragma mark----------------------lazy load-----------------------------------
- (UITableView *)personTableView {
    if (_personTableView == nil) {
//        _personTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
        _personTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _personTableView.delegate = self;
        _personTableView.dataSource = self;
    }
    
    return _personTableView;
}

@end
