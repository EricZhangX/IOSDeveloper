//
//  ViewControllerVC.m
//  IOSDeveloper
//
//  Created by ylb on 2017/12/26.
//  Copyright © 2017年 EricZ. All rights reserved.
//

#import "VcStateVC.h"
#import "VcTransitionVC.h"

@interface VcStateVC ()

@end

@implementation VcStateVC

- (void)loadView {
    NSLog(@"Before Load View");
    [super loadView];
    NSLog(@"After Load View");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIBarButtonItem *pushBtn = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:UIBarButtonItemStyleDone target:self action:@selector(pushAction)];
    UIBarButtonItem *presentBtn = [[UIBarButtonItem alloc] initWithTitle:@"Present" style:UIBarButtonItemStyleDone target:self action:@selector(presentAction)];
    
    self.navigationItem.rightBarButtonItems = @[pushBtn, presentBtn];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"First Vc viewWillAppear");
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"First Vc viewDidAppear");
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"First Vc viewWillDisappear");
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"First Vc viewDidDisappear");
    [super viewDidDisappear:animated];
}

#pragma mark - Action
- (void)pushAction {
    VcTransitionVC *targetVc = [[VcTransitionVC alloc] init];
    
    [self.navigationController pushViewController:targetVc animated:NO];
}

- (void)presentAction {
    VcTransitionVC *targeVc = [[VcTransitionVC alloc] init];
    [self presentViewController:targeVc animated:NO completion:^{
        NSLog(@"Finish Modal");
    }];
}
@end










