//
//  TZJLDetail1Cell.m
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "TZJLDetail1Cell.h"

@implementation TZJLDetail1Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.touzijineLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.touzijineLabel];
        
        self.touziPriceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.touziPriceLabel];
        
        self.nianhuashouyilvLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nianhuashouyilvLabel];
        
        self.nianhuaRateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nianhuaRateLabel];
        
        self.extraLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.extraLabel];
        
        self.huankuanfangshiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.huankuanfangshiLabel];
        
        self.huankuanWayLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.huankuanWayLabel];
        
        self.qixianLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.qixianLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.dateLabel];
        
        self.qixiriqiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.qixiriqiLabel];
        
        self.qixiDateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.qixiDateLabel];
        
        self.daoqiriqiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.daoqiriqiLabel];
        
        self.deadLineLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.deadLineLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.touzijineLabel.frame = CGRectMake(10 * kWIDTH, 10 * kHEIGHT, 60 * kWIDTH, 20 * kHEIGHT);
    self.touzijineLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.touzijineLabel.textColor = [UIColor darkGrayColor];
    self.touzijineLabel.text = @"投资金额:";
//    self.touzijineLabel.backgroundColor = [UIColor redColor];
    
    self.touziPriceLabel.frame = CGRectMake(10 * kWIDTH + self.touzijineLabel.frame.size.width, 10 * kHEIGHT, 120 * kWIDTH, 20 * kHEIGHT);
    self.touziPriceLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.touziPriceLabel.textColor = [XXColor labGoldenColor];
//    self.touziPriceLabel.backgroundColor = [UIColor orangeColor];
    
    self.nianhuashouyilvLabel.frame = CGRectMake(210 * kWIDTH, 10 * kHEIGHT, 70 * kWIDTH, 20 * kHEIGHT);
    self.nianhuashouyilvLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.nianhuashouyilvLabel.textColor = [UIColor darkGrayColor];
    self.nianhuashouyilvLabel.text = @"年化收益率:";
//    self.nianhuashouyilvLabel.backgroundColor = [UIColor yellowColor];
    
    
//    self.rateStr = @"10.8%";
    
    CGFloat rateWidth = [[self class] widthOfLabel:self.rateStr andWith: 16 * kHEIGHT];
    
    self.nianhuaRateLabel.frame = CGRectMake(210 * kWIDTH + self.nianhuashouyilvLabel.frame.size.width, 10 * kHEIGHT, rateWidth, 20 * kHEIGHT);
    self.nianhuaRateLabel.font = [UIFont systemFontOfSize:11];
    self.nianhuaRateLabel.textColor = [UIColor darkGrayColor];
//    self.nianhuaRateLabel.backgroundColor = [UIColor cyanColor];
    
//    self.extaStr = @"+3.23%";
    
    CGFloat extaWidth = [[self class] widthOfLabel:self.extaStr andWith: 16 * kHEIGHT];
    
    self.extraLabel.frame = CGRectMake(210 * kWIDTH + self.nianhuashouyilvLabel.frame.size.width + rateWidth + 2 * kWIDTH, 12 * kHEIGHT, extaWidth, 16 * kHEIGHT);
    self.extraLabel.font = [UIFont systemFontOfSize:11];
    self.extraLabel.textColor = [UIColor whiteColor];
    self.extraLabel.backgroundColor = [UIColor colorWithRed:521 / 255.0 green:109 / 255.0 blue:28 / 255.0 alpha:1.0];
    self.extraLabel.layer.cornerRadius = 3 * kWIDTH;
    self.extraLabel.layer.masksToBounds = YES;
    
    if ([self.extaStr isEqualToString:@""]) {
        
        self.extraLabel.hidden = YES;
        
    }else{
        
        self.extraLabel.hidden = NO;
        
    }
    
    self.huankuanfangshiLabel.frame = CGRectMake(10 * kWIDTH, 15 * kHEIGHT + self.touzijineLabel.frame.size.height, 60 * kWIDTH, 20 * kHEIGHT);
    self.huankuanfangshiLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.huankuanfangshiLabel.textColor = [UIColor darkGrayColor];
    self.huankuanfangshiLabel.text = @"还款方式:";
//    self.huankuanfangshiLabel.backgroundColor = [UIColor cyanColor];
    
    self.huankuanWayLabel.frame = CGRectMake(10 * kWIDTH + self.huankuanfangshiLabel.frame.size.width, 15 * kHEIGHT + self.touzijineLabel.frame.size.height, 120 * kWIDTH, 20 * kHEIGHT);
    self.huankuanWayLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.huankuanWayLabel.textColor = [UIColor darkGrayColor];
