//
//  VerticalTableViewCell.h
//  horizontalScrollTableView
//
//  Created by bohemia on 2015/02/07.
//  Copyright (c) 2015年 bohemia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerticalTableViewCell : UITableViewCell<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *horizontalTableView;
- (void)buildHorizontalTableView;
@end
