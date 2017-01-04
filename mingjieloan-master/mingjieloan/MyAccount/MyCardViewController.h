//
//  MyCardViewController.h
//  mingjieloan
//
//  Created by 王好帅 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"

@interface MyCardViewController : SubBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView   * tableView;
@property (strong, nonatomic) NSArray       * dataSource;
@property (assign, nonatomic) int             page;

@property (assign, nonatomic) int  page;
@property (strong, nonatomic) NSString * status;

@end

