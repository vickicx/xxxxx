//
//  ZRZTableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/2/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "ZRZTableViewCell.h"
#import "XXColor.h"

@implementation ZRZTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.productNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.productNameLabel];
        
        self.zhuanRangLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangLabel];
        
        self.lineView = [[UIView alloc] init];
        [self.contentView addSubview:self.lineView];
        
        self.zhuanRangJGLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangJGLabel];
        
        self.yuQiSYLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuQiSYLabel];
        
        self.shengYuQXLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.shengYuQXLabel];
        
        self.zhuanRangPriceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangPriceLabel];
        
        self.yuQiRateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuQiRateLabel];
        
        self.restDayLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.restDayLabel];
        
        self.zhuanRangGPRQImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.zhuanRangGPRQImageView];
        
        self.zhuanRangGPRQLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangGPRQLabel];
        
        self.zhuanRangGPDateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangGPDateLabel];
        
        self.zhuanRangXJRQImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.zhuanRangXJRQImageView];
        
        self.zhuanRangXJRQLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangXJRQLabel];
        
        self.zhuanRangXJDateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangXJDateLabel];
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
    
    
    self.zhuanRangLabel.frame = CGRectMake(375 * kWIDTH - 10 * kWIDTH - 60 * kWIDTH, 10 * kHEIGHT, 60 * kWIDTH, 30 * kHEIGHT);
    self.zhuanRangLabel.font = [UIFont systemFontOfSize:17 * kWIDTH];
    self.zhuanRangLabel.textAlignment = NSTextAlignmentCenter;
    self.zhuanRangLabel.textColor = [XXColor goldenColor];
    //    self.zhuanRangLabel.backgroundColor = [UIColor yellowColor];
    
    self.lineView.frame = CGRectMake(10 * kWIDTH, 20 * kHEIGHT + self.productNameLabel.frame.size.height, 375 * kWIDTH - 20 * kWIDTH, 2 * kHEIGHT);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.zhuanRangJGLabel.frame = CGRectMake(10 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height, 120 * kWIDTH, 25 * kHEIGHT);
    self.zhuanRangJGLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.zhuanRangJGLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    //    self.zhuanRangJGLabel.backgroundColor = [UIColor yellowColor];
    
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
    
    self.zhuanRangPriceLabel.frame = CGRectMake(13 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height, 100 * kWIDTH, 25 * kHEIGHT);
    self.zhuanRangPriceLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.zhuanRangPriceLabel.textColor = [XXColor goldenColor];
    //    self.zhuanRangPriceLabel.backgroundColor = [UIColor cyanColor];
    
    self.yuQiRateLabel.frame = CGRectMake(135 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height, 120 * kWIDTH, 25 * kHEIGHT);
    self.yuQiRateLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.yuQiRateLabel.textColor = [XXColor goldenColor];
    self.yuQiRateLabel.textAlignment = NSTextAlignmentCenter;
//        self.yuQiRateLabel.backgroundColor = [UIColor yellowColor];
    
    self.restDayLabel.frame = CGRectMake(375 * kWIDTH - 10 * kWIDTH - 65 * kWIDTH, 35 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height, 60 * kWIDTH, 25 * kHEIGHT);
    self.restDayLabel.font = [UIFont systemFontOfSize:16 * kWIDTH];
    self.restDayLabel.textColor = [XXColor goldenColor];
    self.restDayLabel.textAlignment = NSTextAlignmentCenter;
//        self.restDayLabel.backgroundColor = [UIColor purpleColor];
    
    self.zhuanRangGPRQImageView.frame = CGRectMake(10 * kWIDTH, 47.5 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height + self.zhuanRangPriceLabel.frame.size.height, 12.2 * kWIDTH, 13 * kHEIGHT);
    self.zhuanRangGPRQImageView.image = [UIImage imageNamed:@"zhuanrangguapai"];
