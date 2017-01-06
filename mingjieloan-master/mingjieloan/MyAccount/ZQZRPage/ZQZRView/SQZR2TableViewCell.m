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
    
    self.shengYuQXlabel.frame = CGRectMake(15 * FitWidth, 5 * FitHeight, 100 * FitWidth, 30 * FitHeight);
    self.shengYuQXlabel.font = [UIFont systemFontOfSize:14 * FitWidth];
    self.shengYuQXlabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.shengYuQXlabel.backgroundColor = [UIColor cyanColor];
    
    self.restDayLabel.frame = CGRectMake( kWIDTH - 15 * FitWidth - 80 * FitWidth, 5 * FitHeight, 80 * FitWidth, 30 * FitHeight);
    self.restDayLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
    self.restDayLabel.textColor = [XXColor goldenColor];
    self.restDayLabel.textAlignment = NSTextAlignmentRight;
//    self.restDayLabel.backgroundColor = [UIColor yellowColor];
    
    self.yuJiNHSYLLabel.frame = CGRectMake(15 * FitWidth, 12 * FitHeight + self.shengYuQXlabel.frame.size.height, 200 * FitWidth, 30 * FitHeight);
    self.yuJiNHSYLLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
    self.yuJiNHSYLLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.yuJiNHSYLLabel.backgroundColor = [UIColor redColor];
    
    self.yuJiNHRateLabel.frame = CGRectMake( kWIDTH - 15 * FitWidth - 150 * FitWidth, 12 * FitHeight + self.shengYuQXlabel.frame.size.height, 150 * FitWidth, 30 * FitHeight);
    self.yuJiNHRateLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
    self.yuJiNHRateLabel.textColor = [XXColor goldenColor];
    self.yuJiNHRateLabel.textAlignment = NSTextAlignmentRight;
//    self.yuJiNHRateLabel.backgroundColor = [UIColor cyanColor];
    
    
    self.lineView.frame = CGRectMake(15 * FitWidth, 7.5 * FitHeight + self.shengYuQXlabel.frame.size.height, kWIDTH - 30 * FitWidth, 1.3 * FitHeight);
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
