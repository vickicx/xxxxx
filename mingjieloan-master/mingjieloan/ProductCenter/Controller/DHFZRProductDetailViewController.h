//
//  DHFZRProductDetailViewController.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/3.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "MJRefresh.h"
#import "DHFZRProductCell.h"//项目说明
#import "DHFZRIntroductionCell.h"//债权转让介绍
#import "DHFProductZRR_Cell.h"//转让人信息
#import "DHFZRUserInfoCell.h"//借款人信息
#import "DHFZRCompanyInfoCell.h"//借款公司信息

#import "ProductDetailThreeTableViewCell.h"
#import "HKJHTableViewCell.h"//还款计划

#import "ProductOrdersModel.h"
#import "ProductRepayPlanModel.h"
#import "ProductDetailModel.h"//项目详情Model
#import "PApplicationModel.h"//借款 人信息Model
#import "pApplicationCheckModel.h"//审核信息
#import "InformationModel.h"
#import "DHFZRTBViewController.h"

@interface DHFZRProductDetailViewController : SubBaseViewController




@property (nonatomic, strong)UIButton *TBJLButton;
@property (nonatomic, strong)UIButton *CPXQButton;
@property (nonatomic, strong)UIView *bottomView;

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)PopView *popView;
@property (nonatomic, copy)NSString *idNumber;


@property (nonatomic, strong)UIButton *touBiaoBtn;
@property (nonatomic, strong)UILabel *warningLab;


@property (nonatomic, strong)NSMutableArray *TBJLArray;
@property (nonatomic, strong)NSMutableArray *HKJHArray;
@property (nonatomic, strong)ProductDetailModel *detailModel;
@property (nonatomic, strong)PApplicationModel *pApplocationModel;
@property (nonatomic, strong)pApplicationCheckModel *checkModel;
@property (nonatomic, strong)NSMutableArray *informaModel;
@property (nonatomic, strong)NSMutableDictionary *productDic;












@end
