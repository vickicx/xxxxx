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
#import "ProductModel.h"

@interface ProductCenterViewController : BaseViewController

@property (nonatomic, strong)SDCycleScrollView *sdcScrollView;
@property (strong , nonatomic)NSArray *netImages;  //网络图片
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *modelArray;


@end
