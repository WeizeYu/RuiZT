//
//  hotNewsTableViewCell.h
//  RZT
//
//  Created by yuweize on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface hotNewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headerImage;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
-(void)setData:(NSString *)title withImage:(NSString *) image;
@end
