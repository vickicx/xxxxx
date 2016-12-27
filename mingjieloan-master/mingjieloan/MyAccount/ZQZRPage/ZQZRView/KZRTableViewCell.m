//
//  KZRTableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/2/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "KZRTableViewCell.h"
#import "XXColor.h"

@implementation KZRTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.productNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.productNameLabel];
        
        self.zhuanRangButton = [[UIButton alloc] init];
        [self.contentView addSubview:self.zhuanRangButton];
        
        self.zhuanRangImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.zhuanRangImageView];
        
        self.lineView = [[UIView alloc] init];
        [self.contentView addSubview:self.lineView];
        
        self.xiangMuBJLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.xiangMuBJLabel];
        
        self.yuQiSYLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuQiSYLabel];
        
        self.shengYuQXLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.shengYuQXLabel];
        
        self.xiangMuPrincipalLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.xiangMuPrincipalLabel];
        
        self.yuQiRateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuQiRateLabel];
        
        self.restDayLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.restDayLabel];
        
        self.startImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.startImageView];
        
        self.qiXiRiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.qiXiRiLabel];
        
        self.startLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.startLabel];
        
        self.deadLineImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.deadLineImageView];
        
        self.daoQiRiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.daoQiRiLabel];
        
        self.deadLineLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.deadLineLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.productNameLabel.frame = CGRectMake(10 * kWIDTH, 10 * kHEIGHT, 375 * kWIDTH, 30 * kHEIGHT);
    self.productNameLabel.font = [UIFont systemFontOfSize:17 * kWIDTH];
    self.productNameLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.productNameLabel.backgroundColor = [UIColor redColor];
    
    self.zhuanRangImageView.frame = CGRectMake(375 * kWIDTH - 0 * kWIDTH - 30 * kWIDTH, 10 * kHEIGHT, 30 * kWIDTH, 30 * kHEIGHT);
    self.zhuanRangImageView.image = [UIImage imageNamed:@"zhuanRang"];
