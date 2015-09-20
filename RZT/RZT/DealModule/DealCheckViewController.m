//
//  DealCheckViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "DealCheckViewController.h"
#import "DealInfoTableViewCell.h"
#import "DealDetailTableViewCell.h"
#import "DealReportTableViewCell.h"
#import "DealCheckFootView.h"

@interface DealCheckViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UITableView *dealCheckTableView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic)NSMutableArray *titleArry;

@end

@implementation DealCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"贸易合同审核";
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];
    
    self.itemsArray = [NSMutableArray arrayWithObjects:
                       @{@"title":@"流水号",@"detail":@"20151234567890"},
                       @{@"title":@"订单号",@"detail":@"201506170925"},
                       @{@"title":@"业务编码",@"detail":@"001001"},
                       @{@"title":@"提交时间",@"detail":@"2015.6.17"},
                       @{@"title":@"业务进度",@"detail":@"审核未通过"}, nil];
    self.titleArry = [NSMutableArray arrayWithObjects:@"合同相关材料", @"信用证相关材料", @"审核意见报告", nil];
    
    DealCheckFootView *footView = [DealCheckFootView instanceFootView];
    footView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    self.dealCheckTableView.backgroundColor = [UIColor clearColor];
    self.dealCheckTableView.tableFooterView = footView;
    self.dealCheckTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self.view addSubview:self.dealCheckTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsArray.count + self.titleArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =nil;
    if (indexPath.row < self.itemsArray.count) {
        DealInfoTableViewCell *infoCell = (DealInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DealInfoTableViewCell"];
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"DealInfoTableViewCell" owner:self options:nil];
        if (infoCell == nil) {
            infoCell = [array objectAtIndex:0];
        }
        [infoCell setData: [self.itemsArray[indexPath.row] objectForKey:@"title"] detail:[self.itemsArray[indexPath.row] objectForKey:@"detail"]];
        
        cell = infoCell;
    }
    else if (indexPath.row < self.itemsArray.count + self.titleArry.count - 1) {
        DealDetailTableViewCell *ddCell = (DealDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DealDetailTableViewCell"];
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"DealDetailTableViewCell" owner:self options:nil];
        if (ddCell == nil) {
            ddCell = [array objectAtIndex:0];
        }
        [ddCell setTitle:self.titleArry[indexPath.row - self.itemsArray.count]];
        
        cell = ddCell;
    }
    
    else {
        DealReportTableViewCell *drCell = (DealReportTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DealReportTableViewCell"];
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"DealReportTableViewCell" owner:self options:nil];
        if (drCell == nil) {
            drCell = [array objectAtIndex:0];
        }
        
        cell = drCell;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.itemsArray.count) {
        return 30;
    }
    else if (indexPath.row < self.itemsArray.count + self.titleArry.count - 1) {
        return 150;
    }
    return 113;
}

- (UITableView *)dealCheckTableView {
    if (_dealCheckTableView == nil) {
        _dealCheckTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _dealCheckTableView.dataSource = self;
        _dealCheckTableView.delegate = self;
    }
    
    return _dealCheckTableView;
}

@end
