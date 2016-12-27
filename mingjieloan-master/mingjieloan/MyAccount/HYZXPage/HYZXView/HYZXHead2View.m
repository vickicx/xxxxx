//
//  HYZXHead2View.m
//  Yilicai
//
//  Created by 盐商 on 16/5/20.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYZXHead2View.h"

#define KWIDTH ([UIScreen mainScreen].bounds.size.width/375)
#define KHEIGHT ([UIScreen mainScreen].bounds.size.height/667)

@implementation HYZXHead2View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.carBackImageView = [[UIImageView alloc] init];
        [self addSubview:self.carBackImageView];
        
        self.tequanLabel = [[UILabel alloc] init];
        [self addSubview:self.tequanLabel];
        
        self.tequanNumLabel = [[UILabel alloc] init];
        [self addSubview:self.tequanNumLabel];
        
        self.huiyuanguizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.huiyuanguizeButton];
        
        self.jifenjiangliButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.jifenjiangliButton];
        
        self.shengrihongbaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.shengrihongbaoButton];
        
        self.moreImageView = [[UIImageView alloc] init];
        [self addSubview:self.moreImageView];
        
        self.jifenjiangliLabel = [[UILabel alloc] init];
        [self addSubview:self.jifenjiangliLabel];
        
        self.shengrihongbaoLabel = [[UILabel alloc] init];
        [self addSubview:self.shengrihongbaoLabel];
        
        self.jingqingqidaiLabel = [[UILabel alloc] init];
        [self addSubview:self.jingqingqidaiLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //    self.carBackImageView.frame = CGRectMake((375 * KWIDTH - 150) / 2, 10 * KHEIGHT, 150 * KWIDTH, 100 * KHEIGHT);
    
    self.carBackImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    self.tequanLabel.frame = CGRectMake(10 * KWIDTH, 10 * KHEIGHT, 60 * KWIDTH, 25 * KHEIGHT);
    self.tequanLabel.font = [UIFont systemFontOfSize:13 * KWIDTH];
    self.tequanLabel.textColor = [UIColor darkGrayColor];
    //    self.tequanLabel.backgroundColor = [UIColor redColor];
    
    self.tequanNumLabel.frame = CGRectMake(self.tequanLabel.frame.size.width + 5 * KWIDTH, 13 * KHEIGHT, 50 * KWIDTH, 20 * KHEIGHT);
    self.tequanNumLabel.font = [UIFont systemFontOfSize:11 * KWIDTH];
    self.tequanNumLabel.textColor = [UIColor grayColor];
    //    self.tequanNumLabel.backgroundColor = [UIColor yellowColor];
    
    self.huiyuanguizeButton.frame = CGRectMake(375 * KWIDTH - 100 * KWIDTH, 10 * KHEIGHT, 100 * KWIDTH, 20 * KHEIGHT);
    [self.huiyuanguizeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.huiyuanguizeButton setTitle:@"会员规则>>" forState:UIControlStateNormal];
    self.huiyuanguizeButton.titleLabel.font = [UIFont systemFontOfSize:13 * KWIDTH];
    self.huiyuanguizeButton.titleLabel.textColor = [UIColor darkGrayColor];
    //    self.huiyuanguizeButton.backgroundColor = [UIColor cyanColor];
    
    self.jifenjiangliButton.frame = CGRectMake(40 * KWIDTH, 50 * KHEIGHT, 75 * KWIDTH, 70 * KHEIGHT);
    [self.jifenjiangliButton setImage:[UIImage imageNamed:@"box"] forState:UIControlStateNormal];
    //    self.jifenjiangliButton.backgroundColor = [UIColor orangeColor];
    
    self.jifenjiangliLabel.frame = CGRectMake(40 * KWIDTH, 50 * KHEIGHT + self.jifenjiangliButton.frame.size.height, 70 * KWIDTH, 25 * KHEIGHT);
    self.jifenjiangliLabel.font = [UIFont systemFontOfSize:13 * KWIDTH];
    self.jifenjiangliLabel.textAlignment = NSTextAlignmentCenter;
    self.jifenjiangliLabel.textColor = [UIColor darkGrayColor];
    self.jifenjiangliLabel.text = @"积分奖励";
    //    self.jifenjiangliLabel.backgroundColor = [UIColor redColor];
    
    //    self.shengrihongbaoButton.frame = CGRectMake(152 * KWIDTH, 50 * KHEIGHT, 70 * KWIDTH, 70 * KWIDTH);
    [self.shengrihongbaoButton setImage:[UIImage imageNamed:@"birthday"] forState:UIControlStateNormal];
    //    self.shengrihongbaoButton.backgroundColor = [UIColor greenColor];
    
    //    self.shengrihongbaoLabel.frame = CGRectMake(152 * KWIDTH, 50 * KHEIGHT + self.shengrihongbaoButton.frame.size.height, 70 * KWIDTH, 25 * KWIDTH);
    self.shengrihongbaoLabel.font = [UIFont systemFontOfSize:13 * KWIDTH];
    self.shengrihongbaoLabel.textAlignment = NSTextAlignmentCenter;
    self.shengrihongbaoLabel.textColor = [UIColor darkGrayColor];
    self.shengrihongbaoLabel.text = @"生日红包";
    //    self.shengrihongbaoLabel.backgroundColor = [UIColor yellowColor];
    
    //    self.moreImageView.frame = CGRectMake(375 * KWIDTH - 110 * KWIDTH, 50 * KHEIGHT, 70 * KWIDTH, 70 * KHEIGHT);
    self.moreImageView.image = [UIImage imageNamed:@"jingqingqidai"];
    //    self.moreImageView.backgroundColor = [UIColor lightGrayColor];
    
    //    self.jingqingqidaiLabel.frame = CGRectMake(375 * KWIDTH - 110 * KWIDTH, 50 * KHEIGHT + self.moreImageView.frame.size.height, 70 * KWIDTH, 25 * KHEIGHT);
    self.jingqingqidaiLabel.font = [UIFont systemFontOfSize:13 * KWIDTH];
    self.jingqingqidaiLabel.textAlignment = NSTextAlignmentCenter;
    self.jingqingqidaiLabel.textColor = [UIColor darkGrayColor];
    self.jingqingqidaiLabel.text = @"敬请期待";
    //    self.jingqingqidaiLabel.backgroundColor = [UIColor cyanColor];
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