//    self.huankuanWayLabel.backgroundColor = [UIColor redColor];
    
    self.qixianLabel.frame = CGRectMake(210 * kWIDTH, 15 * kHEIGHT + self.touzijineLabel.frame.size.height, 60 * kWIDTH, 20 * kHEIGHT);
    self.qixianLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.qixianLabel.textColor = [UIColor darkGrayColor];
    self.qixianLabel.text = @"项目期限:";
//    self.qixianLabel.backgroundColor = [UIColor orangeColor];
    
    self.dateLabel.frame = CGRectMake(210 * kWIDTH + self.qixianLabel.frame.size.width, 15 * kHEIGHT + self.touzijineLabel.frame.size.height, 100 * kWIDTH, 20 * kHEIGHT);
    self.dateLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.dateLabel.textColor = [UIColor darkGrayColor];
//    self.dateLabel.backgroundColor = [UIColor yellowColor];
    
    self.qixiriqiLabel.frame = CGRectMake(10 * kWIDTH, 20 * kHEIGHT + self.touzijineLabel.frame.size.height + self.huankuanfangshiLabel.frame.size.height, 60 * kWIDTH, 20 * kHEIGHT);
    self.qixiriqiLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.qixiriqiLabel.textColor = [UIColor darkGrayColor];
    self.qixiriqiLabel.text = @"起息日期:";
//    self.qixiriqiLabel.backgroundColor = [UIColor yellowColor];
    
    self.qixiDateLabel.frame = CGRectMake(10 * kWIDTH + self.qixiriqiLabel.frame.size.width, 20 * kHEIGHT + self.touzijineLabel.frame.size.height + self.huankuanfangshiLabel.frame.size.height, 120 * kWIDTH, 20 * kHEIGHT);
    self.qixiDateLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.qixiDateLabel.textColor = [UIColor darkGrayColor];
//    self.qixiDateLabel.backgroundColor = [UIColor blueColor];
    
    self.daoqiriqiLabel.frame = CGRectMake(210 * kWIDTH, 20 * kHEIGHT + self.touzijineLabel.frame.size.height + self.huankuanfangshiLabel.frame.size.height, 60 * kWIDTH, 20 * kHEIGHT);
    self.daoqiriqiLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.daoqiriqiLabel.textColor = [UIColor darkGrayColor];
    self.daoqiriqiLabel.text = @"到期日期:";
//    self.daoqiriqiLabel.backgroundColor = [UIColor redColor];
    
    self.deadLineLabel.frame = CGRectMake(210 * kWIDTH + self.daoqiriqiLabel.frame.size.width, 20 * kHEIGHT + self.touzijineLabel.frame.size.height + self.huankuanfangshiLabel.frame.size.height, 100 * kWIDTH, 20 * kHEIGHT);
    self.deadLineLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.deadLineLabel.textColor = [UIColor darkGrayColor];
//    self.deadLineLabel.backgroundColor = [UIColor cyanColor];
}

- (void)setRateStr:(NSString *)rateStr
{
    _rateStr = rateStr;
    
    self.nianhuaRateLabel.text = rateStr;
    
}

- (void)setExtaStr:(NSString *)extaStr
{
    _extaStr = extaStr;
    
    self.extraLabel.text = extaStr;
}

- (void)setModel:(TZJLDetailModel *)model
{
    _model = model;
    
    NSString *str = @"%";
    
    self.touziPriceLabel.text = [NSString stringWithFormat:@"¥%@元", model.total];
    
    self.rateStr = [NSString stringWithFormat:@"%@%@", model.finance_interest_rate, str];
    
    if ([model.extra_rate isEqualToString:@""]) {
        
        self.extaStr = model.extra_rate;
        
    }else{
        
        self.extaStr = [NSString stringWithFormat:@"+%@", model.extra_rate];
        
    }
    
    self.huankuanWayLabel.text = model.finance_repay_type;
    
    self.dateLabel.text = model.finance_period;
    
    self.qixiDateLabel.text = model.finance_start_interest_date;
    
    self.deadLineLabel.text = model.finance_end_interest_date;
    
}


+ (CGFloat)widthOfLabel:(NSString *)text andWith:(CGFloat)height
{
    //第一步: 设置文本的最大显示范围
    CGSize size = CGSizeMake(MAXFLOAT, height);
    
    //第二步: 设置字体样式
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:11] forKey:NSFontAttributeName];
    
    //
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return frame.size.width;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
