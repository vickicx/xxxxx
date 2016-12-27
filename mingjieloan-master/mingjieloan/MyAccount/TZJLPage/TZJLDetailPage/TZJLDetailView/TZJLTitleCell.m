//
//  TZJLTitleCell.m
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "TZJLTitleCell.h"

@implementation TZJLTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        
        self.rightLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.rightLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:250 / 255.0 blue:251 / 255.0 alpha:1.0];
    
    self.titleLabel.frame = CGRectMake(10 * kWIDTH, 0, 250 * kWIDTH, 40 * kHEIGHT);
    self.titleLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.titleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.titleLabel.backgroundColor = [UIColor redColor];
    
    self.rightLabel.frame = CGRectMake(self.contentView.frame.size.width - 10 * kWIDTH - 100 * kHEIGHT, 0, 100 * kWIDTH, 40 * kHEIGHT);
//    self.rightLabel.backgroundColor = [UIColor orangeColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
