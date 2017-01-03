//
//  HKZCell.m
//  Yilicai
//
//  Created by 盐商 on 16/7/11.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HKZCell.h"

@implementation HKZCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.touziLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.touziLabel];
        
        self.touziPriceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.touziPriceLabel];
        
        self.huiquanzhongLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.huiquanzhongLabel];
        
        self.lineView = [[UIView alloc] init];
        [self.contentView addSubview:self.lineView];
        
        self.titleNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleNameLabel];
        
        self.interestLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.interestLabel];
        
        self.extraLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.extraLabel];
        
        self.qixiDateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.qixiDateLabel];
        
        self.qishuLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.qishuLabel];
        
        self.nextDateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nextDateLabel];
        
        self.priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.priceLabel];
        
        self.deadLineLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.deadLineLabel];
        
        self.yinghuiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yinghuiLabel];
        
        self.transferButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.transferButton];
    }
    
    return self;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.touziLabel.frame = CGRectMake(10 * FitWidth, 5 * FitHeight, 40 * FitWidth, 30 * FitHeight);
    self.touziLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.touziLabel.textAlignment = NSTextAlignmentCenter;
    self.touziLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    self.touziLabel.text = @"投资";
//    self.touziLabel.backgroundColor = [UIColor redColor];
    
    self.touziPriceLabel.frame = CGRectMake(10 * FitWidth +self.touziLabel.frame.size.width, 5 * FitHeight, 200 * FitWidth, 30 * FitHeight);
    self.touziPriceLabel.textColor = [XXColor labGoldenColor];
    self.touziPriceLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
//    self.touziPriceLabel.backgroundColor = [UIColor yellowColor];
    
    self.huiquanzhongLabel.frame = CGRectMake(self.contentView.frame.size.width - 5 * FitWidth - 70 * FitWidth, 5 * FitWidth, 70 * FitWidth, 30 * FitHeight);
    self.huiquanzhongLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    self.huiquanzhongLabel.textAlignment = NSTextAlignmentCenter;
    self.huiquanzhongLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.huiquanzhongLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    self.huiquanzhongLabel.text = @"回款中";
    
    self.lineView.frame = CGRectMake(0, 0 * FitHeight + self.touziLabel.frame.size.width, self.contentView.frame.size.width, 1);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.titleNameLabel.frame = CGRectMake(10 * FitWidth, 20 * FitHeight + self.touziLabel.frame.size.height, 230 * FitWidth, 20 * FitHeight);
    self.titleNameLabel.font = [UIFont systemFontOfSize:12 * FitWidth];
    self.titleNameLabel.textColor = [UIColor darkGrayColor];
//    self.titleNameLabel.backgroundColor = [UIColor cyanColor];
    
    self.interestLabel.frame = CGRectMake(250 * FitWidth, 20 * FitHeight + self.touziLabel.frame.size.height, 70 * FitWidth, 20 * FitHeight);
    self.interestLabel.font = [UIFont systemFontOfSize:12 * FitWidth];
    self.interestLabel.textAlignment = NSTextAlignmentRight;
    self.interestLabel.textColor = [UIColor darkGrayColor];
//    self.interestLabel.backgroundColor = [UIColor blueColor];
    
    
     
    CGFloat width = [[self class] widthOfLabel:self.extaStr andWith: 16 * FitHeight];
    
    self.extraLabel.frame = CGRectMake(252 * FitWidth + self.interestLabel.frame.size.width, 22 * FitHeight + self.touziLabel.frame.size.height, width, 16 * FitHeight);
    self.extraLabel.font = [UIFont systemFontOfSize:10];
    self.extraLabel.textAlignment = NSTextAlignmentLeft;
    self.extraLabel.textColor = [UIColor whiteColor];
    self.extraLabel.backgroundColor = [UIColor colorWithRed:521 / 255.0 green:109 / 255.0 blue:28 / 255.0 alpha:1.0];
    self.extraLabel.layer.cornerRadius = 3 * FitWidth;
    self.extraLabel.layer.masksToBounds = YES;
    
    if ([self.extaStr isEqualToString:@""]) {
        
        self.extraLabel.hidden = YES;
        
    }else{
        
        self.extraLabel.hidden = NO;
    }
    
    
    self.qixiDateLabel.frame = CGRectMake(10 * FitWidth, 80 * FitHeight, 150 * FitWidth, 20 * FitHeight);
    self.qixiDateLabel.font = [UIFont systemFontOfSize:11 * FitWidth];
    self.qixiDateLabel.textColor = [UIColor darkGrayColor];
//    self.qixiDateLabel.backgroundColor = [UIColor purpleColor];
    
    self.qishuLabel.frame = CGRectMake(170 * FitWidth, 80 * FitHeight, 80 * FitWidth, 20 * FitHeight);
    self.qishuLabel.font = [UIFont systemFontOfSize:11 * FitWidth];
    self.qishuLabel.textColor = [UIColor darkGrayColor];
