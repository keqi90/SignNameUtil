//
//  UIImage+CaptureView.h
//  SignNameDemo
//
//  Created by keqi on 2016/10/8.
//  Copyright © 2016年 keqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CaptureView)

//截取所传view的屏幕
+ (UIImage *)captureImageWithView:(UIView *)view;
@end
