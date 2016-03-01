//
//  ThemeLabel.m
//  HZExtend
//
//  Created by GeniusBrother on 15/11/20.
//  Copyright © 2015年 GeniusBrother. All rights reserved.
//

#import "ThemeLabel.h"
#import "ThemeManager.h"
#import "NSObject+HZExtend.h"
@implementation ThemeLabel

#pragma mark - Init
- (instancetype)initWithTextColorName:(NSString *)textColorName
{
    self = [self init];
    if (self) {
        self.textColorName = textColorName;
    }
    return self;
}

- (instancetype)initWithTextColorName:(NSString *)textColorName attribute:(BOOL)isAttribute
{
    self = [self init];
    if (self) {
        self.attribute = isAttribute;
        self.textColorName = textColorName;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark - Core
- (void)loadThemeData
{
    if (!self.textColorName.isNoEmpty) return;
    
    UIColor *textColor = [[ThemeManager sharedManager] getThemeTextColorWithName:self.textColorName];
    if (self.attribute) {
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        NSRange range = NSMakeRange(0, self.attributedText.length);
        [attrStr addAttribute:NSForegroundColorAttributeName value:textColor range:range];
        self.attributedText = attrStr;
    }else {
        self.textColor = textColor;
    }
}

- (void)loadBgThemeData
{
    if (!self.bgColorName.isNoEmpty) return;
    
    //从themeManager加载数据
    self.backgroundColor = [[ThemeManager sharedManager] getThemeBgColorWithName:self.bgColorName];
}

#pragma mark - Notification
- (void)themeNotification:(NSNotification *)notification
{
    [self loadThemeData];
    
    if(self.bgColorName) [self loadBgThemeData];
}

#pragma mark - Data
- (void)setTextColorName:(NSString *)textColorName
{
    _textColorName = textColorName;
    
    [self loadThemeData];
}

- (void)setBgColorName:(NSString *)bgColorName
{
    _bgColorName = bgColorName;
    [self loadBgThemeData];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
