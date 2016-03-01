//
//  UIFactory.h
//  HZExtend
//
//  Created by GeniusBrother on 15/11/20.
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
#import "ThemeManager.h"
#import "ThemeImageView.h"
#import "ThemeView.h"
#import "ThemeLabel.h"
#import "ThemeButton.h"
/**
 *  快速创造主题视图
 */
@interface UIFactory : NSObject

/**
 *  创建普通View类型
 *  bgColorName:颜色类型的标识符
 */
+ (ThemeView *)themeViewWithBgColorName:(NSString *)bgColorName;

/**
 *  创建文本Label类型
 *  textColorName:颜色类型的标识符
 *  isAttribute:如果文本类型为NSAttributedString需设置YES
 */
+ (ThemeLabel *)themeLabelWithTextColorName:(NSString *)textColorName attribute:(BOOL)isAttribute;

/**
 *  创建文本Label类型
 *  textColorName:颜色类型的标识符
 *  文本类型默认为NSString
 */
+ (ThemeLabel *)themeLabelWithTextColorName:(NSString *)textColorName;

/**
 *  创建图片ImageView类型
 *  imageName:图片类型的标识符
 */
+ (ThemeImageView *)themeImgViewWithImageName:(NSString *)imageName;

/**
 *  创建按钮Button类型
 *  imageName:图片类型的标识符
 */
+ (ThemeButton *)themeButtonWithImageName:(NSString *)imageName;

/**
 *  创建按钮Button类型
 *  imageName:图片类型的标识符
 *  higlight:高亮状态下的图片类型的标识符
 *  课直接使用ThemeButton的selectedName属性来设置选中状态下的图片类型的标识符
 */
+ (ThemeButton *)themeButtonWithImageName:(NSString *)imageName hightlightedName:(NSString *)higlight;

@end
