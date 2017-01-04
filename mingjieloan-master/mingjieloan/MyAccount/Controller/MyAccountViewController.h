//
//  MyAccountViewController.h
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "BaseViewController.h"
#import "HYZXViewController.h"
#import "JFViewController.h"
#import "DHFUserCenterViewController.h"
#import "DepositsHistoryViewController.h"
#import "LDY_RightChangeViewController.h"


@interface MyAccountViewController : BaseViewController


@property (nonatomic,strong) UIButton *qiandaoBtn;

@property (nonatomic,strong) UILabel *lianxuqiandaoLabel;

@property (nonatomic,strong) UILabel *huiyuandengjiLabel;

@property (nonatomic,strong) UITableView *MyAccountTableView;




// 存钱罐的显示
@property (nonatomic,strong) UILabel *piggybankamountLabel;

@property (nonatomic,copy) NSString *mySid;

//懒加载

@property (nonatomic,strong) UILabel *topTitle;

@property (nonatomic, strong) UIView *titleViewXX;

@property (nonatomic, strong) UIButton *wdxxButton;

@property (nonatomic, strong) UIView *qiandaoView;

@property (nonatomic, strong) UIImageView *qiandaoImageView;

@property (nonatomic, strong) UIButton *qiandaoButton;

@property (nonatomic,strong) UILabel *qiandaoTitleLabel;

@property (nonatomic,strong) UILabel *qiandaojifenLabel;

@property (nonatomic,strong) UILabel *qiandaoLabel;

@property (nonatomic,strong) UILabel *qiandao2Label;

@property (nonatomic, strong) UIView *redPointView;

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, assign) BOOL is_sign;

@property (nonatomic, strong) UIButton *chongzhiBtn;

@property (nonatomic, strong) UIButton *tixianBtn;










@end









