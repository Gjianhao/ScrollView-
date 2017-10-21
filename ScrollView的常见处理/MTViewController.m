//
//  MTViewController.m
//  ScrollView的常见处理
//
//  Created by gjh on 2017/10/21.
//  Copyright © 2017年 Gjianhao. All rights reserved.
//

#import "MTViewController.h"

@interface MTViewController ()<UIScrollViewDelegate>

//@property (nonatomic, weak)UIView *topBar;
@property (nonatomic, weak)UIView *bar;

@end

@implementation MTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1500);
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    UIView *bar = [[UIView alloc] init];
    bar.frame = CGRectMake(0, 200, self.view.frame.size.width, 50);
    bar.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:bar];
    _bar = bar;
    
//    UIView *topBar = [[UIView alloc] init];
//    topBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, 50);
//    topBar.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:topBar];
//    _topBar = topBar;
    
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y >= 200) {
        _bar.frame = CGRectMake(0, scrollView.contentOffset.y, self.view.frame.size.width, 50);
//        _topBar.hidden = NO;
    } else {
//        _topBar.hidden = YES;
    }
}
@end
