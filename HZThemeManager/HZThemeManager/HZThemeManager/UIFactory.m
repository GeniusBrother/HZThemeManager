//
//  UIFactory.m
//  HZExtend
//
//  Created by GeniusBrother on 15/11/20.
//  Copyright © 2015年 GeniusBrother. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory

+ (ThemeView *)themeViewWithBgColorName:(NSString *)bgColorName
{
    ThemeView *themeView = [[ThemeView alloc] initWithBgColorName:bgColorName];
    return themeView;
}

+ (ThemeLabel *)themeLabelWithTextColorName:(NSString *)textColorName
{
    ThemeLabel *themeLabel = [[ThemeLabel alloc] initWithTextColorName:textColorName];
    return themeLabel;
}

+ (ThemeLabel *)themeLabelWithTextColorName:(NSString *)textColorName attribute:(BOOL)isAttribute
{
    ThemeLabel *themeLabel = [[ThemeLabel alloc] initWithTextColorName:textColorName attribute:isAttribute];
    return themeLabel;
}

+ (ThemeImageView *)themeImgViewWithImageName:(NSString *)imageName
{
    ThemeImageView *themeImgView = [[ThemeImageView alloc] initWithImageName:imageName];
    return themeImgView;
}

+ (ThemeButton *)themeButtonWithImageName:(NSString *)imageName
{
    ThemeButton *themeBtn = [[ThemeButton alloc] initWithImageName:imageName];
    return themeBtn;
}

+ (ThemeButton *)themeButtonWithImageName:(NSString *)imageName hightlightedName:(NSString *)higlight
{
    ThemeButton *themeBtn = [[ThemeButton alloc] initWithImageName:imageName highlightedName:higlight];
    return themeBtn;
}

@end
