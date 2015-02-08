//
//  ViewController.h
//  horizontalScrollTableView
//
//  Created by bohemia on 2015/02/07.
//  Copyright (c) 2015年 bohemia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerticalTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *verticalTableView;

@end

