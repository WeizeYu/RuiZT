//
//  PhotoPicker.h
//  RZT
//
//  Created by yuweize on 15/9/20.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol photoPickerDelegate <NSObject>
@optional
-(void)showmessage:(NSString*)ma;
@end

@interface PhotoPicker : UIView<photoPickerDelegate>

@end
