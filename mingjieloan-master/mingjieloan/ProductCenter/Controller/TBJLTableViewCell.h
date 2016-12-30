//
//  TBJLTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductOrdersModel.h"


@interface TBJLTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *peopleLab;
@property (nonatomic, strong)UILabel *moneyLab;
@property (nonatomic, strong)UILabel *timeLab;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)ProductOrdersModel *ordersModel;

@end
