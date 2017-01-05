//
//  MyCardViewController.h
//  mingjieloan
//
//  Created by 王好帅 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "MyCardTableViewCell.h"
#import "MyCardModel.h"
@interface MyCardViewController : SubBaseViewController<UITableViewDelegate,UITableViewDataSource,UseCardDeledate>

@property (strong, nonatomic) UITableView   * tableView;
@property (strong, nonatomic) NSArray       * dataSource;
@property (assign, nonatomic) int  page;
@property (strong, nonatomic) NSString * status;

@property (strong, nonatomic) UIView * lineView;

@property (strong, nonatomic) MyCardModel * model;

@property (strong, nonatomic) UIImageView * emptyImageView;

@property (strong, nonatomic) UILabel * emptyLabel;

@end

