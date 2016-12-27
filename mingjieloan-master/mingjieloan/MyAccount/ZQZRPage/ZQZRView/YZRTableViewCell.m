//
//  YZRTableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/2/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "YZRTableViewCell.h"
#import "XXColor.h"

@implementation YZRTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.productNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.productNameLabel];
        
        self.productStateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.productStateLabel];
        
        self.lineView = [[UIView alloc] init];
        [self.contentView addSubview:self.lineView];
        
        self.dateTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.dateTitleLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.dateLabel];
        
        self.priceTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.priceTitleLabel];
        
        self.priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.priceLabel];
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
    
    self.productStateLabel.frame = CGRectMake(kWIDTH * 375 - 100 * kWIDTH - 10 * kWIDTH, 10 * kHEIGHT, 100 * kWIDTH, 30 * kHEIGHT);
    self.productStateLabel.textColor = [XXColor goldenColor];
    self.productStateLabel.font = [UIFont systemFontOfSize:17 * kWIDTH];
    self.productStateLabel.textAlignment = NSTextAlignmentRight;
    //    self.productStateLabel.backgroundColor = [UIColor blueColor];
    
    self.lineView.frame = CGRectMake(15 * kWIDTH, 20 * kHEIGHT + self.productNameLabel.frame.size.height, 375 * kWIDTH - 30 * kWIDTH, 2 * kHEIGHT);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.dateTitleLabel.frame = CGRectMake(10 * kWIDTH, 20 * kHEIGHT + self.productNameLabel.frame.size.height + 10 * kHEIGHT, 100 * kWIDTH, 25 * kHEIGHT);
    self.dateTitleLabel.font = [UIFont systemFontOfSize:15 * kWIDTH];
    self.dateTitleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    //    self.dateTitleLabel.backgroundColor = [UIColor purpleColor];
    
    self.priceTitleLabel.frame = CGRectMake(375 * kWIDTH - 100 * kWIDTH - 10 * kWIDTH, 20 * kHEIGHT + self.productNameLabel.frame.size.height + 10 * kHEIGHT, 100 * kWIDTH, 25 * kHEIGHT);
    self.priceTitleLabel.textAlignment = NSTextAlignmentRight;
    self.priceTitleLabel.font = [UIFont systemFontOfSize:15 * kWIDTH];
    self.priceTitleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    //    self.priceTitleLabel.backgroundColor = [UIColor purpleColor];
    
    self.dateLabel.frame = CGRectMake(13 * kWIDTH, 20 * kHEIGHT + self.productNameLabel.frame.size.height + self.dateTitleLabel.frame.size.height + 10 * kHEIGHT, 200 * kWIDTH, 25 * kHEIGHT);
    self.dateLabel.textColor = [XXColor goldenColor];
    self.dateLabel.font = [UIFont systemFontOfSize:15 * kWIDTH];
    //    self.dateLabel.backgroundColor = [UIColor cyanColor];
    
    self.priceLabel.frame = CGRectMake(375 * kWIDTH - 10 * kWIDTH - 150 * kWIDTH, 20 * kHEIGHT + self.productNameLabel.frame.size.height + self.dateTitleLabel.frame.size.height + 10 * kHEIGHT, 150 * kWIDTH, 25 * kHEIGHT);
    self.priceLabel.textColor = [XXColor goldenColor];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.priceLabel.font = [UIFont systemFontOfSize:15 * kWIDTH];
    //    self.priceLabel.backgroundColor = [UIColor cyanColor];
}

- (void)setModel:(YZRModel *)model
{
    _model = model;
    
    self.productNameLabel.text = [NSString stringWithFormat:@"%@", model.products_title];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@", model.transfer_success_time];
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@元", model.transfer_capital_yes];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
