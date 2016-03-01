//
//  ThemeImageView.m
//  HZExtend
//
//  Created by GeniusBrother on 15/11/19.
//  Copyright © 2015年 GeniusBrother. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManager.h"
@implementation ThemeImageView

#pragma mark - Init
- (instancetype)initWithImageName:(NSString *)imageName
{
    self = [self init];
    if (self) {
        self.imageName = imageName;
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
    self.image = [image resizableImageWithCapInsets:self.imageCapInsets resizingMode:UIImageResizingModeStretch];;
    
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

- (void)setImageCapInsets:(UIEdgeInsets)imageCapInsets
{
    _imageCapInsets = imageCapInsets;
    self.image = [self.image resizableImageWithCapInsets:imageCapInsets resizingMode:UIImageResizingModeStretch];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
