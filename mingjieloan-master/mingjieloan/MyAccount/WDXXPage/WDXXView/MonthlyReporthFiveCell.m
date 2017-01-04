//
//  MonthlyReporthFiveCell.m
//  Yilicai
//
//  Created by 盐商 on 16/5/13.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "MonthlyReporthFiveCell.h"

#define cWIDTH (self.contentView.bounds.size.width-10)/5
#define cHEIGHT self.contentView.bounds.size.height

@implementation MonthlyReporthFiveCell

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
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.firstLabel.frame = CGRectMake(5 * FitWidth, 0, cWIDTH + 10 * FitWidth, cHEIGHT);
    self.firstLabel.textAlignment = NSTextAlignmentLeft;
    self.firstLabel.font = [UIFont systemFontOfSize:10 * FitWidth];

//    self.firstLabel.backgroundColor = [UIColor yellowColor];
    
    self.secondLabel.frame = CGRectMake(cWIDTH + 5 * kWIDTH, 0, cWIDTH + 5 * FitWidth, cHEIGHT);
    self.secondLabel.textAlignment = NSTextAlignmentRight;

    self.secondLabel.font = [UIFont systemFontOfSize:10 * FitWidth];
//    self.secondLabel.backgroundColor = [UIColor redColor];
    
    self.thirdLabel.frame = CGRectMake(cWIDTH * 2 + 5 * FitWidth, 0, cWIDTH + 5 * FitWidth, cHEIGHT);
    self.thirdLabel.textAlignment = NSTextAlignmentRight;

    self.thirdLabel.font = [UIFont systemFontOfSize:10 * FitWidth];

//    self.thirdLabel.backgroundColor = [UIColor yellowColor];
    
    self.fourthLabel.frame = CGRectMake(cWIDTH * 3 + 10 * FitWidth, 0, cWIDTH + 5 * FitWidth, cHEIGHT);
    self.fourthLabel.textAlignment = NSTextAlignmentRight;

    self.fourthLabel.font = [UIFont systemFontOfSize:10 * FitWidth];

//    self.fourthLabel.backgroundColor = [UIColor redColor];
    
    self.fifthLabel.frame = CGRectMake(cWIDTH * 4, 0, cWIDTH + 5 * FitWidth, cHEIGHT);
    self.fifthLabel.textAlignment = NSTextAlignmentRight;

    self.fifthLabel.font = [UIFont systemFontOfSize:10 * FitWidth];

//    self.fifthLabel.backgroundColor = [UIColor yellowColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
