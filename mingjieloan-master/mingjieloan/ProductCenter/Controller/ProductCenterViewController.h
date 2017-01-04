//
//  ProductCenterViewController.h
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "BaseViewController.h"
#import "SDCycleScrollView.h"
#import "DHFProductCenterCell.h"
#import "DHFTwoProductDetailViewController.h"
#import "DHFThreeProductDetailViewController.h"
#import "DHFZRProductDetailViewController.h"//转让标
#import "ProductModel.h"

#import "ProductOrdersModel.h"
#import "ProductRepayPlanModel.h"
#import "ProductDetailModel.h"//项目详情Model
#import "PApplicationModel.h"//借款 人信息Model
#import "pApplicationCheckModel.h"//审核信息

@interface ProductCenterViewController : BaseViewController

@property (nonatomic, strong)SDCycleScrollView *sdcScrollView;
@property (strong , nonatomic)NSArray *netImages;  //网络图片
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *modelArray;


@property (nonatomic, strong)ProductDetailModel *detailModel;
@property (nonatomic, strong)PApplicationModel *pApplocationModel;
@property (nonatomic, strong)pApplicationCheckModel *checkModel;

@end
