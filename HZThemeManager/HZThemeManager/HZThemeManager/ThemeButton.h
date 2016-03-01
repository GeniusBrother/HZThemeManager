//
//  ThemeButton.h
//  HZExtend
//
//  Created by GeniusBrother on 15/11/21.
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

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

/**
 *  图片标识符
 */
@property(nonatomic, copy) NSString *imageName;
@property(nonatomic, copy) NSString *hightlightedName;
@property(nonatomic, copy) NSString *selectedName;

- (instancetype)initWithImageName:(NSString *)imageName;
- (instancetype)initWithImageName:(NSString *)imageName highlightedName:(NSString *)highlightedName;

@end
