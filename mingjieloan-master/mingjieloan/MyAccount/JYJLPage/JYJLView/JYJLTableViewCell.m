//
//  JYJLTableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/3/21.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "JYJLTableViewCell.h"

@implementation JYJLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleNameLabel];
        
        self.operationAmountLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.operationAmountLabel];
        
        self.descriptionLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.descriptionLabel];
        
        self.createTimeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.createTimeLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleNameLabel.frame = CGRectMake(10 * kWIDTH, 5 * kHEIGHT, 200 * kWIDTH, 25 * kHEIGHT);
    self.titleNameLabel.font = [UIFont systemFontOfSize:15 * kWIDTH];
//    self.titleNameLabel.backgroundColor = [UIColor redColor];
    
    self.operationAmountLabel.frame = CGRectMake(kWIDTH * 375 - 10 * kWIDTH - 150 * kWIDTH, 5 * kHEIGHT, 150 * kWIDTH, 25 * kHEIGHT);
    self.operationAmountLabel.textAlignment = NSTextAlignmentRight;
//    self.operationAmountLabel.textColor = [UIColor colorWithRed:251 / 255.0 green:114 / 255.0 blue:43 / 255.0 alpha:1.0];
    self.operationAmountLabel.font = [UIFont systemFontOfSize:15 * kWIDTH];
//    self.operationAmountLabel.backgroundColor = [UIColor cyanColor];
    
    self.descriptionLabel.frame = CGRectMake(10 * kWIDTH, 5 + kHEIGHT + self.operationAmountLabel.frame.size.height, kWIDTH * 200, 25 * kHEIGHT);
    self.descriptionLabel.textColor = [UIColor grayColor];
    self.descriptionLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
//    self.descriptionLabel.backgroundColor = [UIColor purpleColor];
    
    self.createTimeLabel.frame = CGRectMake(kWIDTH * 375 - 10 * kWIDTH - 200 * kWIDTH, 5 + kHEIGHT + self.operationAmountLabel.frame.size.height, kWIDTH * 200, 25 * kHEIGHT);
    self.createTimeLabel.textAlignment = NSTextAlignmentRight;
    self.createTimeLabel.textColor = [UIColor grayColor];
    self.createTimeLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
//    self.createTimeLabel.backgroundColor = [UIColor yellowColor];
    
    
}


- (void)setModel:(JYJLModel *)model
{
    self.titleNameLabel.text = [NSString stringWithFormat:@"%@", model.transactionType];
    
    
    self.operationAmountLabel.text = [NSString stringWithFormat:@"%@", model.operationAmount];
    
    self.descriptionLabel.text = [NSString stringWithFormat:@"交易号 %@", model.transactionId];
    
    
    self.createTimeLabel.text = [NSString stringWithFormat:@"%@", model.createTime];
    
    
}


@end
