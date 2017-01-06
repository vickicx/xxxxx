//
//  DHFUserCouponViewController.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/3.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "DHFUseCouponTableViewCell.h"
#import "DHFCouponModel.h"

typedef void(^ReturnCouponInfo)(DHFCouponModel *couponModel);


@interface DHFUserCouponViewController : SubBaseViewController

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSString *amount;
@property (nonatomic, copy)NSString *productID;
@property (nonatomic, strong)NSIndexPath *selectedIndexPath;

@property (nonatomic, copy)ReturnCouponInfo returnCouponBlock;

- (void)returnCouponBlock:(ReturnCouponInfo)block;

@end
