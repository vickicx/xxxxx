//
//  HYZXHead2View.m
//  Yilicai
//
//  Created by 盐商 on 16/5/20.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYZXHead2View.h"



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
    
    self.tequanLabel.frame = CGRectMake(10 * FitWidth, 10 * FitHeight, 60 * FitWidth, 25 * FitHeight);
    self.tequanLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.tequanLabel.textColor = [UIColor darkGrayColor];
    //    self.tequanLabel.backgroundColor = [UIColor redColor];
    
    self.tequanNumLabel.frame = CGRectMake(self.tequanLabel.frame.size.width + 5 * FitWidth, 13 * FitHeight, 50 * FitWidth, 20 * FitHeight);
    self.tequanNumLabel.font = [UIFont systemFontOfSize:11 * FitWidth];
    self.tequanNumLabel.textColor = [UIColor grayColor];
    //    self.tequanNumLabel.backgroundColor = [UIColor yellowColor];
    
    self.huiyuanguizeButton.frame = CGRectMake(kWIDTH - 100 * FitWidth, 10 * FitHeight, 100 * FitWidth, 20 * FitHeight);
    [self.huiyuanguizeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.huiyuanguizeButton setTitle:@"会员规则>>" forState:UIControlStateNormal];
    self.huiyuanguizeButton.titleLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.huiyuanguizeButton.titleLabel.textColor = [UIColor darkGrayColor];
    //    self.huiyuanguizeButton.backgroundColor = [UIColor cyanColor];
    
    self.jifenjiangliButton.frame = CGRectMake(40 * FitWidth, 50 * FitHeight, 75 * FitWidth, 70 * FitHeight);
    [self.jifenjiangliButton setImage:[UIImage imageNamed:@"box"] forState:UIControlStateNormal];
    //    self.jifenjiangliButton.backgroundColor = [UIColor orangeColor];
    
    self.jifenjiangliLabel.frame = CGRectMake(40 * FitWidth, 50 * FitHeight + self.jifenjiangliButton.frame.size.height, 70 * FitWidth, 25 * FitHeight);
    self.jifenjiangliLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.jifenjiangliLabel.textAlignment = NSTextAlignmentCenter;
    self.jifenjiangliLabel.textColor = [UIColor darkGrayColor];
    self.jifenjiangliLabel.text = @"积分奖励";
    //    self.jifenjiangliLabel.backgroundColor = [UIColor redColor];
    
    //    self.shengrihongbaoButton.frame = CGRectMake(152 * KWIDTH, 50 * KHEIGHT, 70 * KWIDTH, 70 * KWIDTH);
    [self.shengrihongbaoButton setImage:[UIImage imageNamed:@"birthday"] forState:UIControlStateNormal];
    //    self.shengrihongbaoButton.backgroundColor = [UIColor greenColor];
    
    //    self.shengrihongbaoLabel.frame = CGRectMake(152 * KWIDTH, 50 * KHEIGHT + self.shengrihongbaoButton.frame.size.height, 70 * KWIDTH, 25 * KWIDTH);
    self.shengrihongbaoLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.shengrihongbaoLabel.textAlignment = NSTextAlignmentCenter;
    self.shengrihongbaoLabel.textColor = [UIColor darkGrayColor];
    self.shengrihongbaoLabel.text = @"生日红包";
    //    self.shengrihongbaoLabel.backgroundColor = [UIColor yellowColor];
    
    //    self.moreImageView.frame = CGRectMake(375 * KWIDTH - 110 * KWIDTH, 50 * KHEIGHT, 70 * KWIDTH, 70 * KHEIGHT);
    self.moreImageView.image = [UIImage imageNamed:@"jingqingqidai"];
    //    self.moreImageView.backgroundColor = [UIColor lightGrayColor];
    
    //    self.jingqingqidaiLabel.frame = CGRectMake(375 * KWIDTH - 110 * KWIDTH, 50 * KHEIGHT + self.moreImageView.frame.size.height, 70 * KWIDTH, 25 * KHEIGHT);
    self.jingqingqidaiLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
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
