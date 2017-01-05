//
//  DHFZRTBViewController.h
//  mingjieloan
//
//  Created by kang on 17/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"

#import "DHFZRProductCell.h"
#import "TBTableViewCell.h"

#import "ProductOrdersModel.h"
#import "ProductRepayPlanModel.h"
#import "ProductDetailModel.h"//项目详情Model
#import "PApplicationModel.h"//借款 人信息Model
#import "pApplicationCheckModel.h"//审核信息
#import "InformationModel.h"

#import "DHFcommonWebViewVC.h"

#import "BasicInfo.h"

@interface DHFZRTBViewController : SubBaseViewController

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

@property (nonatomic, copy)NSString *coupon;
@property (nonatomic, copy)NSString *money;
@property (nonatomic, copy)NSString *idNumber;
@property (nonatomic, strong)ProductDetailModel *detailModel;
@property (nonatomic, strong)PApplicationModel *pApplocationModel;
@property (nonatomic, strong)pApplicationCheckModel *checkModel;
@property (nonatomic, strong)NSMutableArray *informaModel;
@property (nonatomic, strong)NSMutableDictionary *productDic;



@end
