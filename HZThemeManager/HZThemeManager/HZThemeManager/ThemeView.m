//
//  ThemeView.m
//  HZExtend
//
//  Created by GeniusBrother on 15/11/20.
//  Copyright © 2015年 GeniusBrother. All rights reserved.
//

#import "ThemeView.h"
#import "ThemeManager.h"
#import "NSObject+HZExtend.h"
@implementation ThemeView

#pragma mark - Init
- (instancetype)initWithBgColorName:(NSString *)bgColorName
{
    self = [self init];
    if (self) {
        self.bgColorName = bgColorName;
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
    if (!self.bgColorName.isNoEmpty) return;
    
    //从themeManager加载数据
    self.backgroundColor = [[ThemeManager sharedManager] getThemeBgColorWithName:self.bgColorName];
}

#pragma mark - Notification
- (void)themeNotification:(NSNotification *)notification
{
    [self loadThemeData];
}

#pragma mark - Data
- (void)setBgColorName:(NSString *)bgColorName
{
    _bgColorName = bgColorName;
    
    [self loadThemeData];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
