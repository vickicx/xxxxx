//
//  WDXXDetailViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "WDXXDetailViewController.h"

#import "WDXXDetailTableViewCell.h"

@interface WDXXDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *wdxxDetailTableView;

@end

@implementation WDXXDetailViewController

/**
 *view创建完毕
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"全部消息" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self createTableView];
}

/**
 * 调整描述和时间的位置
 */
- (void)adjustPosition{
    
    
    
}

/**
 * XXXXX
 */
- (void)createTableView {
    
    self.wdxxDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.wdxxDetailTableView];
    self.wdxxDetailTableView.dataSource = self;
    self.wdxxDetailTableView.delegate = self;
    self.wdxxDetailTableView.backgroundColor = [UIColor whiteColor];
    self.wdxxDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

/**
 * XXXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


/**
 * XXXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WDXXDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDXXDetailTableViewCell"];
    
    if (!cell) {
        
        cell = [[WDXXDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WDXXDetailTableViewCell"];
        
    }
    
    cell.msgTitleLabel.text = self.msgTitle;
    cell.dateLabel.text = self.date;
    cell.msgLabel.text = self.msg;
    
    cell.msgTitleStr = self.msgTitle;
    cell.dateLabel.text = self.date;
    cell.msgStr = self.msg;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

/**
 * XXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.5;
}


/**
 * XXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.5;
}


/**
 * XXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height1 = [WDXXDetailTableViewCell heightOfLabel:self.msgTitle andWith:200 * FitWidth];
    
    CGFloat height2 = [WDXXDetailTableViewCell heightOfLabel:self.msg andWith:kWIDTH];
    
    return height1 + height2;
}



@end
