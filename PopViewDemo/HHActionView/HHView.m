//
//  HHView.m
//  PopViewDemo
//
//  Created by 韩继宏 on 16/3/27.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import "HHView.h"

@implementation HHView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        self.sheetButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.sheetButton.clipsToBounds = YES;
        self.sheetButton.layer.cornerRadius = 25;
        [self.sheetButton setCenter:CGPointMake(self.frame.size.width / 2, 50)];
        [self.sheetButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.sheetButton];
        
        self.sheetLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,  80, self.frame.size.width, 20)];
        [self.sheetLabel setTextAlignment:NSTextAlignmentCenter];
        self.sheetLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:self.sheetLabel];
    }
    return self;
}

- (void)btnClick:(UIButton *)btn {
    // 在响应按钮的点击之前判断一下要分享到的平台
    [self judgeShareType:self.sheetLabel.text];
    self.HHBlock(self.sheetButton.tag, self.sheetLabel, self.shareType);
}

/*!
 *  @author 韩继宏, 16-03-27 20:03:33
 *
 *  根据sheetLabel的标题判断点击这个按钮需要分享到的平台
 *
 *  @param str sheetLabel的标题
 */
- (void)judgeShareType:(NSString *)str {
//    if ([str isEqualToString:@"QQ"] ) {
//        self.shareType =  UMShareToQQ ;
//    } else if ([str isEqualToString:@"空间"]) {
//        self.shareType =  UMShareToQzone;
//    } else if ([str isEqualToString:@"微信"]) {
//        self.shareType = UMShareToWechatSession;
//    } else if ([str isEqualToString:@"朋友圈"]) {
//        self.shareType = UMShareToWechatTimeline;
//    } else {
//        self.shareType = UMShareToSms;
//    }
}

@end
