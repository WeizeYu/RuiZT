//
//  DealTableViewCell.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "DealTableViewCell.h"

@interface DealTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *nextStepBtn;
@property (weak, nonatomic) IBOutlet UIButton *reDoBtn;
@property (weak, nonatomic) IBOutlet UILabel *jinDuLbl;

@end

@implementation DealTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.nextStepBtn.layer.cornerRadius = 3.0f;
    self.nextStepBtn.layer.borderWidth = 1.0f;
    self.nextStepBtn.layer.borderColor = [[UIColor grayColor]CGColor];
    
    self.reDoBtn.layer.cornerRadius = 3.0f;
    self.reDoBtn.layer.borderWidth = 1.0f;
    self.reDoBtn.layer.borderColor = [[UIColor grayColor]CGColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(NSString *)data {
    self.jinDuLbl.text = data;
}

@end
