//
//  VcTransitionVC.m
//  IOSDeveloper
//
//  Created by ylb on 2017/12/26.
//  Copyright © 2017年 EricZ. All rights reserved.
//

#import "VcTransitionVC.h"

@interface VcTransitionVC ()

@end

@implementation VcTransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *dismissBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    dismissBtn.center = self.view.center;
    [self.view addSubview:dismissBtn];
    
    [dismissBtn setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"Target Vc viewWillAppear");
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"Target Vc viewDidAppear");
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"Target Vc viewWillDisappear");
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"Target Vc viewDidDisappear");
    [super viewDidDisappear:animated];
}

- (void)dismissAction {
    [self dismissViewControllerAnimated:NO completion:^{
        NSLog(@"Dismiss Finish");
    }];
}

@end
