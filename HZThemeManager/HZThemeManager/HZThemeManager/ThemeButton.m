//
//  ThemeButton.m
//  HZExtend
//
//  Created by GeniusBrother on 15/11/21.
//  Copyright © 2015年 GeniusBrother. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"
#import "NSObject+HZExtend.h"
@implementation ThemeButton

#pragma mark - Init
- (instancetype)initWithImageName:(NSString *)imageName
{
    self = [self init];
    if (self) {
        self.imageName = imageName;
    }
    return self;
}

- (instancetype)initWithImageName:(NSString *)imageName highlightedName:(NSString *)highlightedName
{
    self = [self initWithImageName:imageName];
    if (self) {
        self.hightlightedName = highlightedName;
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
    if (self.imageName == nil) return;
    
    //从themeManager加载数据
    UIImage *image = [[ThemeManager sharedManager] getThemeImageWithName:self.imageName];
    [self setImage:image forState:UIControlStateNormal];
    
    if (!self.hightlightedName.isNoEmpty) return;
    UIImage *highlightedImage = [[ThemeManager sharedManager] getThemeImageWithName:self.hightlightedName];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
    
    if (!self.selectedName.isNoEmpty) return;
    UIImage *selectedImage = [[ThemeManager sharedManager] getThemeImageWithName:self.selectedName];
    [self setImage:selectedImage forState:UIControlStateSelected];
}

#pragma mark - Notification
- (void)themeNotification:(NSNotification *)notification
{
    [self loadThemeData];
}

#pragma mark - Data
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    
    [self loadThemeData];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
