//
//  ThemeManager.h
//  HZExtend
//
//  Created by GeniusBrother on 15/11/19.
//  Copyright © 2015年 GeniusBrother. All rights reserved.
//  项目网址:https://github.com/GeniusBrother/HZThemeManager
//
//  结合MVVM以及MVC优点的架构HZExtend:https://github.com/GeniusBrother/HZExtend
//  项目特点
//  1.解放VC:基于MVVM的思想，将数据处理放入ViewModel里从而减少控制器的压力，降低代码耦合.
//  2.网络请求:基于AFN自定义了贴切业务逻辑的网络请求框架.
//  3.缓存体系:基于TMCache定制与业务逻辑相符的缓存体系.
//  4.数据元组:基于FMDB实现了与表元组对应的数据模型.
//  5.URLManager:支持URL跳转
//  6.一些常用的基础类扩展.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"
/**
 *  主题管理者,可以从其获得不同主题下的UI数据
 */
extern NSString *const kThemeDidChangeNotification;
@interface ThemeManager : NSObject
singleton_h(Manager)

/**
 *  当前主题名
 */
@property(nonatomic, copy) NSString *themeName;

/**
 *  主题文件夹路径配置 主题名:路径名(在资源包下相对路径) 如 @"black":@"Theme/Black"
 */
@property(nonatomic, strong) NSDictionary *themePaths;

/********************************获取主题下的UI数据********************************/

/**
 *  获取当前主题下 bgColorName对应的颜色
 *  bgColorName:颜色类型标识
 */
- (UIColor *)getThemeBgColorWithName:(NSString *)bgColorName;

/**
 *  获取当前主题下 imageName对应的图片
 *  imageName:图片类型标识
 */
- (UIImage *)getThemeImageWithName:(NSString *)imageName;

/**
 *  获取当前主题下 textColorName对应的颜色
 *  textColorName:文字颜色类型标识
 */
- (UIColor *)getThemeTextColorWithName:(NSString *)textColorName;

/**
 *  判断当前主题的类型
 *  themeName:主题名
 */
- (BOOL)isThemeForName:(NSString *)themeName;

@end
