//
//  ViewController.m
//  CZTableViewHandleDemo
//
//  Created by chongzone on 2017/12/12.
//  Copyright © 2017年 chongzone. All rights reserved.
//

#import "ViewController.h"
#import "CZTableViewHandle.h"
#import "CZTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) CZTableViewHandleDataSource *dataSource;
@property (nonatomic, strong) CZTableViewHandleDelegate *delegate;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (NSInteger index = 0; index < 30; index++) {
        NSDictionary *item = @{@"title": @"CZTableViewCell", @"detail":[NSString stringWithFormat:@"%02ld",index]};
        [self.items addObject:item];
    }
    
    self.dataSource = [CZTableViewHandleDataSource configCellWithItems:self.items identifier:NSStringFromClass([CZTableViewCell class]) cellClass:[CZTableViewCell class] cellStyle:UITableViewCellStyleValue1 configCellBlock:^(id cell, id item) {
        [(CZTableViewCell *)cell configTableViewCellWithItem:item];
    }];
    
    [self.delegate didSelectRowBlock:^(id cell, NSIndexPath *indexPath) {
        NSLog(@"row - %ld", indexPath.row);
    }];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.delegate;
    
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (CZTableViewHandleDelegate *)delegate {
    if (!_delegate) {
        _delegate = [[CZTableViewHandleDelegate alloc] init];
    }
    return _delegate;
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
