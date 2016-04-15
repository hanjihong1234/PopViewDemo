//
//  ViewController.m
//  PopViewDemo
//
//  Created by 韩继宏 on 16/3/27.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import "ViewController.h"
#import "HHAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showBtnClick:(UIButton *)sender {
    NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"朋友圈", @"空间", @"QQ", @"微博", @"微信", nil];
    NSMutableArray *imageArray = [NSMutableArray arrayWithObjects:@"personal_pengyouquan",@"personal_qq zone",@"personal_qq",@"personal_sina",@"personal_wechat", nil];
    HHAnimationView *animationView = [[HHAnimationView alloc] initWithTitleArray:titleArray imageArray:imageArray];
    animationView.CLBlock = ^(NSInteger index, id shareType) {
        NSLog(@"你选择的index ＝＝ %ld",(long)index);
        NSLog(@"要分享到的平台");
    };
    animationView.CLBtnBlock = ^(UIButton *btn) {
        NSLog(@"你点了选择/取消按钮");
    };
    [animationView show];
}

@end
