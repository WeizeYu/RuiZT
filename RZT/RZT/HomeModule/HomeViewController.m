//
//  HomeViewController.m
//  RZT
//
//  Created by yuweize on 15/9/16.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *homeTablev;
@end

@implementation HomeViewController
-(void) createData{
    _datasouce=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"马来西亚国家银行和泰国签谅解备忘录",@"detail",@"news",@"image",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"余维泽",@"detail",@"导航条320x64.png",@"image",nil];
    _datasouce=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
    [_datasouce addObject:s2];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=false;
}
/*-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=true;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
    self.homeTablev.delegate=self;
    self.homeTablev.dataSource=self;
    self.homeTablev.separatorStyle = UITableViewCellSelectionStyleNone;
    self.homeTablev.sectionIndexColor=[UIColor whiteColor];
    //设置navigation title和返回
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = item;
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar  setTitleTextAttributes:
                                    @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                    NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    //设置高亮图标
    UITabBarItem *x=[self.tabBarController.tabBar.items objectAtIndex:0];
    [x setSelectedImage:[[UIImage imageNamed:@"homeL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    // Do any additional setup after loading the view.
}
-(void)showtext:(NSString *)text{
    NSLog(@"%@",text);
}
#pragma mark----------------------delegate-----------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 280;
    }
    else if (indexPath.row==1)
    {
        return 140;
    }
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasouce.count+2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.row == 0) {
        ButtonsTableViewCell *buttoncell = (ButtonsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ButtonsTableViewCell"];
        if (buttoncell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ButtonsTableViewCell" owner:self options:nil];
            buttoncell = [array objectAtIndex:0];
        }
        __weak typeof (self) weakself=self;
        buttoncell.clickBlock = ^{
            tradeContractsViewController *vc=[[tradeContractsViewController alloc]init];
            vc.yudelegate = self;
            //self.tabBarController.tabBar.hidden=true;
            [weakself.navigationController pushViewController:vc animated:YES];
        };
        cell=buttoncell;
    }
    else if(indexPath.row==1){
        homeDealTableViewCell *detailCell = (homeDealTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"homeDealTableViewCell"];
        if (detailCell == nil) {
             detailCell= [[[NSBundle mainBundle] loadNibNamed:@"homeDealTableViewCell" owner:self options:nil]lastObject];
        }
        cell = detailCell;
    }
    else
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",indexPath.row];
        hotNewsTableViewCell *newsCell = (hotNewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (newsCell == nil) {
            newsCell = [[[NSBundle mainBundle] loadNibNamed:@"hotNewsTableViewCell" owner:self options:nil] lastObject];
            [newsCell setData:[[_datasouce objectAtIndex:indexPath.row-2]objectForKey:@"detail"]
                    withImage:[[self.datasouce objectAtIndex:indexPath.row-2]objectForKey:@"image"]];
        }
        cell=newsCell;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
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
