//
//  DHFUseCouponTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/3.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFUseCouponTableViewCell.h"

@implementation DHFUseCouponTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        [self createViews];
    }
    return self;
}

- (void)createViews{
    
     self.isSelected = NO;
    self.selectedImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 45, 30, 30)];
    _selectedImg.image = [UIImage imageNamed:@"cashNotSelectedCircle"];
    [self.contentView addSubview:_selectedImg];
    
    self.cashBG = [[UIImageView alloc] initWithFrame:CGRectMake(65, 10, kWIDTH - 80, 100)];
    _cashBG.image = [UIImage imageNamed:@"cashBG"];
    [self.contentView addSubview:_cashBG];
    
    self.cricle_smal = [[UIImageView alloc] initWithFrame:CGRectMake(30 * FitWidth, 10, 65, 65)];
    _cricle_smal.image = [UIImage imageNamed:@"circle_small"];
    [_cashBG addSubview:_cricle_smal];
    
    self.cashPrice = [[UILabel alloc] initWithFrame:CGRectMake(-10, 20, 85, 25)];
    _cashPrice.font = [UIFont systemFontOfSize: 16 * FitHeight];
    _cashPrice.textAlignment = NSTextAlignmentCenter;
    _cashPrice.textColor = [UIColor whiteColor];
    _cashPrice.text = @"¥100元";
    [_cricle_smal addSubview:_cashPrice];
    
    self.cashDes = [[UILabel alloc] initWithFrame:CGRectMake(130 * FitWidth, 10, kWIDTH - 210 * FitWidth, 65)];
    _cashDes.textColor = [UIColor whiteColor];
    _cashDes.font = [UIFont systemFontOfSize:11 * FitHeight];
    _cashDes.textAlignment = NSTextAlignmentCenter;
    _cashDes.numberOfLines = 0;
    _cashDes.text = @"单笔投资上限100，000元适用于6个月以上的项目";
    [_cashBG addSubview:_cashDes];
    
    self.quanTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, 130 * FitWidth, 20)];
    _quanTypeLabel.font = [UIFont systemFontOfSize:15 * FitHeight];
    _quanTypeLabel.textColor = GetColor(@"#F7FED9");
    _quanTypeLabel.text = @"现金券";
    _quanTypeLabel.textAlignment = NSTextAlignmentCenter;
    [_cashBG addSubview:_quanTypeLabel];
    
    self.activeTime = [[UILabel alloc] initWithFrame:CGRectMake(130 * FitWidth, 75, kWIDTH - 210 * FitWidth, 20)];
    _activeTime.textColor = [UIColor whiteColor];
    _activeTime.font = [UIFont systemFontOfSize:12 * FitHeight];
    _activeTime.textAlignment = NSTextAlignmentCenter;
    _activeTime.text = @"(有效期至：2017.01.23)";
    [_cashBG addSubview:_activeTime];
    
    
    
}


- (void)setCouponModel:(DHFCouponModel *)couponModel{
    _couponModel = couponModel;
    
    _cashPrice.text = [NSString stringWithFormat:@"￥%@元", _couponModel.cash_price];
    _cashDes.text = _couponModel.cash_desc;
    _activeTime.text = _couponModel.end_time;
    
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
