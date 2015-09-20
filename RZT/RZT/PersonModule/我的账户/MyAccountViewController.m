//
//  MyAccountViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/17.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "MyAccountViewController.h"
#import "BasicTableViewCell.h"
#import "TitleTableViewCell.h"
#import "CheckInfoTableViewCell.h"

@interface MyAccountViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UITableView *myAccountTableView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (assign, nonatomic)BOOL isBool;

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的账户";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];

    self.itemsArray = [NSMutableArray arrayWithObjects:@"邮箱认证", @"手机认证", @"企业认证", nil];
    
    self.myAccountTableView.backgroundColor = [UIColor clearColor];
    self.myAccountTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.myAccountTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self.view addSubview:self.myAccountTableView];
}

- (void)dealloc {
    NSLog(@"MyAccountViewController is dealloc");
}
#pragma mark----------------------delegate-----------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2 + self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        BasicTableViewCell *basicCell = (BasicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BasicTableViewCell"];
        if (basicCell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"BasicTableViewCell" owner:self options:nil];
            basicCell = [array objectAtIndex:0];
        }
        cell = basicCell;
    }
    else if (indexPath.row == 1) {
        TitleTableViewCell *titleCell = (TitleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TitleTableViewCell"];
        if (titleCell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TitleTableViewCell" owner:self options:nil];
            titleCell = [array objectAtIndex:0];
        }
        cell = titleCell;
    }
    else {
        CheckInfoTableViewCell *checkCell = (CheckInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CheckInfoTableViewCell"];
        
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CheckInfoTableViewCell" owner:self options:nil];
        if (checkCell == nil) {
            checkCell = [array objectAtIndex:0];
        }
        [checkCell setData:self.itemsArray[indexPath.row - 2]];
        [checkCell setButton:self.isBool];
       
        cell = checkCell;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 160;
    }
    else if (indexPath.row == 1) {
        return 44;
    }
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        self.isBool = YES;
        [self.myAccountTableView reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)myAccountTableView {
    if (_myAccountTableView == nil) {
        _myAccountTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _myAccountTableView.delegate = self;
        _myAccountTableView.dataSource = self;
    }
    return _myAccountTableView;
}


@end
