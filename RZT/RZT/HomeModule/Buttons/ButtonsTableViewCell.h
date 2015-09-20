//
//  ButtonsTableViewCell.h
//  RZT
//
//  Created by yuweize on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^clickBlock)(void);

@interface ButtonsTableViewCell : UITableViewCell
@property (copy, nonatomic) clickBlock clickBlock;

@end
