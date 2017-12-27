//
//  NativeUseVC.m
//  IOSDeveloper
//
//  Created by ylb on 2017/12/26.
//  Copyright © 2017年 EricZ. All rights reserved.
//

#import "NativeUseVC.h"

#import "VcStateVC.h"
#import "ScrollViewVC.h"
#import "TableVC.h"

#import "LayerVC.h"

@interface NativeUseVC ()

@property (nonatomic, strong) NSArray *nativeItems;

@end

@implementation NativeUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.nativeItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = self.nativeItems[section];
    NSString *key = [[dic allKeys] firstObject];
    NSArray *arr = dic[key];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    NSDictionary *dic = self.nativeItems[indexPath.section];
    NSString *key = [[dic allKeys] firstObject];
    NSArray *arr = dic[key];
    
    cell.textLabel.text = arr[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = self.nativeItems[section];
    NSString *key = [[dic allKeys] firstObject];
    return key;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 32.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.nativeItems[indexPath.section];
    NSString *key = [[dic allKeys] firstObject];
    NSArray *arr = dic[key];
    NSString *title = arr[indexPath.row];
    
    UIViewController *vc = nil;
    if ([title isEqualToString:@"VcState"]) {
        vc = [[VcStateVC alloc] init];
    } else if ([title isEqualToString:@"ScrollView"]) {
        vc = [[ScrollViewVC alloc] init];
    } else if ([title isEqualToString:@"TableView"]) {
        vc = [[TableVC alloc] init];
    }
    //进阶篇
    else if ([title isEqualToString:@"Layer"]) {
        vc = [[LayerVC alloc] init];
    }
    
    if (vc) {
        vc.navigationItem.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


   
#pragma mark - 懒加载
- (NSArray *)nativeItems {
    if (!_nativeItems) {
        _nativeItems = @[
                         @{@"基础篇" : @[
                                   @"VcState",
                                   @"ScrollView",
                                   @"TableView"
                                   ]},
                         @{@"进阶篇" : @[
                                   @"Layer",
                                   @"Touch",
                                   @"Gesture"
                                   ]},
                         @{@"基础篇" : @[
                                   @"....",
                                   ]}
                         ];
    }
    return _nativeItems;
}

@end
