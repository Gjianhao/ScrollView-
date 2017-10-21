//
//  ViewController.m
//  ScrollView的常见处理
//
//  Created by gjh on 2017/10/21.
//  Copyright © 2017年 Gjianhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak)UIView *topBar;
@property (nonatomic, weak)UIView *leftBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    CGFloat contentW = 1000;
    CGFloat contentH = 1000;
    
    CGFloat barSpacing = 50;
    
    /* 右下角内容 */
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(barSpacing, barSpacing, contentW, contentH);
    contentView.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:contentView];
    
    /* 顶部条 */
    UIView *topBar = [[UIView alloc] init];
    topBar.frame = CGRectMake(barSpacing, 0, contentW, barSpacing);
    topBar.backgroundColor = [UIColor redColor];
    [scrollView addSubview:topBar];
    _topBar = topBar;
    
    /* 左边条 */
    UIView *leftBar = [[UIView alloc] init];
    leftBar.frame = CGRectMake(0, barSpacing, barSpacing, contentH);
    leftBar.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:leftBar];
    _leftBar = leftBar;
    
    /* 设置contentSize */
    scrollView.contentSize = CGSizeMake(barSpacing + contentW, barSpacing + contentH);
    
    /* 左上角覆盖 */
    UIView *cover = [[UIView alloc] init];
    cover.frame = CGRectMake(0, 0, barSpacing, barSpacing);
    cover.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cover];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGRect topF = _topBar.frame;
    topF.origin.y = scrollView.contentOffset.y;
    _topBar.frame = topF;
    
    CGRect leftF = _leftBar.frame;
    leftF.origin.x = scrollView.contentOffset.x;
    _leftBar.frame = leftF;
}

@end
