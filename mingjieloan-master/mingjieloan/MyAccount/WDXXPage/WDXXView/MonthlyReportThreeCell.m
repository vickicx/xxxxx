//
//  MonthlyReportThreeCell.m
//  Yilicai
//
//  Created by 盐商 on 16/5/13.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "MonthlyReportThreeCell.h"

#define cWIDTH (self.contentView.bounds.size.width-20)/3
#define cHEIGHT self.contentView.bounds.size.height

@implementation MonthlyReportThreeCell

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
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.firstLabel.frame = CGRectMake(10 * kWIDTH, 0, cWIDTH, cHEIGHT);
    self.firstLabel.textAlignment = NSTextAlignmentLeft;
    self.firstLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
    
    //    self.firstLabel.backgroundColor = [UIColor yellowColor];
    
    self.secondLabel.frame = CGRectMake(cWIDTH + 10 * kWIDTH, 0, cWIDTH, cHEIGHT);
    self.secondLabel.textAlignment = NSTextAlignmentLeft;
    
    self.secondLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
    //    self.secondLabel.backgroundColor = [UIColor redColor];
    
    self.thirdLabel.frame = CGRectMake(cWIDTH * 2 + 10 * kWIDTH, 0, cWIDTH, cHEIGHT);
    self.thirdLabel.textAlignment = NSTextAlignmentLeft;
    
    self.thirdLabel.font = [UIFont systemFontOfSize:10 * kWIDTH];
    
    //    self.thirdLabel.backgroundColor = [UIColor yellowColor];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
