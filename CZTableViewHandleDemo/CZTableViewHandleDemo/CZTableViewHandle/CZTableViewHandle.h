//
//  CZTableViewHandle.h
//  CZLightTableView
//
//  Created by chongzone on 2017/12/12.
//  Copyright © 2017年 chongzone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CZTableViewCellConfigureBlock)(id cell, id item);

@interface CZTableViewHandleDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, copy) CZTableViewCellConfigureBlock configCellBlock;

/**
 * 数据源
 * @param items 数据源
 * @param identifier 重用符
 * @param cellClass cell类
 * @param cellStyle cell样式
 * @param configCellBlock 回调
 * @return 代理数据源
 */
+ (id)configCellWithItems:(NSArray *)items
               identifier:(NSString *)identifier
                cellClass:(Class)cellClass
                cellStyle:(UITableViewCellStyle)cellStyle
          configCellBlock:(CZTableViewCellConfigureBlock)configCellBlock;
@end

typedef CGFloat (^heightForRowBlock)(NSIndexPath *indexPath);
typedef void (^didSelectRowBlock)(id cell, NSIndexPath *indexPath);
typedef void (^didDeselectRowBlock)(id cell, NSIndexPath *indexPath);
typedef void (^willDisplayCellBlock)(id cell, NSIndexPath *indexPath);

@interface CZTableViewHandleDelegate : NSObject<UITableViewDelegate>

- (void)heightForRowBlock:(heightForRowBlock)heightForRowBlock; // cell高度
- (void)didSelectRowBlock:(didSelectRowBlock)didSelectRowBlock; // cell点击回调
- (void)didDeselectRowBlock:(didDeselectRowBlock)didDeselectRowBlock; // cell取消点击的回调
- (void)willDisplayCellBlock:(willDisplayCellBlock)willDisplayCellBlock; // cell将要显示的回调

@end

@interface CZTableViewHandle : NSObject

@end
