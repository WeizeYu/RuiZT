//
//  DealDetailTableViewCell.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "DealDetailTableViewCell.h"

@interface DealDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DealDetailTableViewCell

- (void)awakeFromNib {
    self.changeBtn.layer.cornerRadius = 3.0f;
    self.changeBtn.layer.borderWidth = 1.0f;
    self.changeBtn.layer.borderColor = [[UIColor grayColor]CGColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}


@end
