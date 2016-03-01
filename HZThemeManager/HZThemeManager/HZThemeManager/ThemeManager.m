//
//  ThemeManager.m
//  HZExtend
//
//  Created by GeniusBrother on 15/11/19.
//  Copyright © 2015年 GeniusBrother. All rights reserved.
//

#import "ThemeManager.h"
#import "NSObject+HZExtend.h"
#import "UIColor+HZExtend.h"
NSString *const kThemeDidChangeNotification = @"kThemeDidChangeNotification";

@interface ThemeManager ()

@property(nonatomic, strong) NSDictionary *themeTextColors; //当前主题下的所有文字颜色
@property(nonatomic, strong) NSDictionary *themeBgColors;   //当前主题下的所有bg颜色

@end

@implementation ThemeManager
singleton_m(Manager)
- (instancetype)init
{
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
    }
    return self;
}
#pragma mark - Core
/**
 *  返回当前主题的资源包根路径(主题空则为包路径)
 */
- (NSString *)themePath
{
    NSString *rootName = [[NSBundle mainBundle] resourcePath];
    if (!self.themeName.isNoEmpty) return rootName;
    
    NSString *pathName = [self.themePaths objectForKey:self.themeName];
    if (!pathName.isNoEmpty) return rootName;
    
    return [rootName stringByAppendingPathComponent:pathName];
}

/**
 *  改变当前主题类型,并加载主题资源数据
 */
- (void)setThemeName:(NSString *)themeName
{
    if (![_themeName isEqualToString:themeName]) {
        _themeName = themeName;
        /**/
        NSString *themeRoot = [self themePath];
        self.themeBgColors = [[NSDictionary alloc] initWithContentsOfFile:[themeRoot stringByAppendingPathComponent:@"bgColor.plist"]];
        
        self.themeTextColors = [[NSDictionary alloc] initWithContentsOfFile:[themeRoot stringByAppendingPathComponent:@"textColor.plist"]];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:self];
    }
}

#pragma mark - 数据获取
- (UIImage *)getThemeImageWithName:(NSString *)imageName
{
    if (!imageName.isNoEmpty) return nil;
    
    //IOS7以上
    if (!( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )) imageName = [imageName stringByAppendingString:@"@2x.png"];
    NSString *fileName = [[self themePath] stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:fileName];
}

- (UIColor *)getThemeBgColorWithName:(NSString *)colorName
{
    return [self themeColorWithColorName:colorName container:self.themeBgColors];
}

- (UIColor *)getThemeTextColorWithName:(NSString *)colorName
{
    return [self themeColorWithColorName:colorName container:self.themeTextColors];
}

- (UIColor *)themeColorWithColorName:(NSString *)colorName container:(NSDictionary *)themeColors
{
    if (!colorName.isNoEmpty) return nil;
    
    NSString *color = [themeColors objectForKey:colorName];
    if (!color.isNoEmpty) return nil;
    
    return [UIColor colorForString:color];
}

- (BOOL)isThemeForName:(NSString *)themeName
{
    if (!themeName.isNoEmpty) return NO;
    
    return [self.themeName isEqualToString:themeName];
}

@end
