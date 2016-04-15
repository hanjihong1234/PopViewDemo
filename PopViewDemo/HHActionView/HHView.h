//
//  HHView.h
//  PopViewDemo
//
//  Created by 韩继宏 on 16/3/27.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHView : UIView

// ActionSheet上小视图Button
@property (nonatomic, strong) UIButton *sheetButton;
// ActionSheet上小视图Label
@property (nonatomic, strong) UILabel *sheetLabel;
// 要分享到的平台
@property (nonatomic) id shareType;

@property (nonatomic, copy) void(^HHBlock)(NSInteger index, UILabel *sheetLabel, id shareType);

@end
