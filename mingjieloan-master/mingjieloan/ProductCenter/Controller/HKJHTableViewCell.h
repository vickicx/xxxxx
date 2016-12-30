//
//  HKJHTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductRepayPlanModel.h"

@interface HKJHTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *timeLab;
@property (nonatomic, strong)UILabel *benjinLab;
@property (nonatomic, strong)UILabel *lixiLab;
@property (nonatomic, strong)UILabel *zongeLab;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)ProductRepayPlanModel *planModel;
@end
