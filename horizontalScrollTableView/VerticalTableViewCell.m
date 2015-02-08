//
//  horizontalTableViewCell.m
//  horizontalScrollTableView
//
//  Created by bohemia on 2015/02/07.
//  Copyright (c) 2015年 bohemia. All rights reserved.
//

#import "VerticalTableViewCell.h"

@implementation VerticalTableViewCell

- (void)buildHorizontalTableView
{
    CGRect frame = CGRectMake(0, 0, 200.0, [UIScreen mainScreen].bounds.size.width);
    self.horizontalTableView = [[UITableView alloc] initWithFrame:frame];
    
    // 横スクロールに変更
    self.horizontalTableView.center = CGPointMake(self.horizontalTableView.frame.origin.x + self.horizontalTableView.frame.size.height / 2, self.horizontalTableView.frame.origin.y + self.horizontalTableView.frame.size.width / 2);
    self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    
    // セルの再利用登録
    [self.horizontalTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"horizontal"];
    
    // tableViewを追加
    [self addSubview:self.horizontalTableView];
}

@end
