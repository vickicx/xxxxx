//
//  SQZR3TableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/3/2.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface SQZR3TableViewCell : BaseTableViewCell

//转让本金
@property (nonatomic, strong) UILabel *zhuanRangBJLabel;

@property (nonatomic, strong) UILabel *zhuanRangbenjinLabel;

@property (nonatomic, strong) UITextField *zhuanRangBJTextField;
//预期所得利息
@property (nonatomic, strong) UILabel *yuQiSDLXLabel;

@property (nonatomic, strong) UILabel *yuQiSDRateLabel;
//折让利息金额
@property (nonatomic, strong) UILabel *zheRangLXJELabel;

@property (nonatomic, strong) UITextField *zheRangLXJETextField;

//转让手续费
@property (nonatomic,strong) UILabel *zhuanRangSXFLabel;

@property (nonatomic, strong) UILabel *zhuanRangSXFeeLabel;
//转让价格
@property (nonatomic, strong) UILabel *zhuanRangJGLabel;

@property (nonatomic, strong) UILabel *zhuanRangPriceLabel;

//剩余期限
@property (nonatomic, strong) UILabel *shengYuQX2Label;

@property (nonatomic, strong) UILabel *shengYuDay2Label;

//挂牌收益率
@property (nonatomic, strong) UILabel *guaPaiSYLLabel;

@property (nonatomic, strong) UILabel *guaPaiRateLabel;

//筹款期限
@property (nonatomic, strong) UILabel *chouKuanQXLabel;

@property (nonatomic, strong) UILabel *chouKuanDeadLineLabel;

//预计下架时间
@property (nonatomic, strong) UILabel *yuJiXJSJLabel;

@property (nonatomic, strong) UILabel *yuJiXJTimeLabel;

@end
