//
//  CompanyDetailTableViewCell.m
//  RZT
//
//  Created by 施伟元 on 15/9/17.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "CompanyDetailTableViewCell.h"

@interface CompanyDetailTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titileLabel;

@end

@implementation CompanyDetailTableViewCell

- (void)awakeFromNib {
    self.titileLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(NSString *)title isMust:(BOOL)isMust {
    self.titileLabel.text = title;
    if (isMust) {
        self.titileLabel.textColor = [UIColor redColor];
    }
}
- (IBAction)commitAction:(id)sender {
    if (self.comitteBlock) {
        self.comitteBlock();
    }
}

@end
