//
//  HYZXCell.m
//  Yilicai
//
//  Created by 盐商 on 16/5/20.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYZXCell.h"

#define cWIDTH (self.contentView.bounds.size.width)/3
#define cHEIGHT self.contentView.bounds.size.height

@implementation HYZXCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.huiyuanImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.huiyuanImageView];
        
        self.huiyuandengjiLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.huiyuandengjiLabel];
        
        self.jifenjiangliLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.jifenjiangliLabel];
        
        self.shengrijuanLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.shengrijuanLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.huiyuanImageView.frame = CGRectMake(30 * kWIDTH, 10 * kHEIGHT, 20 * kWIDTH, 15 * kHEIGHT);
//    self.huiyuanImageView.backgroundColor = [UIColor  redColor];
    
    self.huiyuandengjiLabel.frame = CGRectMake(20 * kWIDTH, 0, cWIDTH, self.contentView.frame.size.height);
    self.huiyuandengjiLabel.textColor = [UIColor darkGrayColor];
    self.huiyuandengjiLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.huiyuandengjiLabel.textAlignment = NSTextAlignmentLeft;
//    self.huiyuandengjiLabel.backgroundColor = [UIColor blueColor];
    
    self.jifenjiangliLabel.frame = CGRectMake(cWIDTH, 0, cWIDTH, self.contentView.frame.size.height);
    self.jifenjiangliLabel.textColor = [UIColor darkGrayColor];
    self.jifenjiangliLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.jifenjiangliLabel.textAlignment = NSTextAlignmentCenter;
//    self.jifenjiangliLabel.backgroundColor = [UIColor cyanColor];
    
    self.shengrijuanLabel.frame = CGRectMake(cWIDTH * 2, 0, cWIDTH, self.contentView.frame.size.height);
    self.shengrijuanLabel.textColor = [UIColor darkGrayColor];
    self.shengrijuanLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.shengrijuanLabel.textAlignment = NSTextAlignmentCenter;
//    self.shengrijuanLabel.backgroundColor = [UIColor yellowColor];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
