//
//  HKJHTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "HKJHTableViewCell.h"

@implementation HKJHTableViewCell

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
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(30 * FitWidth, 0, labegLength, 40)];
    _timeLab.textAlignment =NSTextAlignmentCenter;
    _timeLab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _timeLab.textColor = GetColor(@"#555555");
    [self.contentView addSubview:_timeLab];
    
    
    self.benjinLab = [[UILabel alloc] initWithFrame:CGRectMake(30 * FitWidth + labegLength, 0, labegLength, 40)];
    _benjinLab.textAlignment =NSTextAlignmentCenter;
    _benjinLab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _benjinLab.textColor = GetColor(@"#555555");
    [self.contentView addSubview:_benjinLab];
    
    
    self.lixiLab = [[UILabel alloc] initWithFrame:CGRectMake(30 * FitWidth + labegLength * 2, 0, labegLength, 40)];
    _lixiLab.textAlignment =NSTextAlignmentCenter;
    _lixiLab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _lixiLab.textColor = GetColor(@"#555555");
    [self.contentView addSubview:_lixiLab];
    
    
    self.zongeLab = [[UILabel alloc] initWithFrame:CGRectMake(30 * FitWidth + labegLength * 3, 0, labegLength, 40)];
    _zongeLab.textAlignment =NSTextAlignmentCenter;
    _zongeLab.font = [UIFont systemFontOfSize:14 * FitHeight];
    _zongeLab.textColor = GetColor(@"#555555");
    [self.contentView addSubview:_zongeLab];
    
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 39, kWIDTH - 30, 1)];
    _lineView.backgroundColor = GetColor(@"#F6F6F6");
    [self.contentView addSubview:_lineView];
     
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