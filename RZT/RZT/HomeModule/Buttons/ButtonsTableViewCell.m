//
//  ButtonsTableViewCell.m
//  RZT
//
//  Created by yuweize on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "ButtonsTableViewCell.h"

@implementation ButtonsTableViewCell
- (IBAction)xinYongClick:(id)sender {
    if (self.clickBlock) {
        self.clickBlock();
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
