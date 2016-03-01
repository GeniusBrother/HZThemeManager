//
//  ViewController.m
//  HZThemeManager
//
//  Created by xzh on 16/3/1.
//  Copyright © 2016年 GeniusBrother. All rights reserved.
//

#import "ViewController.h"
#import "ThemeManager.h"
#import "UIView+HZExtend.h"
#import "UIFactory.h"
@interface ViewController ()
@property(nonatomic, weak) UISwitch *swtich;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwitch *themeChange = [[UISwitch alloc] initWithFrame:CGRectZero];
    themeChange.center = CGPointMake(self.view.width/2, 100);
    themeChange.on = [[ThemeManager sharedManager] isThemeForName:@"black"];
    [themeChange addTarget:self action:@selector(themeChange:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:themeChange];
    
    /**
     *  注册通知，主题改变时调用
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangeNotification:) name:kThemeDidChangeNotification object:nil];
    
    /**
     *  从ThemeManager获取UI数据
     */
    self.view.backgroundColor = [[ThemeManager sharedManager] getThemeBgColorWithName:@"baseBgColor"];
    
    /**
     *  利用UIFactory获取主题类型视图
     */
    UILabel *themeLabel = [UIFactory themeLabelWithTextColorName:@"titleColor"];
    themeLabel.text = @"开启夜间模式:";
    themeLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:themeLabel];
    [themeLabel sizeToFit];
    themeLabel.centerY = themeChange.centerY;
    [themeLabel rightOverView:themeChange offset:-10];
    
    UIButton *themeBtn = [UIFactory themeButtonWithImageName:@"topicDownloadImg"];
    themeBtn.frame = CGRectMake(0, 0, 42, 42);
    themeBtn.center = CGPointMake(self.view.width/2, 200);
    [self.view addSubview:themeBtn];
    
    UIImageView *themeImageView = [UIFactory themeImgViewWithImageName:@"discover_enter"];
    themeImageView.frame = CGRectMake(0, 0, 60, 25);
    themeImageView.center = CGPointMake(self.view.width/2, 250);
    [self.view addSubview:themeImageView];
    
}

#pragma mark - NSNotification
- (void)themeChangeNotification:(NSNotification *)notification
{
    self.view.backgroundColor = [[ThemeManager sharedManager] getThemeBgColorWithName:@"baseBgColor"];
}

#pragma mark - Action
- (void)themeChange:(UISwitch *)sender
{
    NSString *theme = sender.isOn?@"black":@"white";
    [[NSUserDefaults standardUserDefaults] setObject:theme forKey:@"theme"];
    
    [UIView animateWithDuration:0.6 animations:^{
        [ThemeManager sharedManager].themeName = theme;
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
