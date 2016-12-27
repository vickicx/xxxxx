//
//  MonthlyReportSixCell.m
//  Yilicai
//
//  Created by 盐商 on 16/5/13.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "MonthlyReportSixCell.h"

#define cWIDTH (self.contentView.bounds.size.width-20)/6
#define cHEIGHT self.contentView.bounds.size.height

@implementation MonthlyReportSixCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.firstLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.firstLabel];
        
        self.secondLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.secondLabel];
        
        self.thirdLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.thirdLabel];
        
        self.fourthLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.fourthLabel];
        
        self.fifthLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.fifthLabel];
        
        self.sixthLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.sixthLabel];
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.firstLabel.frame = CGRectMake(5 * kWIDTH, 0, cWIDTH - 25 * kWIDTH, cHEIGHT);
    self.firstLabel.textAlignment = NSTextAlignmentLeft;
    self.firstLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
    
//    self.firstLabel.backgroundColor = [UIColor yellowColor];
    
    self.secondLabel.frame = CGRectMake(cWIDTH - 30 * kWIDTH, 0, cWIDTH + 10 * kWIDTH, cHEIGHT);
    self.secondLabel.textAlignment = NSTextAlignmentRight;
    
    self.secondLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
//    self.secondLabel.backgroundColor = [UIColor redColor];
    
    self.thirdLabel.frame = CGRectMake(cWIDTH * 2 - 19 * kWIDTH, 0, cWIDTH + 10 * kWIDTH, cHEIGHT);
    self.thirdLabel.textAlignment = NSTextAlignmentRight;
    
    self.thirdLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
    
//    self.thirdLabel.backgroundColor = [UIColor yellowColor];
    
    self.fourthLabel.frame = CGRectMake(cWIDTH * 3 - 8 * kWIDTH, 0, cWIDTH + 10 * kWIDTH, cHEIGHT);
    self.fourthLabel.textAlignment = NSTextAlignmentRight;
    
    self.fourthLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
    
//    self.fourthLabel.backgroundColor = [UIColor redColor];
    
    self.fifthLabel.frame = CGRectMake(cWIDTH * 4 + 3 * kWIDTH, 0, cWIDTH + kWIDTH * 10, cHEIGHT);
    self.fifthLabel.textAlignment = NSTextAlignmentRight;
    
    self.fifthLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
    
//    self.fifthLabel.backgroundColor = [UIColor yellowColor];
    
    self.sixthLabel.frame = CGRectMake(cWIDTH * 5 + 13 * kWIDTH, 0, cWIDTH + 5 * kWIDTH, cHEIGHT);
    self.sixthLabel.textAlignment = NSTextAlignmentRight;
    
    self.sixthLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
//    self.sixthLabel.backgroundColor = [UIColor redColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
