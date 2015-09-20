//
//  tradeContractsViewController.h
//  RZT
//
//  Created by yuweize on 15/9/18.
//  Copyright (c) 2015年 yuweize. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MessagePhotoMenuItem.h"
#import "ZYQAssetPickerController.h"
#import "ShowBigViewController.h"

@protocol tradeDelegate <NSObject>
@optional
-(void)showtext:(NSString*)text;

@end

@interface tradeContractsViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,MessagePhotoItemDelegate,ZYQAssetPickerControllerDelegate>{
    //下拉菜单
    UIActionSheet *myActionSheet;
    //图片2进制路径
    NSString* filePath;
    
}
@property(nonatomic,strong) UIScrollView *scrollview;
/**
 *  第三方功能Models
 */
@property(nonatomic,assign)id<tradeDelegate> yudelegate;
@property (nonatomic, strong) NSMutableArray *photoMenuItems;
@property(nonatomic,strong) NSMutableArray *itemArray;
-(void)reloadDataWithImage:(UIImage *)image;
- (void)reloadData;
- (void)didSelectePhotoMenuItem:(MessagePhotoMenuItem *)shareMenuItem atIndex:(NSInteger)index;
-(void)addPicker:(ZYQAssetPickerController *)picker;          //UIImagePickerController

@end


