//
//  TBJLTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "TBJLTableViewCell.h"

@implementation TBJLTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
        [self createViews];
    }
    return self;
}

- (void)createViews{
    CGFloat labegLength = (kWIDTH - 60 * FitWidth )/ 4;
    
    self.peopleLab = [[UILabel alloc] initWithFrame:CGRectMake(30 * FitWidth, 0, labegLength, 40)];
    _peopleLab.textAlignment =NSTextAlignmentCenter;
    _peopleLab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _peopleLab.textColor = GetColor(@"#555555");
    [self.contentView addSubview:_peopleLab];
    
    
    self.moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(30 * FitWidth + labegLength -20, 0, labegLength * 1.5, 40)];
    _moneyLab.textAlignment =NSTextAlignmentCenter;
    _moneyLab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _moneyLab.textColor = GetColor(@"#555555");
    [self.contentView addSubview:_moneyLab];
    
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(30 * FitWidth + labegLength * 2.5 - 20, 0, labegLength* 1.5 + 20, 40)];
    _timeLab.textAlignment =NSTextAlignmentCenter;
    _timeLab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _timeLab.textColor = GetColor(@"#555555");
    [self.contentView addSubview:_timeLab];
    
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 39, kWIDTH - 30, 1)];
    _lineView.backgroundColor = GetColor(@"#F6F6F6");
    [self.contentView addSubview:_lineView];
    
}

- (void)setOrdersModel:(ProductOrdersModel *)ordersModel{
    _ordersModel = ordersModel;
    
    _peopleLab.text = _ordersModel.realName;
    _moneyLab.text = [NSString stringWithFormat:@"￥%@", _ordersModel.price];
    _timeLab.text = _ordersModel.createDate;
    
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