//    self.zhuanRangGPRQImageView.backgroundColor = [UIColor purpleColor];
    
    self.zhuanRangGPRQLabel.frame = CGRectMake(10 * kWIDTH + self.zhuanRangGPRQImageView.frame.size.width, 45 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height + self.zhuanRangPriceLabel.frame.size.height, 120 * kWIDTH, 20 * kHEIGHT);
    self.zhuanRangGPRQLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zhuanRangGPRQLabel.textAlignment = NSTextAlignmentCenter;
    self.zhuanRangGPRQLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//        self.zhuanRangGPRQLabel.backgroundColor = [UIColor blueColor];
    
    self.zhuanRangGPDateLabel.frame = CGRectMake(15 * kWIDTH + self.zhuanRangGPRQImageView.frame.size.width + self.zhuanRangGPRQLabel.frame.size.width, 45 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height + self.zhuanRangPriceLabel.frame.size.height, 200 * kWIDTH, 20 * kHEIGHT);
    self.zhuanRangGPDateLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
//        self.zhuanRangGPDateLabel.textAlignment = NSTextAlignmentCenter;
    self.zhuanRangGPDateLabel.textColor = [UIColor grayColor];
//        self.zhuanRangGPDateLabel.backgroundColor = [UIColor cyanColor];
    
    self.zhuanRangXJRQImageView.frame = CGRectMake(10 * kWIDTH, 54.5 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height + self.zhuanRangPriceLabel.frame.size.height + self.zhuanRangGPRQLabel.frame.size.height, 12.2 * kWIDTH, 13 * kHEIGHT);
    self.zhuanRangXJRQImageView.image = [UIImage imageNamed:@"zhuanrangxiajia"];
//    self.zhuanRangXJRQImageView.backgroundColor = [UIColor purpleColor];
    
    self.zhuanRangXJRQLabel.frame = CGRectMake(10 * kWIDTH + self.zhuanRangXJRQImageView.frame.size.width, 52 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height + self.zhuanRangPriceLabel.frame.size.height + self.zhuanRangGPRQLabel.frame.size.height, 120 * kWIDTH, 20 * kHEIGHT);
    self.zhuanRangXJRQLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zhuanRangXJRQLabel.textAlignment = NSTextAlignmentCenter;
    self.zhuanRangXJRQLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//        self.zhuanRangXJRQLabel.backgroundColor = [UIColor blueColor];
    
    self.zhuanRangXJDateLabel.frame = CGRectMake(15 * kWIDTH + self.zhuanRangXJRQImageView.frame.size.width + self.zhuanRangXJRQLabel.frame.size.width, 52 * kHEIGHT + self.productNameLabel.frame.size.height + self.zhuanRangJGLabel.frame.size.height + self.zhuanRangPriceLabel.frame.size.height + self.zhuanRangGPRQLabel.frame.size.height, 200 * kWIDTH, 20 * kHEIGHT);
    self.zhuanRangXJDateLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    //    self.zhuanRangXJDateLabel.textAlignment = NSTextAlignmentCenter;
    self.zhuanRangXJDateLabel.textColor = [UIColor grayColor];
//        self.zhuanRangXJDateLabel.backgroundColor = [UIColor cyanColor];

}


- (void)setModel:(ZRZmodel *)model
{
    _model = model;
    
    self.productNameLabel.text = [NSString stringWithFormat:@"%@", model.products_title];
    
    self.zhuanRangPriceLabel.text = [NSString stringWithFormat:@"%@元", model.transfer_capital];
    
    NSString *str = @"%";
    

    self.yuQiRateLabel.text = [NSString stringWithFormat:@"%@%@", model.transfer_interest_rate, str];
    
    self.restDayLabel.text = [NSString stringWithFormat:@"%@", model.finance_period];
    
    self.zhuanRangGPDateLabel.text = [NSString stringWithFormat:@"%@", model.transfer_time];
    
    self.zhuanRangXJDateLabel.text = [NSString stringWithFormat:@"%@", model.transfer_period];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
