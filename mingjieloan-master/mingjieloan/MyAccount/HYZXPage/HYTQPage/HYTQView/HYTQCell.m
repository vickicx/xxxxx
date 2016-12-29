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
    
    self.titleLabel.frame = CGRectMake(10 * FitWidth, 0, kWIDTH, 30 * FitHeight);
    self.titleLabel.font = [UIFont systemFontOfSize:15.5 * FitWidth];
//    self.titleLabel.backgroundColor = [UIColor cyanColor];
    
    self.describeLabel.frame = CGRectMake(10 * FitWidth, self.titleLabel.frame.size.height, kWIDTH, 30 * FitHeight);
    self.describeLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
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
