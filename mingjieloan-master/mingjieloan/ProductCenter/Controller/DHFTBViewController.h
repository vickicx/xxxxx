//
//  DHFTBViewController.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "ProductDetailFirstTableViewCell.h"
#import "TBTableViewCell.h"

#import "ProductOrdersModel.h"
#import "ProductRepayPlanModel.h"
#import "ProductDetailModel.h"//项目详情Model
#import "PApplicationModel.h"//借款 人信息Model
#import "pApplicationCheckModel.h"//审核信息
#import "InformationModel.h"

#import "DHFcommonWebViewVC.h"

#import "BasicInfo.h"
#import "DHFUserCouponViewController.h"//使用优惠券
#import "DHFCouponModel.h"
@interface DHFTBViewController : SubBaseViewController

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

@property (strong, nonatomic) UserInfo * userInfo;

@property (strong, nonatomic) BasicInfo * basicInfo;

@property (nonatomic, copy)NSString *money;
@property (nonatomic, copy)NSString *idNumber;
@property (nonatomic, strong)ProductDetailModel *detailModel;
@property (nonatomic, strong)PApplicationModel *pApplocationModel;
@property (nonatomic, strong)pApplicationCheckModel *checkModel;
@property (nonatomic, strong)NSMutableArray *informaModel;
@property (nonatomic, strong)NSMutableDictionary *productDic;
@property (nonatomic, strong)DHFCouponModel *couponModel;


@end
