//
//  HYTQCell.m
//  Yilicai
//
//  Created by 盐商 on 16/5/24.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYTQCell.h"

@implementation HYTQCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        
        self.describeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.describeLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(10 * kWIDTH, 0, 375 * kWIDTH, 30 * kHEIGHT);
    self.titleLabel.font = [UIFont systemFontOfSize:15.5 * kWIDTH];
//    self.titleLabel.backgroundColor = [UIColor cyanColor];
    
    self.describeLabel.frame = CGRectMake(10 * kWIDTH, self.titleLabel.frame.size.height, 375 * kWIDTH, 30 * kHEIGHT);
    self.describeLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.describeLabel.textColor = [UIColor darkGrayColor];
//    self.describeLabel.backgroundColor = [UIColor yellowColor];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
