//
//  ScrollViewVC.m
//  IOSDeveloper
//
//  Created by ylb on 2017/12/26.
//  Copyright © 2017年 EricZ. All rights reserved.
//

#import "ScrollViewVC.h"

@interface ScrollViewVC () <UIScrollViewDelegate>

@property (nonatomic, weak) UIView *subView1;

@property (nonatomic, weak) UIView *subView2;

@property (nonatomic, weak) UIView *subView3;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *subView1 =  [[UIView alloc] init];
    subView1.backgroundColor = [UIColor redColor];
    subView1.frame = CGRectMake(10, 20, 80, 150);
    
    [self.scrollView addSubview:subView1];
    self.subView1 = subView1;
    
    UIView *subView2 =  [[UIView alloc] init];
    subView2.backgroundColor = [UIColor greenColor];
    subView2.frame = CGRectMake(40, 280, 150, 200);
    
    [self.scrollView addSubview:subView2];
    self.subView2 = subView2;
    
    UIView *subView3 =  [[UIView alloc] init];
    subView3.backgroundColor = [UIColor orangeColor];
    subView3.frame = CGRectMake(20, 700, 120, 180);
    
    [self.scrollView addSubview:subView3];
    self.subView3 = subView3;
    
    self.scrollView.delegate = self;
    
    self.scrollView.bounces = YES;
    
    self.scrollView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(80, 0, 0, 0);
    
    self.scrollView.scrollsToTop = YES;
    //    self.scrollView.maximumZoomScale = 5;
    //    self.scrollView.zoomScale = 5;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 900);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f %f", scrollView.contentOffset.x, scrollView.contentOffset.y);
    //NSLog(@"Bounds X: %f  Bounds Y: %f", scrollView.bounds.origin.x, scrollView.bounds.origin.y);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //NSLog(@"Begin Dragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //NSLog(@"End Dragging");
    //[self performSelector:@selector(scrollToPosition) withObject:nil afterDelay:2];
}

- (void)scrollToPosition
{
    [self.scrollView setContentOffset:CGPointMake(0, 30) animated:YES];
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.subView1;
}


- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
@end
