//
//  DealMainViewController.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "DealMainViewController.h"
#import "DealTableViewCell.h"
#import "DealCheckViewController.h"

@interface DealMainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UISegmentedControl *segementedControl;
@property (strong, nonatomic)UITableView *dealTableView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (strong, nonatomic)NSMutableArray *filterArray;

@end

@implementation DealMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemsArray = [NSMutableArray arrayWithObjects:@"待审核", @"处理中", @"审核通过", nil];
    
    [self setupView];
    [self setupSegementControl];
    [self setupTableView];

}

- (void)setupView {
    [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
        NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1.0];
}

- (void)setupSegementControl {
    NSArray *array = [[NSArray alloc]initWithObjects:@"全部",@"待审核",@"处理中",@"审核通过", nil];
    
    self.segementedControl = [[UISegmentedControl alloc]initWithItems:array];
    self.segementedControl.frame = CGRectMake(0, 65, self.view.frame.size.width, 30);
    
    [self.segementedControl setTintColor:[UIColor clearColor]];
    //设置文字属性
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],NSForegroundColorAttributeName: [UIColor blackColor]};
    [self.segementedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName: [UIColor blackColor]};
    [self.segementedControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    //设置背景属性
    [[UISegmentedControl appearance]setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance]setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:211.0/255.0 green:211.0/255.0 blue:211.0/255.0 alpha:1.0]] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [self.segementedControl addTarget:self action:@selector(segementedChange:) forControlEvents:UIControlEventValueChanged];
    
    self.segementedControl.selectedSegmentIndex = 0;
    
    self.filterArray = [self.itemsArray mutableCopy];
    
    [self.view addSubview:self.segementedControl];
}

- (void)setupTableView {
    self.dealTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 94, self.view.frame.size.width, self.view.frame.size.height)];
    self.dealTableView.backgroundColor = [UIColor clearColor];
    self.dealTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.dealTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    self.dealTableView.dataSource = self;
    self.dealTableView.delegate = self;
    
    [self.view addSubview:self.dealTableView];
}

- (void)segementedChange:(UISegmentedControl *)segmentedControl {
    NSInteger index = segmentedControl.selectedSegmentIndex;
    switch (index) {
        case 0:
            [self.filterArray removeAllObjects];
            self.filterArray = [self.itemsArray mutableCopy];
            [self.dealTableView reloadData];
            break;
        case 1:
            [self searchArray:@"待审核"];
            break;
        case 2:
            [self searchArray:@"处理中"];
            break;
        case 3:
            [self searchArray:@"审核通过"];
            break;
        default:
            break;
    }
}

- (void)searchArray:(NSString *)search{
    [self.filterArray removeAllObjects];
    
    for (NSString *item in self.itemsArray) {
        if ([search containsString:item]) {
            [self.filterArray addObject:item];
        }
    }
    
    [self.dealTableView reloadData];
}

- (NSMutableArray *)filterArray {
    if (_filterArray == nil) {
        _filterArray = [[NSMutableArray alloc]init];
    }
    
    return _filterArray;
}

#pragma mark----------------------delegate-----------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filterArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DealTableViewCell *dealCell = (DealTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DealTableViewCell"];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"DealTableViewCell" owner:self options:nil];
    if (dealCell == nil) {
        dealCell = [array objectAtIndex:0];
    }
    [dealCell setData:self.filterArray[indexPath.row]];
    
    return  dealCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DealCheckViewController *dcVc = [[DealCheckViewController alloc]init];
    [self.navigationController pushViewController:dcVc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
