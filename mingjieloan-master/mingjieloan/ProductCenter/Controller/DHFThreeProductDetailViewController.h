//
//  DHFThreeProductDetailViewController.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/23.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "BaseViewController.h"
#import "PopView.h"//弹出视图
#import "LewPopupViewAnimationFade.h"
#import "ProductDetailFirstTableViewCell.h"//项目说明
#import "ProductIntroductionTableViewCell.h"//项目简介
#import "ProductUserInforTableViewCell.h"//借款人信息

#import "ProductDetailThreeTableViewCell.h"
#import "HKJHTableViewCell.h"//还款计划
#import "TBJLTableViewCell.h"//投标记录
#import "DHFTBViewController.h"//投标
@interface DHFThreeProductDetailViewController : BaseViewController
    
@property (nonatomic, strong)UIButton *CPXQButton;
@property (nonatomic, strong)UIButton *HKJHButton;
@property (nonatomic, strong)UIButton *TBJLButton;
@property (nonatomic, strong)UIView *bottomView;
    
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)PopView *popView;

@property (nonatomic, strong)UIButton *touBiaoBtn;
@property (nonatomic, strong)UILabel *warningLab;


@end
