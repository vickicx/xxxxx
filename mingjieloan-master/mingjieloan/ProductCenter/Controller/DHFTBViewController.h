//
//  DHFTBViewController.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseViewController.h"
#import "ProductDetailFirstTableViewCell.h"
#import "TBTableViewCell.h"
@interface DHFTBViewController : BaseViewController

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)UILabel *myCardLab;
@property (nonatomic, strong)UIButton *userButton;
@property (nonatomic, strong)UIImageView *rightImg;
@property (nonatomic, strong)UIView *lineView1;
@property (nonatomic, strong)UILabel *fkMoneyLab;
@property (nonatomic, strong)UILabel *moneyLab;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UIButton *agreeBtn;
@property (nonatomic, strong)UIButton *protolBtn;
@property (nonatomic, strong)UIButton *touziBtn;
@property (nonatomic, strong)UILabel *warningLabel;

@end
