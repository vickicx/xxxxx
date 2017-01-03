//
//  DHFInviteHistoryTableViewCell.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFInviteHistoryTableViewCell.h"

@implementation DHFInviteHistoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createViews];
    }
    return self;
}

- (void)createViews{
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 15, 100, 15)];
    _nameLab.font = [UIFont systemFontOfSize:14];
    _nameLab.text = @"陈曦";
    [self.contentView addSubview:_nameLab];
    
    self.yifanLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, kWIDTH, 15)];
    _yifanLab.font = [UIFont systemFontOfSize:14];
    _yifanLab.text = @"已返";
    _yifanLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_yifanLab];
    
    self.fanliLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 140, 15, 120, 15)];
    _fanliLab.textAlignment = NSTextAlignmentCenter;
    _fanliLab.font = [UIFont systemFontOfSize:14];
    _fanliLab.text = @"返利时间";
    [self.contentView addSubview:_fanliLab];
    
    self.yaoqingLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 50, 100, 15)];
    _yaoqingLab.textColor = [UIColor redColor];
    _yaoqingLab.font = [UIFont systemFontOfSize:14];
    _yaoqingLab.text = @"邀请投资";
    [self.contentView addSubview:_yaoqingLab];
    
    self.moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, kWIDTH, 15)];
    _moneyLab.textColor = [UIColor redColor];
    _moneyLab.font = [UIFont systemFontOfSize:14];
    _moneyLab.text = @"0.05元";
    _moneyLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_moneyLab];
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 140, 50, 120, 15)];
    _timeLab.textColor = [UIColor redColor];
    _timeLab.textAlignment = NSTextAlignmentCenter;
    _timeLab.text = @"2016-12-25";
    _timeLab.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_timeLab];
    
    
    
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
