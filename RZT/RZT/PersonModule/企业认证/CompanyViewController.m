//
//  CompanyViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/17.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "CompanyViewController.h"
#import "CompanyInfoTableViewCell.h"
#import "CompanyDetailTableViewCell.h"
#import "ResultViewController.h"

@interface CompanyViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) UITableView *companyTableView;
@property (strong, nonatomic) NSMutableArray *itemsArray;

@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"企业认证";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];
    
    self.itemsArray = [NSMutableArray arrayWithObjects:@"营业执照", @"税务登记证", @"组织机构代码证", @"一般纳税人资格证", @"对外贸易经营者备案登记表", @"外商投资企业成立的批复文件、批准证书", nil];
    
    self.companyTableView.backgroundColor = [UIColor clearColor];
    self.companyTableView.tableFooterView = [self loadFootView];
    self.companyTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard)];
    self.companyTableView.userInteractionEnabled = YES;
    [self.companyTableView addGestureRecognizer:singleTap];
    
    [self.view addSubview:self.companyTableView];
}

- (void)closeKeyboard {
    [self.view endEditing:YES];
}

- (void)dealloc {
    NSLog(@"CompanyViewController is dealloc");
}
#pragma mark----------------------delegate-----------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        CompanyInfoTableViewCell *companyCell = (CompanyInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CompanyInfoTableViewCell"];
        if (companyCell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CompanyInfoTableViewCell" owner:self options:nil];
            companyCell = [array objectAtIndex:0];
        }
        cell = companyCell;
    }
    else {
        CompanyDetailTableViewCell *detailCell = (CompanyDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CompanyDetailTableViewCell"];
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CompanyDetailTableViewCell" owner:self options:nil];
        if (detailCell == nil) {
            detailCell = [array objectAtIndex:0];
        }
        
        if ((indexPath.row-1) < (self.itemsArray.count-2)) {
            [detailCell setData:self.itemsArray[indexPath.row -1] isMust:YES];
        }
        else {
            [detailCell setData:self.itemsArray[indexPath.row -1] isMust:NO];
        }
        __weak typeof(self) weakSelf = self;
        detailCell.comitteBlock = ^{
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:nil
                                          delegate:weakSelf
                                          cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:@"相册"
                                          otherButtonTitles:@"拍照",nil];
            [actionSheet showInView:weakSelf.view];
        };
        
        cell = detailCell;
    }
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 240;
    }
    return 150;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)loadFootView {
    UIButton *comitte = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 43, 35, 86, 35)];
    [comitte setTitle:@"提交" forState:UIControlStateNormal];
    [comitte setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [comitte addTarget:self action:@selector(comitteAction:) forControlEvents:UIControlEventTouchUpInside];
    comitte.backgroundColor = [UIColor orangeColor];
    comitte.layer.cornerRadius = 5;
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    
    [footView addSubview:comitte];
    
    return footView;
}

- (void)comitteAction:(UIButton *)sender {
    ResultViewController *rVc = [[ResultViewController alloc]init];
    [self.navigationController pushViewController:rVc animated:YES];
}

- (UITableView *)companyTableView {
    if (_companyTableView == nil) {
        _companyTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _companyTableView.delegate = self;
        _companyTableView.dataSource = self;
    }
    return _companyTableView;
}

@end
