//
//  SQZR2TableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/3/2.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "SQZR2TableViewCell.h"
#import "XXColor.h"

@implementation SQZR2TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.shengYuQXlabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.shengYuQXlabel];
        
        self.restDayLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.restDayLabel];
        
        self.lineView = [[UIView alloc] init];
        [self.contentView addSubview:self.lineView];
        
        self.yuJiNHSYLLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuJiNHSYLLabel];
        
        self.yuJiNHRateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuJiNHRateLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.shengYuQXlabel.frame = CGRectMake(15 * kWIDTH, 5 * kHEIGHT, 100 * kWIDTH, 30 * kHEIGHT);
    self.shengYuQXlabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.shengYuQXlabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.shengYuQXlabel.backgroundColor = [UIColor cyanColor];
    
    self.restDayLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 80 * kWIDTH, 5 * kHEIGHT, 80 * kWIDTH, 30 * kHEIGHT);
    self.restDayLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.restDayLabel.textColor = [XXColor goldenColor];
    self.restDayLabel.textAlignment = NSTextAlignmentRight;
//    self.restDayLabel.backgroundColor = [UIColor yellowColor];
    
    self.yuJiNHSYLLabel.frame = CGRectMake(15 * kWIDTH, 12 * kHEIGHT + self.shengYuQXlabel.frame.size.height, 200 * kWIDTH, 30 * kHEIGHT);
    self.yuJiNHSYLLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.yuJiNHSYLLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.yuJiNHSYLLabel.backgroundColor = [UIColor redColor];
    
    self.yuJiNHRateLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 150 * kWIDTH, 12 * kHEIGHT + self.shengYuQXlabel.frame.size.height, 150 * kWIDTH, 30 * kHEIGHT);
    self.yuJiNHRateLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.yuJiNHRateLabel.textColor = [XXColor goldenColor];
    self.yuJiNHRateLabel.textAlignment = NSTextAlignmentRight;
//    self.yuJiNHRateLabel.backgroundColor = [UIColor cyanColor];
    
    
    self.lineView.frame = CGRectMake(15 * kWIDTH, 7.5 * kHEIGHT + self.shengYuQXlabel.frame.size.height, 375 * kWIDTH - 30 * kWIDTH, 1.3 * kHEIGHT);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
