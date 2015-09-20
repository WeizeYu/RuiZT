//
//  PersonInfoViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "PersonHeadTableViewCell.h"
#import "PersonNameTableViewCell.h"
#import "DeatailTableViewCell.h"
#import "PersonBasicViewController.h"
#import "ChangePasswordViewController.h"

@interface PersonInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *personInfoTableView;
@property (strong, nonatomic) NSMutableArray *itemsArray;

@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人资料";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];
    
    self.itemsArray = [NSMutableArray arrayWithObjects:@"基本信息",@"修改密码", nil];
    
    self.personInfoTableView.backgroundColor = [UIColor clearColor];
    self.personInfoTableView.tableFooterView = [self loadFootView];
    self.personInfoTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self.view addSubview:self.personInfoTableView];
}

- (void)dealloc {
    NSLog(@"PersonInfoViewController is dealloc");
}
#pragma mark----------------------delegate-----------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2 + self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        PersonHeadTableViewCell *headCell = (PersonHeadTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PersonHeadTableViewCell"];
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"PersonHeadTableViewCell" owner:self options:nil];
        if (headCell == nil) {
            headCell = [array objectAtIndex:0];
        }
        
        cell = headCell;
    }
    
    else if (indexPath.row == 1) {
        PersonNameTableViewCell *nameCell = (PersonNameTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PersonNameTableViewCell"];
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"PersonNameTableViewCell" owner:self options:nil];
        if (nameCell == nil) {
            nameCell = [array objectAtIndex:0];
        }
    
        cell = nameCell;
    }
    
    else {
        DeatailTableViewCell *detailCell = (DeatailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DeatailTableViewCell"];
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DeatailTableViewCell" owner:self options:nil];
        if (detailCell == nil) {
            detailCell = [array objectAtIndex:0];
        }
        [detailCell setData:self.itemsArray[indexPath.row - 2]];
        
        cell = detailCell;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 64;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        PersonBasicViewController *pbVc = [[PersonBasicViewController alloc]init];
        [self.navigationController pushViewController:pbVc animated:YES];
    }
    else if (indexPath.row == 3) {
        ChangePasswordViewController *cpVc = [[ChangePasswordViewController alloc]init];
        [self.navigationController pushViewController:cpVc animated:YES];
    }
}


- (UIView *)loadFootView {
    UIButton *quit = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 120, 250, 240, 30)];
    [quit setTitle:@"退出登录" forState:UIControlStateNormal];
    [quit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [quit addTarget:self action:@selector(quitAction:) forControlEvents:UIControlEventTouchUpInside];
    quit.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    quit.backgroundColor = [UIColor redColor];
    quit.layer.cornerRadius = 5;
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    [footView addSubview:quit];
    
    return footView;
}

- (void)quitAction:(UIButton *)sender{
    NSLog(@"quit action");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)personInfoTableView {
    if (_personInfoTableView == nil) {
        _personInfoTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _personInfoTableView.delegate = self;
        _personInfoTableView.dataSource = self;
    }
    
    return _personInfoTableView;
}

@end
