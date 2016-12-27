//
//  YJQCell.m
//  Yilicai
//
//  Created by 盐商 on 16/7/11.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "YJQCell.h"
#import "XXColor.h"

@implementation YJQCell

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
        
        
        self.deadLineLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.deadLineLabel];
        
        self.yihuiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yihuiLabel];
        
    }
    
    return self;
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.touziLabel.frame = CGRectMake(10 * kWIDTH, 5 * kHEIGHT, 40 * kWIDTH, 30 * kHEIGHT);
    self.touziLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.touziLabel.textAlignment = NSTextAlignmentCenter;
    
    //不明颜色
    self.touziLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    self.touziLabel.text = @"投资";
//    self.touziLabel.backgroundColor = [UIColor redColor];
    
    self.touziPriceLabel.frame = CGRectMake(10 * kWIDTH +self.touziLabel.frame.size.width, 5 * kHEIGHT, 200 * kWIDTH, 30 * kHEIGHT);
    
    //不明颜色
    self.touziPriceLabel.textColor = [XXColor goldenColor];
    self.touziPriceLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
//    self.touziPriceLabel.backgroundColor = [UIColor yellowColor];
    
    self.huiquanzhongLabel.frame = CGRectMake(self.contentView.frame.size.width - 5 * kWIDTH - 70 * kWIDTH, 5 * kWIDTH, 70 * kWIDTH, 30 * kHEIGHT);
    
    //不明颜色
    self.huiquanzhongLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    self.huiquanzhongLabel.textAlignment = NSTextAlignmentCenter;
    self.huiquanzhongLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.huiquanzhongLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    self.huiquanzhongLabel.text = @"已结清";
    
    self.lineView.frame = CGRectMake(0, 0 * kHEIGHT + self.touziLabel.frame.size.width, self.contentView.frame.size.width, 1);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.titleNameLabel.frame = CGRectMake(10 * kWIDTH, 20 * kHEIGHT + self.touziLabel.frame.size.height, 230 * kWIDTH, 20 * kHEIGHT);
    self.titleNameLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.titleNameLabel.textColor = [UIColor darkGrayColor];
//    self.titleNameLabel.backgroundColor = [UIColor cyanColor];
    
    self.interestLabel.frame = CGRectMake(250 * kWIDTH, 20 * kHEIGHT + self.touziLabel.frame.size.height, 70 * kWIDTH, 20 * kHEIGHT);
    self.interestLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.interestLabel.textAlignment = NSTextAlignmentRight;
    self.interestLabel.textColor = [UIColor darkGrayColor];
//    self.interestLabel.backgroundColor = [UIColor blueColor];
    
    
    
    
    CGFloat width = [[self class] widthOfLabel:self.extaStr andWith: 16 * kHEIGHT];
    
    self.extraLabel.frame = CGRectMake(252 * kWIDTH + self.interestLabel.frame.size.width, 22 * kHEIGHT + self.touziLabel.frame.size.height, width, 16 * kHEIGHT);
    self.extraLabel.font = [UIFont systemFontOfSize:10];
    self.extraLabel.textAlignment = NSTextAlignmentLeft;
    self.extraLabel.textColor = [UIColor whiteColor];
    self.extraLabel.backgroundColor = [UIColor colorWithRed:521 / 255.0 green:109 / 255.0 blue:28 / 255.0 alpha:1.0];
    self.extraLabel.layer.cornerRadius = 3 * kWIDTH;
    self.extraLabel.layer.masksToBounds = YES;
    
    if ([self.extaStr isEqualToString:@""]) {
        
        self.extraLabel.hidden = YES;
        
    }else{
        
        self.extraLabel.hidden = NO;
    }
    
//    self.extraLabel.hidden = YES;
    
    self.qixiDateLabel.frame = CGRectMake(10 * kWIDTH, 80 * kHEIGHT, 150 * kWIDTH, 20 * kHEIGHT);
    self.qixiDateLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.qixiDateLabel.textColor = [UIColor darkGrayColor];
//    self.qixiDateLabel.backgroundColor = [UIColor purpleColor];
    
    self.qishuLabel.frame = CGRectMake(170 * kWIDTH, 80 * kHEIGHT, 80 * kWIDTH, 20 * kHEIGHT);
    self.qishuLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.qishuLabel.textColor = [UIColor darkGrayColor];
//    self.qishuLabel.backgroundColor = [UIColor redColor];
    
    self.deadLineLabel.frame = CGRectMake(10 * kWIDTH, 80 * kHEIGHT + self.qixiDateLabel.frame.size.height, 150 * kWIDTH, 20 * kHEIGHT);
    self.deadLineLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.deadLineLabel.textColor = [UIColor darkGrayColor];
//    self.deadLineLabel.backgroundColor = [UIColor orangeColor];
    
    self.yihuiLabel.frame = CGRectMake(170 * kWIDTH, 80 * kHEIGHT + self.qixiDateLabel.frame.size.height, 120 * kWIDTH, 20 * kHEIGHT);
    self.yihuiLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.yihuiLabel.textColor = [UIColor darkGrayColor];
//    self.yihuiLabel.backgroundColor = [UIColor yellowColor];
    
}


- (void)setModel:(ReturnedModel *)model
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
    
    self.deadLineLabel.text = [NSString stringWithFormat:@"结清日期 %@", model.endDate];
    
    self.yihuiLabel.text = [NSString stringWithFormat:@"已回 %@元", model.lastReturn];
    
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
