//
//  UIView+HZExtend.h
//  ZHFramework
//
//  Created by xzh. on 15/7/26.
//  Copyright (c) 2015年 xzh. All rights reserved.
//  项目网址:https://github.com/GeniusBrother/HZMenuView
//
//  结合MVVM以及MVC优点的架构HZExtend:https://github.com/GeniusBrother/HZExtend
//  项目特点
//  1.解放VC:基于MVVM的思想，将数据处理放入ViewModel里从而减少控制器的压力，降低代码耦合.
//  2.网络请求:基于AFN自定义了贴切业务逻辑的网络请求框架.
//  3.缓存体系:基于TMCache定制与业务逻辑相符的缓存体系.
//  4.数据元组:基于FMDB实现了与表元组对应的数据模型.
//  5.URLManager:支持URL跳转
//  6.一些常用的基础类扩展.

#import <UIKit/UIKit.h>

@interface UIView (HZExtend)

/********location********/
@property(nonatomic, assign) CGPoint origin;
@property(nonatomic, assign) CGFloat top;
@property(nonatomic, assign) CGFloat left;
@property(nonatomic, assign) CGFloat bottom;
@property(nonatomic, assign) CGFloat right;
@property(nonatomic, assign) CGPoint bottomLeft;
@property(nonatomic, assign) CGPoint bottomRight;
@property(nonatomic, assign) CGPoint topRight;

/********center********/
@property(nonatomic, assign) CGFloat centerY;
@property(nonatomic, assign) CGFloat centerX;

/********size********/
@property(nonatomic, assign) CGSize size;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat width;

/********有了父视图，且在同一个视图树才能使用********/
- (void)alignRight:(CGFloat)rightOffset;    //右边距离父视图rightOffset为负值
- (void)alignBottom:(CGFloat)bottomOffset;  //下边距离父视图bottomOffset为负值
- (void)alignCenter;                        //与父视图中心对齐
- (void)alignCenterX;                       //与父视图的中心x对齐
- (void)alignCenterY;                       

/**
 *  底部在参照视图(frame已经确定)顶部offset距离 offset为负值
 */
- (void)bottomOverView:(UIView *)view offset:(CGFloat)offset;

/**
 *  顶部在参照视图(frame已经确定)底部offset距离 offset为正值
 */
- (void)topBehindView:(UIView *)view offset:(CGFloat)offset;

/**
 *  右边在参照视图前面(frame已经确定)offset距离 offset为负值
 */
- (void)rightOverView:(UIView *)view offset:(CGFloat)offset;

/**
 *  左边边在参照视图后面(frame已经确定)offset距离 offset为正值
 */
- (void)leftBehindView:(UIView *)view offset:(CGFloat)offset;

- (UIImage *)saveImageWithScale:(float)scale;
@end
