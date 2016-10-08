//
//  DrawingView.m
//  SignNameDemo
//
//  Created by keqi on 2016/10/8.
//  Copyright © 2016年 keqi. All rights reserved.
//

#import "DrawingView.h"

@interface DrawingView ()
/**
 存储线条路径
 */
@property (nonatomic, strong) NSMutableArray<UIBezierPath *> *paths;
/**
 记录回退的路径
 */
@property (nonatomic, strong) UIBezierPath *lastPath;
/**
 记录当前线条颜色
 */
@property (nonatomic, strong) UIColor *curLineColor;
/**
 记录当前线宽
 */
@property (nonatomic, assign) CGFloat curLineWidth;
@end
@implementation DrawingView

#pragma mark - 绘图
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //1.获取UITouch对象
    UITouch *touch = [touches anyObject];
    //2.拿到触摸点
    CGPoint point = [touch locationInView:self];
    //3.创建贝塞尔曲线路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //3.1设置路径的相关属性
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    
    //4.设置当前路径的起点
    [path moveToPoint:point];
    
    //5.添加路径到数组中
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //1.获取UITouch对象
    UITouch *touch = [touches anyObject];
    //2.拿到触摸点
    CGPoint point = [touch locationInView:self];
    
    //3.取出当前路径
    UIBezierPath *path = [self.paths lastObject];
    //4.设置当前路径终点
    [path addLineToPoint:point];
    //5.调用drawRect方法进行重绘
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect {
    //设置线条颜色
    [self.curLineColor set];
    
    for (UIBezierPath *path in self.paths) {
        
        [path setLineWidth:self.curLineWidth];
        
        //渲染路径
        [path stroke];
    }
}

#pragma mark - 线条设置

- (void)changeLineColor:(UIColor *)color {
    self.curLineColor = color;
    [self setNeedsDisplay];
}

- (void)changeLineWidth:(CGFloat)width {
    self.curLineWidth = width;
    [self setNeedsDisplay];
}

- (void)clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back {
    self.lastPath = [self.paths lastObject];
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

- (void)forward {
    
    if (self.lastPath) {
        [self.paths addObject:self.lastPath];
        [self setNeedsDisplay];
    }
    self.lastPath = nil;
}

#pragma mark - lazy loading
- (NSMutableArray *)paths {
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (UIColor *)curLineColor {
    if (!_curLineColor) {
        _curLineColor = [UIColor blackColor];
    }
    return _curLineColor;
}

- (CGFloat)curLineWidth {
    if (_curLineWidth == 0) {
        _curLineWidth = 5;
    }
    return _curLineWidth;
}
@end
