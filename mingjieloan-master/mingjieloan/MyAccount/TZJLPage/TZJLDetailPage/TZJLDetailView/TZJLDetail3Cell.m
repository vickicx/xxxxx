//
//  TZJLDetail3Cell.m
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "TZJLDetail3Cell.h"

#define cWIDTH (self.contentView.bounds.size.width-10)/5
#define cHEIGHT self.contentView.bounds.size.height

@implementation TZJLDetail3Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.receiveDateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.receiveDateLabel];
        
        self.principalLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.principalLabel];
        
        self.rateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.rateLabel];
    
        self.totalLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.totalLabel];
        
        self.statusLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.statusLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.receiveDateLabel.frame = CGRectMake(10 * kWIDTH, 0, cWIDTH, 30 * kHEIGHT);
    self.receiveDateLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.receiveDateLabel.textColor = [UIColor darkGrayColor];
//    self.receiveDateLabel.backgroundColor = [UIColor redColor];
    
    self.principalLabel.frame = CGRectMake(10 * kWIDTH + cWIDTH, 0, cWIDTH, 30 * kHEIGHT);
    self.principalLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.principalLabel.textAlignment = NSTextAlignmentCenter;
    self.principalLabel.textColor = [UIColor darkGrayColor];
//    self.principalLabel.backgroundColor = [UIColor yellowColor];
    
    self.rateLabel.frame = CGRectMake(10 * kWIDTH + cWIDTH * 2, 0, cWIDTH, 30 * kHEIGHT);
    self.rateLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.rateLabel.textAlignment = NSTextAlignmentCenter;
    self.rateLabel.textColor = [UIColor darkGrayColor];
//    self.rateLabel.backgroundColor = [UIColor cyanColor];
    
    self.totalLabel.frame = CGRectMake(10 * kWIDTH + cWIDTH * 3, 0, cWIDTH, 30 * kHEIGHT);
    self.totalLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.totalLabel.textAlignment = NSTextAlignmentCenter;
    self.totalLabel.textColor = [UIColor darkGrayColor];
//    self.totalLabel.backgroundColor = [UIColor orangeColor];
    
    self.statusLabel.frame = CGRectMake(10 * kWIDTH + cWIDTH * 4, 0, cWIDTH - 10 * kWIDTH, 30 * kHEIGHT);
    self.statusLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.statusLabel.textAlignment = NSTextAlignmentRight;
    self.statusLabel.textColor = [UIColor darkGrayColor];
//    self.statusLabel.backgroundColor = [UIColor blueColor];
}


- (void)setModel:(ReturnItems *)model
{
    _model = model;
    
    self.receiveDateLabel.text = model.recover_date;
    
    self.principalLabel.text = model.recover_amount_capital;
    
    self.rateLabel.text = model.recover_amount_interest;
    
    self.totalLabel.text = model.recover_amount_total;
    
    self.statusLabel.text = model.recover_flg;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
