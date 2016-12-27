//
//  TZJLDetail2Cell.m
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "TZJLDetail2Cell.h"

@implementation TZJLDetail2Cell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        
        self.priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.priceLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(10 * kWIDTH, 0, 80 * kWIDTH, 30 * kHEIGHT);
    self.titleLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.titleLabel.textColor = [UIColor darkGrayColor];
//    self.titleLabel.backgroundColor = [UIColor cyanColor];
    
    self.priceLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 10 * kWIDTH - 200 * kWIDTH, 0, 200 * kWIDTH, 30 * kHEIGHT);
    self.priceLabel.font = [UIFont systemFontOfSize:12 * kWIDTH];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
