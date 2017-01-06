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
    self.productNameLabel.frame = CGRectMake(10 * FitWidth, 10 * FitHeight, kWIDTH, 30 * FitHeight);
    self.productNameLabel.font = [UIFont systemFontOfSize:17 * FitWidth];
    self.productNameLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    //    self.productNameLabel.backgroundColor = [UIColor redColor];
    
    self.productStateLabel.frame = CGRectMake(kWIDTH  - 100 * FitWidth - 10 * FitWidth, 10 * FitHeight, 100 * FitWidth, 30 * FitHeight);
    self.productStateLabel.textColor = [XXColor goldenColor];
    self.productStateLabel.font = [UIFont systemFontOfSize:17 * FitWidth];
    self.productStateLabel.textAlignment = NSTextAlignmentRight;
    //    self.productStateLabel.backgroundColor = [UIColor blueColor];
    
    self.lineView.frame = CGRectMake(15 * FitWidth, 20 * FitHeight + self.productNameLabel.frame.size.height,  kWIDTH - 30 * FitWidth, 2 * FitHeight);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.dateTitleLabel.frame = CGRectMake(10 * FitWidth, 20 * FitHeight + self.productNameLabel.frame.size.height + 10 * FitHeight, 100 * FitWidth, 25 * FitHeight);
    self.dateTitleLabel.font = [UIFont systemFontOfSize:15 * FitWidth];
    self.dateTitleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    //    self.dateTitleLabel.backgroundColor = [UIColor purpleColor];
    
    self.priceTitleLabel.frame = CGRectMake( kWIDTH - 100 * FitWidth - 10 * FitWidth, 20 * FitHeight + self.productNameLabel.frame.size.height + 10 * FitHeight, 100 * FitWidth, 25 * FitHeight);
    self.priceTitleLabel.textAlignment = NSTextAlignmentRight;
    self.priceTitleLabel.font = [UIFont systemFontOfSize:15 * FitWidth];
    self.priceTitleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    //    self.priceTitleLabel.backgroundColor = [UIColor purpleColor];
    
    self.dateLabel.frame = CGRectMake(13 * FitWidth, 20 * FitHeight + self.productNameLabel.frame.size.height + self.dateTitleLabel.frame.size.height + 10 * FitHeight, 200 * FitWidth, 25 * FitHeight);
    self.dateLabel.textColor = [XXColor goldenColor];
    self.dateLabel.font = [UIFont systemFontOfSize:15 * FitWidth];
    //    self.dateLabel.backgroundColor = [UIColor cyanColor];
    
    self.priceLabel.frame = CGRectMake( kWIDTH - 10 * FitWidth - 150 * FitWidth, 20 * FitHeight + self.productNameLabel.frame.size.height + self.dateTitleLabel.frame.size.height + 10 * FitHeight, 150 * FitWidth, 25 * FitHeight);
    self.priceLabel.textColor = [XXColor goldenColor];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.priceLabel.font = [UIFont systemFontOfSize:15 * FitWidth];
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