//    self.zhuanRangImageView.backgroundColor = [UIColor redColor];
    
    self.zhuanRangButton.frame = CGRectMake(375 * kWIDTH - 0 * kWIDTH - self.zhuanRangImageView.frame.size.width - 50 * kWIDTH, 10 * kHEIGHT, 60 * kWIDTH, 30 * kHEIGHT);
    self.zhuanRangButton.titleLabel.font = [UIFont systemFontOfSize:17 * kWIDTH];
    [self.zhuanRangButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
    self.zhuanRangButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.zhuanRangButton.backgroundColor = [UIColor yellowColor];
    
    self.lineView.frame = CGRectMake(10 * kWIDTH, 20 * kHEIGHT + self.productNameLabel.frame.size.height, 375 * kWIDTH - 20 * kWIDTH, 2 * kHEIGHT);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.xiangMuBJLabel.frame = CGRectMake(10 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height, 120 * kWIDTH, 25 * kHEIGHT);
    self.xiangMuBJLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.xiangMuBJLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.xiangMuBJLabel.backgroundColor = [UIColor yellowColor];
    
    self.yuQiSYLabel.frame = CGRectMake(120 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height, 150 * kWIDTH, 25 * kHEIGHT);
    self.yuQiSYLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.yuQiSYLabel.textAlignment = NSTextAlignmentCenter;
    self.yuQiSYLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.yuQiSYLabel.backgroundColor = [UIColor cyanColor];
    
    self.shengYuQXLabel.frame = CGRectMake(375 * kWIDTH - 10 * kWIDTH - 120 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height, 120 * kWIDTH, 25 * kHEIGHT);
    self.shengYuQXLabel.font = [UIFont systemFontOfSize: 16 * kWIDTH];
    self.shengYuQXLabel.textAlignment = NSTextAlignmentRight;
    self.shengYuQXLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.shengYuQXLabel.backgroundColor = [UIColor redColor];
    
    self.xiangMuPrincipalLabel.frame = CGRectMake(13 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height, 150 * kWIDTH, 25 * kHEIGHT);
    self.xiangMuPrincipalLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.xiangMuPrincipalLabel.textColor = [XXColor goldenColor];
//    self.xiangMuPrincipalLabel.backgroundColor = [UIColor cyanColor];
    
    self.yuQiRateLabel.frame = CGRectMake(135 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height, 120 * kWIDTH, 25 * kHEIGHT);
    self.yuQiRateLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.yuQiRateLabel.textColor = [XXColor goldenColor];
    self.yuQiRateLabel.textAlignment = NSTextAlignmentCenter;
//    self.yuQiRateLabel.backgroundColor = [UIColor yellowColor];
    
    self.restDayLabel.frame = CGRectMake(375 * kWIDTH - 10 * kWIDTH - 65 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height, 60 * kWIDTH, 25 * kHEIGHT);
    self.restDayLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.restDayLabel.textColor = [XXColor goldenColor];
    self.restDayLabel.textAlignment = NSTextAlignmentCenter;
//    self.restDayLabel.backgroundColor = [UIColor purpleColor];
    
    self.startImageView.frame = CGRectMake(10 * kWIDTH, 47.5 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height + self.xiangMuPrincipalLabel.frame.size.height, 12.2 * kWIDTH, 13 * kHEIGHT);
    self.startImageView.image = [UIImage imageNamed:@"zhuanrangguapai"];
//    self.startImageView.backgroundColor = [UIColor purpleColor];
    
    self.qiXiRiLabel.frame = CGRectMake(10 * kWIDTH + self.startImageView.frame.size.width, 45 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height + self.xiangMuPrincipalLabel.frame.size.height, 60 * kWIDTH, 20 * kHEIGHT);
    self.qiXiRiLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.qiXiRiLabel.textAlignment = NSTextAlignmentCenter;
    self.qiXiRiLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.qiXiRiLabel.backgroundColor = [UIColor blueColor];
    
    self.startLabel.frame = CGRectMake(10 * kWIDTH + self.startImageView.frame.size.width + self.qiXiRiLabel.frame.size.width, 45 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height + self.xiangMuPrincipalLabel.frame.size.height, 100 * kWIDTH, 20 * kHEIGHT);
    self.startLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
//    self.startLabel.textAlignment = NSTextAlignmentCenter;
    self.startLabel.textColor = [UIColor grayColor];
//    self.startLabel.backgroundColor = [UIColor cyanColor];
    
    self.deadLineImageView.frame = CGRectMake(188 * kWIDTH, 47.5 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height + self.xiangMuPrincipalLabel.frame.size.height, 12.2 * kWIDTH, 13 * kHEIGHT);
    self.deadLineImageView.image = [UIImage imageNamed:@"zhuanrangguapai"];
//    self.deadLineImageView.backgroundColor = [UIColor purpleColor];
    
    self.daoQiRiLabel.frame = CGRectMake(188 * kWIDTH + self.deadLineImageView.frame.size.width, 45 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height + self.xiangMuPrincipalLabel.frame.size.height, 60 * kWIDTH, 20 * kHEIGHT);
    self.daoQiRiLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.daoQiRiLabel.textAlignment = NSTextAlignmentCenter;
    self.daoQiRiLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.daoQiRiLabel.backgroundColor = [UIColor blueColor];
    
    self.deadLineLabel.frame = CGRectMake(188 * kWIDTH + self.deadLineImageView.frame.size.width + self.daoQiRiLabel.frame.size.width, 45 * kHEIGHT + self.productNameLabel.frame.size.height + self.xiangMuBJLabel.frame.size.height + self.xiangMuPrincipalLabel.frame.size.height, 100 * kWIDTH, 20 * kHEIGHT);
    self.deadLineLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
//    self.deadLineLabel.textAlignment = NSTextAlignmentCenter;
    self.deadLineLabel.textColor = [UIColor grayColor];
//    self.deadLineLabel.backgroundColor = [UIColor cyanColor];
    
    [self.zhuanRangButton setTitle:@"转让" forState:UIControlStateNormal];
    self.xiangMuBJLabel.text = @"项目本金";
    self.yuQiSYLabel.text = @"预期收益率";
    self.shengYuQXLabel.text = @"剩余期限";
    self.qiXiRiLabel.text = @"起息日";
    self.daoQiRiLabel.text = @"到期日";
    
}

- (void)setModel:(ZQZRModel *)model
{
    _model = model;
    
    self.productNameLabel.text = model.products_title;
    
    self.xiangMuPrincipalLabel.text = [NSString stringWithFormat:@"%@元", model.tender_amount];
    
    NSString *str = @"%";
    
    
    
    if (![model.extra_rate isEqualToString:@""] && [model.tender_from isEqualToString:@"1"]) {
        
        self.yuQiRateLabel.text = [NSString stringWithFormat:@"%@+%@%@", model.finance_interest_rate, model.extra_rate, str];
        
    }else{
        
        self.yuQiRateLabel.text = [NSString stringWithFormat:@"%@%@", model.finance_interest_rate, str];
    }
        
    self.restDayLabel.text = [NSString stringWithFormat:@"%@天", model.lave_date];
    
    self.startLabel.text = [NSString stringWithFormat:@"%@", model.finance_start_interest_date];
    
    self.deadLineLabel.text = [NSString stringWithFormat:@"%@", model.finance_end_interest_date];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
