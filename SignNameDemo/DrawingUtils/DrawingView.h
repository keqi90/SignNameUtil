//
//  DrawingView.h
//  SignNameDemo
//
//  Created by keqi on 2016/10/8.
//  Copyright © 2016年 keqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingView : UIView

/**
 清屏
 */
- (void)clear;
/**
 后退一步
 */
- (void)back;
/**
 前进一步
 */
- (void)forward;
/**
 更改线条颜色
 @param color 颜色类型
 */
- (void)changeLineColor:(UIColor *)color;
/**
 更改线宽
 @param width 线宽
 */
- (void)changeLineWidth:(CGFloat)width;
@end
