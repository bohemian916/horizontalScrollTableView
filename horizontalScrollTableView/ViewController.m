//
//  ViewController.m
//  horizontalScrollTableView
//
//  Created by bohemia on 2015/02/07.
//  Copyright (c) 2015年 bohemia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // verticalTableViewのdelegate等を設定
    self.verticalTableView.delegate = self;
    self.verticalTableView.dataSource = self;
    
    // セルの再利用登録
    [self.verticalTableView registerClass:[VerticalTableViewCell class]
                   forCellReuseIdentifier:@"vertical"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag >=1) {
        // horizontalの場合
        // horizontalのセルを生成
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"horizontal"];
        cell.textLabel.text = [NSString stringWithFormat:@"(%ld,%ld)",tableView.tag -1, indexPath.row];
        
        // セルの向きを横向きに
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        return  cell;
     
    } else {
        // verticalの場合
        // verticalのセルを生成
        VerticalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"vertical"];
        [cell buildHorizontalTableView];
        
        // verticalのセルのdelegate等を設定
        cell.horizontalTableView.delegate = self;
        cell.horizontalTableView.dataSource = self;
        
        // horizontalTableViewに1以上のタグを設定
        cell.horizontalTableView.tag = indexPath.row +1;
        return cell;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag >=1) {
        return 10;
        
    } else {
        return 10;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag >=1) {
        return 100.0;
        
    } else {
        return 200.0;
    }
}

@end
