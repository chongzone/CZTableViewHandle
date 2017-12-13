//
//  CZTableViewHandle.m
//  CZLightTableView
//
//  Created by chongzone on 2017/12/12.
//  Copyright © 2017年 chongzone. All rights reserved.
//

#import "CZTableViewHandle.h"

@interface CZTableViewHandleDataSource () {
    NSString *_cellIdentifier;
    UITableViewCellStyle _cellStyle;
    Class _cellClass;
}
@end

@implementation CZTableViewHandleDataSource

- (id)initWithCellItems:(NSArray *)items
             identifier:(NSString *)cellIdentifier
              cellClass:(Class)cellClass
              cellStyle:(UITableViewCellStyle)cellStyle
        configCellBlock:(CZTableViewCellConfigureBlock)configCellBlock {
    self = [super init];
    _items = [items mutableCopy];
    _cellIdentifier = cellIdentifier;
    _configCellBlock = configCellBlock;
    _cellStyle = cellStyle;
    _cellClass = cellClass;
    return self;
}

+ (id)configCellWithItems:(NSArray *)items
               identifier:(NSString *)identifier
                cellClass:(Class)cellClass
                cellStyle:(UITableViewCellStyle)cellStyle
          configCellBlock:(CZTableViewCellConfigureBlock)configCellBlock {
    return [[CZTableViewHandleDataSource alloc] initWithCellItems:items identifier:identifier cellClass:cellClass cellStyle:cellStyle configCellBlock:configCellBlock];
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier];
    if (!cell) cell = [[_cellClass alloc] initWithStyle:_cellStyle reuseIdentifier:_cellIdentifier];
    id item = self.items[indexPath.row];
    if (self.configCellBlock) self.configCellBlock(cell, item);
    return cell;
}

@end

@interface CZTableViewHandleDelegate () {
    didSelectRowBlock _didSelectRowBlock;
    didDeselectRowBlock _didDeselectRowBlock;
    willDisplayCellBlock _willDisplayCellBlock;
    heightForRowBlock _heightForRowBlock;
}
@end

@implementation CZTableViewHandleDelegate

- (void)heightForRowBlock:(heightForRowBlock)heightForRowBlock {
    _heightForRowBlock = heightForRowBlock;
}

- (void)didSelectRowBlock:(didSelectRowBlock)didSelectRowBlock {
    _didSelectRowBlock = didSelectRowBlock;
}

- (void)didDeselectRowBlock:(didDeselectRowBlock)didDeselectRowBlock {
    _didDeselectRowBlock = didDeselectRowBlock;
}

- (void)willDisplayCellBlock:(willDisplayCellBlock)willDisplayCellBlock {
    _willDisplayCellBlock = willDisplayCellBlock;
}

#pragma mark -

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_willDisplayCellBlock) _willDisplayCellBlock(cell,indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_heightForRowBlock) return _heightForRowBlock(indexPath);
    else return tableView.rowHeight; // 默认 UITableViewAutomaticDimension
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (_didSelectRowBlock) _didSelectRowBlock(cell,indexPath);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (_didDeselectRowBlock) _didDeselectRowBlock(cell,indexPath);
}

@end

@implementation CZTableViewHandle

@end