//    self.qishuLabel.backgroundColor = [UIColor redColor];
    
    self.nextDateLabel.frame = CGRectMake(10 * FitWidth, 80 * FitHeight + self.qixiDateLabel.frame.size.height, 150 * FitWidth, 20 * FitHeight);
    self.nextDateLabel.font = [UIFont systemFontOfSize:11 * FitHeight];
    self.nextDateLabel.textColor = [UIColor darkGrayColor];
//    self.nextDateLabel.backgroundColor = [UIColor orangeColor];
    
    self.priceLabel.frame = CGRectMake(170 * FitHeight, 80 * FitHeight + self.qixiDateLabel.frame.size.height, 120 * FitWidth, 20 * FitHeight);
    self.priceLabel.font = [UIFont systemFontOfSize:11 * FitWidth];
    self.priceLabel.textColor = [UIColor darkGrayColor];
//    self.priceLabel.backgroundColor = [UIColor yellowColor];
    
    self.deadLineLabel.frame = CGRectMake(10 * FitWidth, 80 * FitHeight + self.qixiDateLabel.frame.size.height + self.nextDateLabel.frame.size.height, 150 * FitWidth, 20 * FitHeight);
    self.deadLineLabel.font = [UIFont systemFontOfSize:11 * FitWidth];
    self.deadLineLabel.textColor = [UIColor darkGrayColor];
//    self.deadLineLabel.backgroundColor = [UIColor cyanColor];
    
    self.yinghuiLabel.frame = CGRectMake(170 * FitWidth, 80 * FitHeight + self.qixiDateLabel.frame.size.height + self.nextDateLabel.frame.size.height, 120 * FitWidth, 20 * FitHeight);
    self.yinghuiLabel.font = [UIFont systemFontOfSize:11 * FitWidth];
    self.yinghuiLabel.textColor = [UIColor darkGrayColor];
//    self.yinghuiLabel.backgroundColor = [UIColor blueColor];
    
    self.transferButton.frame = CGRectMake(self.contentView.frame.size.width - 10 * FitWidth - 50 * FitWidth, 90 * FitHeight, 50 * FitWidth, 25 * FitHeight);
    [self.transferButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.transferButton.backgroundColor = [UIColor colorWithRed:48 / 255.0 green:120 / 255.0 blue:210 / 255.0 alpha:1.0];
    self.transferButton.titleLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.transferButton.layer.cornerRadius = 5 * FitWidth;
    self.transferButton.layer.masksToBounds = YES;
    [self.transferButton setTitle:@"转让" forState:UIControlStateNormal];
}


- (void)setModel:(ReturningModel *)model
{
    _model = model;
    
    self.touziPriceLabel.text = [NSString stringWithFormat:@"%@元", model.price];
    
    self.titleNameLabel.text = model.name;
    
    NSString *str = @"%";
    
    self.interestLabel.text = [NSString stringWithFormat:@"%@%@", model.rate, str];
    
    if ([model.extra_rate isEqualToString:@""]) {
        
//        self.extraLabel.hidden = YES;
        
        self.extaStr = [NSString stringWithFormat:@"%@", model.extra_rate];
        
    }else{
        
//        self.extraLabel.hidden = NO;

        self.extaStr = [NSString stringWithFormat:@"+%@", model.extra_rate];
    }
    
    self.qixiDateLabel.text = [NSString stringWithFormat:@"起息日期 %@", model.interestBeginDate];
    
    self.qishuLabel.text = [NSString stringWithFormat:@"期数 %@", model.statusText];
    
    
    NSString *date = [[self class] getDateString:[model.repayTime stringValue]];
    
    self.nextDateLabel.text = [NSString stringWithFormat:@"下期回款日期 %@", date];
    
    self.priceLabel.text = [NSString stringWithFormat:@"金额 %@元", model.principalAndInterest];
    
    self.deadLineLabel.text = [NSString stringWithFormat:@"到期日期 %@", model.expiryDate];
    
    self.yinghuiLabel.text = [NSString stringWithFormat:@"应回 %@元", model.total];
}


+(NSString *)getDateString:(NSString *)spString
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[spString intValue]];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString* string=[dateFormat stringFromDate:confromTimesp];
    return string;
}


- (void)setExtaStr:(NSString *)extaStr
{
    _extaStr = extaStr;
    
    self.extraLabel.text = extaStr;
}

+ (CGFloat)widthOfLabel:(NSString *)text andWith:(CGFloat)height
{
    //第一步: 设置文本的最大显示范围
    CGSize size = CGSizeMake(MAXFLOAT, height);
    
    //第二步: 设置字体样式
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:10] forKey:NSFontAttributeName];
    
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
