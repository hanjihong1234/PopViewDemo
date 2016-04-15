//
//  HHAnimationView.h
//  PopViewDemo
//
//  Created by 韩继宏 on 16/3/27.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHAnimationView : UIView

/*!
 *  @author 韩继宏, 16-04-10 16:04:35
 *
 *  初始化动画视图
 *
 *  @param titleArray 标题数组
 *  @param imageArray 图标数组
 *
 */
- (instancetype)initWithTitleArray:(NSMutableArray *)titleArray imageArray:(NSMutableArray *)imageArray;

// 选择位置
@property (nonatomic, copy) void(^CLBlock)(NSInteger index, id shareType);
// 选择按钮
@property (nonatomic, copy) void(^CLBtnBlock)(UIButton *btn);
// 视图展示
- (void)show;

@end
