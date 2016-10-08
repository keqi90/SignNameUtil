//
//  UIImage+CaptureView.m
//  SignNameDemo
//
//  Created by keqi on 2016/10/8.
//  Copyright © 2016年 keqi. All rights reserved.
//

#import "UIImage+CaptureView.h"

@implementation UIImage (CaptureView)

+ (UIImage *)captureImageWithView:(UIView *)view {
    //1.获取bitmap的上下文
    UIGraphicsBeginImageContext(view.frame.size);
    //2.将要保存的view的layer渲染到当前上下文中
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //3.获取绘制好的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
@end
