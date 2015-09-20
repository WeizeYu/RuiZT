//
//  CheckInfoTableViewCell.m
//  RZT
//
//  Created by 施伟元 on 15/9/17.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "CheckInfoTableViewCell.h"

@interface CheckInfoTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *checkInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UIImageView *checkImage;

@end

@implementation CheckInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(NSString *)title {
    self.checkInfoLabel.text = title;
}

- (void)setButton:(BOOL)boolean {
    if (boolean) {
        self.checkButton.enabled = NO;
        [self.checkButton setTitle:@"已认证" forState:UIControlStateNormal];
        [self.checkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.checkImage.image = [UIImage imageNamed:@"已认证"];
    }
    else {
        self.checkButton.enabled = YES;
        [self.checkButton setTitle:@"立即认证" forState:UIControlStateNormal];
        [self.checkButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        
        self.checkImage.image = [UIImage imageNamed:@"未认证"];
    }
}
- (IBAction)checkButtonAction:(id)sender {
//    if (self.checkBlock) {
//        self.checkBlock();
//    }
    if (self.checkButton.enabled) {
        self.checkButton.enabled = NO;
        [self.checkButton setTitle:@"已认证" forState:UIControlStateNormal];
        [self.checkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.checkImage.image = [UIImage imageNamed:@"已认证"];
    }
}

@end
