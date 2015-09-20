//
//  CompanyDetailTableViewCell.h
//  RZT
//
//  Created by 施伟元 on 15/9/17.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^comitteBlock)(void);

@interface CompanyDetailTableViewCell : UITableViewCell

@property (copy, nonatomic) comitteBlock comitteBlock;

- (void)setData:(NSString *)title isMust:(BOOL)isMust;

@end
