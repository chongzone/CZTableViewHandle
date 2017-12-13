//
//  CZTableViewCell.m
//  CZLightTableView
//
//  Created by chongzone on 2017/12/12.
//  Copyright © 2017年 chongzone. All rights reserved.
//

#import "CZTableViewCell.h"

@implementation CZTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)configTableViewCellWithItem:(NSDictionary *)item {
    self.textLabel.text = [item objectForKey:@"title"];
    self.detailTextLabel.text = [item objectForKey:@"detail"];
}

@end
