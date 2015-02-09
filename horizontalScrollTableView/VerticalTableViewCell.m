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
    
    // horizontalセルのdelegate等を設定
    self.horizontalTableView.delegate = self;
    self.horizontalTableView.dataSource = self;
    
    // 横スクロールに変更
    self.horizontalTableView.center = CGPointMake(self.horizontalTableView.frame.origin.x + self.horizontalTableView.frame.size.height / 2, self.horizontalTableView.frame.origin.y + self.horizontalTableView.frame.size.width / 2);
    self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    
    // セルの再利用登録
    [self.horizontalTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"horizontal"];
    
    // tableViewを追加
    [self addSubview:self.horizontalTableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // horizontalのセルを生成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"horizontal"];
    cell.textLabel.text = [NSString stringWithFormat:@"(%ld,%ld)",tableView.tag -1, indexPath.row];
    
    // セルの向きを横向きに
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    return  cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

@end
