//
//  MyCardTableViewCell.m
//  mingjieloan
//
//  Created by 王好帅 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "MyCardTableViewCell.h"

@implementation MyCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    
    self.bgIV               = [[UIImageView alloc] initWithFrame:CGRectMake(10*FitWidth, 5*FitHeight, kWIDTH -20*FitWidth, 110*FitHeight)];
    
    self.circleImageView    = [[UIImageView alloc] initWithFrame:CGRectMake(33*FitWidth, 14*FitHeight, 70*FitWidth, 70*FitHeight)];
    
    self.cashPriceLabel     = [[UILabel alloc] initWithFrame:CGRectMake(33*FitWidth, 24*FitHeight, 70*FitWidth, 50*FitHeight)];
    self.cashPriceLabel.font= RealFont(18);
    self.cashPriceLabel.textAlignment = NSTextAlignmentCenter;
    self.cashPriceLabel.textColor     = [UIColor whiteColor];
    
    self.timeDes            = [[UILabel alloc] initWithFrame:CGRectMake(210*FitWidth, 57*FitHeight, 90*FitWidth, 15*FitHeight)];
    self.timeDes.font       = RealFont(12);
    
    self.beginTime          = [[UILabel alloc] initWithFrame:CGRectMake(200*FitWidth, 73*FitHeight, 100*FitWidth, 15*FitHeight)];
    self.beginTime.font     = RealFont(12);
    
    self.activeTime         = [[UILabel alloc] initWithFrame:CGRectMake(130*FitWidth, 91*FitHeight, 178*FitWidth, 15*FitHeight)];
    self.activeTime.font    = RealFont(12);
    self.activeTime.textAlignment = NSTextAlignmentCenter;
    self.activeTime.textColor = [UIColor whiteColor];
    
    self.useBtn             = [UIButton buttonWithType:UIButtonTypeSystem];
    self.useBtn.frame       = CGRectMake(kWIDTH - 100*FitWidth, 94*FitHeight, 80*FitWidth, 15*FitHeight);
    
    [self.useBtn setTitle:@"立即使用>" forState:UIControlStateNormal];
    self.useBtn.titleLabel.font = RealFont(14);
    [self.useBtn addTarget:self action:@selector(userButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.quanTypeLabel      = [[UILabel alloc] initWithFrame:CGRectMake(33*FitWidth, 85*FitHeight, 70*FitWidth, 21*FitHeight)];
    self.quanTypeLabel.font = RealFont(16);
    self.quanTypeLabel.textAlignment = NSTextAlignmentCenter;
    
    self.cashDes            = [[UILabel alloc] initWithFrame:CGRectMake(142*FitWidth, 5*FitHeight, 151*FitWidth, 80*FitHeight)];
    self.cashDes.font       = RealFont(13);
    
    self.usedImageView      = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 120*FitWidth, 25*FitHeight, 100*FitWidth, 80*FitHeight)];
    
    [self addSubview:self.bgIV];
    [self addSubview:self.circleImageView];
    [self addSubview:self.cashPriceLabel];
    [self addSubview:self.timeDes];
    [self addSubview:self.beginTime];
    [self addSubview:self.activeTime];
    [self addSubview:self.useBtn];
    [self addSubview:self.quanTypeLabel];
    [self addSubview:self.cashDes];
    [self addSubview:self.usedImageView];
    
}

- (void)userButton:(UIButton *)button {
    [self.delegate useCard];
}

- (void)setModel:(MyCardModel *)model {
    if (_model != model) {
        _model  = model;
    }
    
    self.cashDes.text                   = model.casha_desc;
    
    if (model.type_flag.integerValue    == 2) {
        self.cashPriceLabel.text         = [NSString stringWithFormat:@"￥%@元",model.cash_price];
        self.quanTypeLabel.text          = @"现金券";
    } else {
        
        self.cashPriceLabel.text         = [NSString stringWithFormat:@"+%@%%",model.cash_price];
        self.quanTypeLabel.text          = @"加息券";
    }
    if (model.status.integerValue       == 1) {
        self.beginTime.text             = @"";
        self.activeTime.text            = [NSString stringWithFormat:@"有效期至:%@",model.end_time];
        self.bgIV.image                 = [UIImage imageNamed:@"notUsedCash"];
        self.circleImageView.image      = [UIImage imageNamed:@"circle_BG"];
        self.quanTypeLabel.textColor    = UIColorWithRGB(241.0, 255.0, 221.0);
        self.usedImageView.hidden       = YES;
        [self.useBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    } else if (model.status.integerValue== 2 ) {
        self.beginTime.text             = @"";
        self.activeTime.text            = [NSString stringWithFormat:@"使用时间：%@",model.used_time];
        self.bgIV.image                 = [UIImage imageNamed:@"hasUsedCash"];
        self.circleImageView.image      = [UIImage imageNamed:@"circle_gray"];
        self.quanTypeLabel.textColor    = [UIColor whiteColor];
        self.usedImageView.hidden       = NO;
        self.usedImageView.image        = [UIImage imageNamed:@"used"];
        [self.useBtn setTitle:@"已使用" forState:UIControlStateNormal];
        [self.useBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.useBtn.enabled             = NO;
    } else if (model.status.integerValue== 99) {
        self.beginTime.text             = [NSString stringWithFormat:@"领取时间%@",model.start_time];
        self.activeTime.text            = [NSString stringWithFormat:@"有效期至%@",model.end_time];
        self.bgIV.image                 = [UIImage imageNamed:@"hasUsedCash"];
        self.circleImageView.image      = [UIImage imageNamed:@"circle_gray"];
        self.quanTypeLabel.textColor    = [UIColor whiteColor];
        self.usedImageView.hidden       = NO;
        self.usedImageView.image        = [UIImage imageNamed:@"outOfDate"];
        [self.useBtn setTitle:@"已过期" forState:UIControlStateNormal];
        [self.useBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.useBtn.enabled             = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
