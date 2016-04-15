//
//  HHAnimationView.m
//  PopViewDemo
//
//  Created by 韩继宏 on 16/3/27.
//  Copyright © 2016年 韩 继宏. All rights reserved.
//

#import "HHAnimationView.h"
#import "HHView.h"

#define HH 130
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface HHAnimationView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIPageControl *pageShow;
@property (nonatomic, strong) UIView *largeView;
@property (nonatomic, assign) CGFloat count;
@property (nonatomic, strong) UIButton *chooseBtn;
@end

@implementation HHAnimationView

- (instancetype)initWithTitleArray:(NSMutableArray *)titleArray imageArray:(NSMutableArray *)imageArray {
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        self.largeView = [[UIView alloc] init];
        _largeView.frame = CGRectMake(0, SCREENHEIGHT-HH, SCREENWIDTH, 2*HH);
        _largeView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_largeView];
        
        _chooseBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 2*HH - 40, SCREENWIDTH, 40)];
        [_chooseBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_chooseBtn setBackgroundColor:[UIColor whiteColor]];
        [_chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_chooseBtn addTarget:self action:@selector(chooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.largeView addSubview:_chooseBtn];
        
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 220)];
//        scroll.backgroundColor = [UIColor orangeColor];
        scroll.contentSize = CGSizeMake((titleArray.count +3)/4*SCREENWIDTH, 0);
        scroll.bounces = NO;
        scroll.pagingEnabled = YES;
        scroll.delegate = self;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.showsVerticalScrollIndicator = NO;
        [_largeView addSubview:scroll];
        
        _pageShow = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
//        _pageShow.backgroundColor = [UIColor yellowColor];
        _pageShow.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageShow.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageShow.numberOfPages = (titleArray.count +3)/4;
        _pageShow.center = CGPointMake(SCREENWIDTH/2, 210);
        [_largeView addSubview:_pageShow];
        
        for (int i = 0; i < titleArray.count; i ++) {
            HHView *hhView = [[HHView alloc] initWithFrame:CGRectMake(i *(SCREENWIDTH / 4), 40, SCREENWIDTH/4, 90)];
            hhView.tag = 10 + i;
            hhView.sheetButton.tag = i + 1;
            [hhView.sheetButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[i]]] forState:UIControlStateNormal];
            [hhView.sheetLabel setText:[NSString stringWithFormat:@"%@",titleArray[i]]];
            hhView.HHBlock = ^(NSInteger index, UILabel *sheetLabel, id shareType) {
                [self dismiss];
                self.CLBlock(index, shareType);
            };
            [scroll addSubview:hhView];
        }
        UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:dismissTap];
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageShow.currentPage = scrollView.contentOffset.x/SCREENWIDTH;
    
}

- (void)chooseBtnClick:(UIButton *)button {
    self.CLBtnBlock(button);
    [self dismiss];
}

- (void)show {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        _largeView.transform = CGAffineTransformMakeTranslation(0,  - HH);
        for (int i = 0; i < 6; i ++) {
            CGPoint CLCenterPoint = CGPointMake(SCREENWIDTH/4* i  + (SCREENWIDTH/8), 45);
            HHView *rr =  (HHView *)[self viewWithTag:10 + i];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i*0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    rr.center = CLCenterPoint;
                } completion:nil];
            });
        }
    } completion:^(BOOL finished) {
        NSLog(@"所有动画之行完毕");
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        _largeView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
