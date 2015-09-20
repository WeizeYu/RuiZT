//
//  DealCheckFootView.m
//  RZT
//
//  Created by 施伟元 on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import "DealCheckFootView.h"

@interface DealCheckFootView ()
@property (weak, nonatomic) IBOutlet UIButton *againComitteBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;

@end

@implementation DealCheckFootView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//    }
//    return self;
//}

+ (DealCheckFootView *)instanceFootView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"DealCheckFootView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

- (void)awakeFromNib {
    self.againComitteBtn.layer.cornerRadius = 3.0f;
    self.againComitteBtn.layer.borderWidth = 1.0f;
    self.againComitteBtn.layer.borderColor = [[UIColor grayColor]CGColor];
    
    self.closeBtn.layer.cornerRadius = 3.0f;
    self.closeBtn.layer.borderWidth = 1.0f;
    self.closeBtn.layer.borderColor = [[UIColor grayColor]CGColor];
}

@end
