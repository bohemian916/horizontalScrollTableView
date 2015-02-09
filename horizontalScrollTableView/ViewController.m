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
    // verticalの場合
    // verticalのセルを生成
    VerticalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"vertical"];
    [cell buildHorizontalTableView];
    
    
    // horizontalTableViewに1以上のタグを設定
    cell.horizontalTableView.tag = indexPath.row +1;
    return cell;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0;
}

@end
