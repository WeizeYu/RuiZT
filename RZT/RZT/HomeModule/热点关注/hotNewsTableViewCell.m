//
//  hotNewsTableViewCell.m
//  RZT
//
//  Created by yuweize on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "hotNewsTableViewCell.h"

@implementation hotNewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(NSString *)title withImage:(NSString *) image{
    [self.headerImage setImage:[UIImage imageNamed:image]];
    self.detailLabel.text=title;
}

@end
