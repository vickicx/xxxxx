//
//  TZJLDetailContractCell.m
//  Yilicai
//
//  Created by 盐商 on 16/7/13.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "TZJLDetailContractCell.h"

@implementation TZJLDetailContractCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        
        self.statusLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.statusLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(10 * kWIDTH, 0, 200 * kWIDTH, 40 * kHEIGHT);
    self.titleLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.titleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    
    self.statusLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 35 * kWIDTH - 100 * kWIDTH, 0, 100 * kWIDTH, 40 * kHEIGHT);
    self.statusLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.statusLabel.textAlignment = NSTextAlignmentRight;
    self.statusLabel.textColor = [UIColor darkGrayColor];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
