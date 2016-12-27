//
//  ExchangeView.m
//  Yilicai
//
//  Created by 盐商 on 16/4/5.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "ExchangeView.h"

@implementation ExchangeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.exchangeBackView = [[UIView alloc] init];
        [self addSubview:self.exchangeBackView];
        
        self.alertView = [[UIView alloc] init];
        [self addSubview:self.alertView];
        
        self.exchangeTitleLabel = [[UILabel alloc] init];
        [self.alertView addSubview:self.exchangeTitleLabel];
        
        self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.alertView addSubview:self.closeButton];
        
        self.okButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.alertView addSubview:self.okButton];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.exchangeBackView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.exchangeBackView.backgroundColor = [UIColor blackColor];
    self.exchangeBackView.alpha = 0.3;
    
    self.alertView.frame = CGRectMake(60 * eWIDTH, 220 * eHEIGHT, 375 * eWIDTH - 120 * eWIDTH, 667 * eHEIGHT - 253 * eHEIGHT * 2);
    self.alertView.backgroundColor = [UIColor whiteColor];

    self.exchangeTitleLabel.frame = CGRectMake(50 * eWIDTH, 35 * eHEIGHT , self.alertView.frame.size.width - 100 * eWIDTH, 60 * eHEIGHT);
    self.exchangeTitleLabel.font = [UIFont systemFontOfSize:13];
    self.exchangeTitleLabel.numberOfLines = 0;
    self.exchangeTitleLabel.textColor = [UIColor colorWithRed:251 / 255.0 green:114 / 255.0 blue:43 / 255.0 alpha:1.0];
//    self.exchangeTitleLabel.backgroundColor = [UIColor yellowColor];
    
    self.closeButton.frame = CGRectMake(self.alertView.frame.size.width - 20, 3, 18, 18);
    [self.closeButton setImage:[UIImage imageNamed:@"ex_cancel"] forState:UIControlStateNormal];
//    self.closeButton.backgroundColor = [UIColor grayColor];
    self.closeButton.userInteractionEnabled = YES;
    
    self.okButton.frame = CGRectMake(35 * eWIDTH, 45 * eHEIGHT + self.exchangeTitleLabel.frame.size.height, self.alertView.frame.size.width - 70 * eWIDTH, 40 * eHEIGHT);
    self.okButton.backgroundColor = [XXColor btnGoldenColor];
    [self.okButton setTitle:@"确定兑换" forState:UIControlStateNormal];
    [self.okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.okButton.titleLabel.font = [UIFont systemFontOfSize:15];
    self.okButton.userInteractionEnabled = YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
