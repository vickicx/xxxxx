//
//  DHFUseCouponTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/3.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHFCouponModel.h"

@interface DHFUseCouponTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *selectedImg;
@property (nonatomic, strong)UIImageView *cashBG;
@property (nonatomic, strong)UIImageView *cricle_smal;
@property (nonatomic, strong)UILabel *cashPrice;
@property (nonatomic, strong)UILabel *cashDes;
@property (nonatomic, strong)UILabel *activeTime;
@property (nonatomic, strong)UILabel *quanTypeLabel;
@property (nonatomic, assign)BOOL isSelected;
@property (nonatomic, strong)DHFCouponModel *couponModel;

@end
