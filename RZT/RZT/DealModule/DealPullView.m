//
//  DealPullView.m
//  RZT
//
//  Created by 施伟元 on 15/9/21.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "DealPullView.h"
#import "DealPullTableViewCell.h"

@interface DealPullView ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *pullTableView;

@end

@implementation DealPullView

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        [self addSubview:self.pullTableView];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    DealPullTableViewCell *dpCell = (DealPullTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"DealPullTableViewCell"];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"DealPullTableViewCell" owner:self options:nil];
    if (dpCell == nil) {
        dpCell = [array objectAtIndex:0];
    }
    [dpCell setDate:self.itemsArray[indexPath.row]];
    
    cell = dpCell;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 24;
}

- (void)setItemsArray:(NSMutableArray *)itemsArray {
    _itemsArray = itemsArray;
}

- (UITableView *)pullTableView {
    if (_pullTableView == nil) {
        _pullTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _pullTableView.backgroundColor = [UIColor clearColor];
        _pullTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _pullTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _pullTableView.scrollEnabled = NO;
        _pullTableView.dataSource = self;
        _pullTableView.delegate = self;
    }
    return _pullTableView;
}
@end
