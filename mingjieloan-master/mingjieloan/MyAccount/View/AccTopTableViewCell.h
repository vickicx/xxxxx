//
//  AccTopTableViewCell.h
//  mingjieloan
//
//  Created by vicki on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccTopTableViewCell : UITableViewCell
//总资产
@property (nonatomic,strong) UILabel *totalMoney;
//预期待收益
@property (nonatomic,strong) UILabel *yuqishouyiLab;
//交易记录
@property (nonatomic,strong) UIButton *myCarBtn;
@end
