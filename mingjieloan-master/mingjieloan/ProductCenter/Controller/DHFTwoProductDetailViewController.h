//
//  DHFTwoProductDetailViewController.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/23.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "PopView.h"//弹出视图
#import "MJRefresh.h"
#import "LewPopupViewAnimationFade.h"
#import "ProductDetailFirstTableViewCell.h"//项目说明
#import "ProductIntroductionTableViewCell.h"//项目简介
#import "ProductUserInforTableViewCell.h"//借款人信息

#import "ProductDetailThreeTableViewCell.h"
#import "HKJHTableViewCell.h"//还款计划

#import "ProductOrdersModel.h"
#import "ProductRepayPlanModel.h"
#import "ProductDetailModel.h"//项目详情Model
#import "PApplicationModel.h"//借款 人信息Model
#import "pApplicationCheckModel.h"//审核信息
#import "InformationModel.h"


@interface DHFTwoProductDetailViewController : SubBaseViewController
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
