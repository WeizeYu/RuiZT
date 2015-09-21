//
//  DealPullTableViewCell.m
//  RZT
//
//  Created by 施伟元 on 15/9/21.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "DealPullTableViewCell.h"

@interface DealPullTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *pullLabel;

@end

@implementation DealPullTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDate:(NSString *)data {
    self.pullLabel.text = data;
}
@end
