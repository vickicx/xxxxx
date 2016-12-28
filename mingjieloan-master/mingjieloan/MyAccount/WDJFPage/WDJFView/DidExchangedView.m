//
//  DidExchangedView.m
//  Yilicai
//
//  Created by 盐商 on 16/4/5.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "DidExchangedView.h"
#import "XXColor.h"

#define exWIDTH ([UIScreen mainScreen].bounds.size.width/375)
#define exHEIGHT ([UIScreen mainScreen].bounds.size.height/667)

@implementation DidExchangedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.exchangeBackView = [[UIView alloc] init];
        [self addSubview:self.exchangeBackView];
        
        self.alertView = [[UIView alloc] init];
        [self addSubview:self.alertView];
        
        self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.alertView addSubview:self.closeButton];
        
        self.picImageView = [[UIImageView alloc] init];
        [self.alertView addSubview:self.picImageView];
        
        self.titleLabel = [[UILabel alloc] init];
        [self.alertView addSubview:self.titleLabel];
        
        self.msgLabel = [[UILabel alloc] init];
        [self.alertView addSubview:self.msgLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.exchangeBackView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    //蓝色
    self.exchangeBackView.backgroundColor = [UIColor blackColor];
    self.exchangeBackView.alpha = 0.3;
    
    self.alertView.frame = CGRectMake(60 * exWIDTH, 220 * exHEIGHT, 375 * exWIDTH - 120 * exWIDTH, 667 * exHEIGHT - 253 * exHEIGHT * 2);
    self.alertView.backgroundColor = [UIColor whiteColor];
    self.alertView.layer.cornerRadius = 5 * exWIDTH;
    self.alertView.layer.masksToBounds = YES;
    
    self.closeButton.frame = CGRectMake(self.alertView.frame.size.width - 20, 3, 18, 18);
    [self.closeButton setImage:[UIImage imageNamed:@"ex_cancel"] forState:UIControlStateNormal];
//    self.closeButton.backgroundColor = [UIColor grayColor];
    self.closeButton.userInteractionEnabled = YES;
    
    self.picImageView.frame = CGRectMake(70 * exWIDTH, 50 * exHEIGHT, 28 * exWIDTH, 28 * exHEIGHT);
    
    self.titleLabel.frame = CGRectMake(80 * exWIDTH + self.picImageView.frame.size.width, 50 * exHEIGHT, 100 * exWIDTH, 30 * exHEIGHT);
    self.titleLabel.textColor = [UIColor colorWithRed:251 / 255.0 green:114 / 255.0 blue:43 / 255.0 alpha:1.0];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    
    self.msgLabel.frame = CGRectMake(0, 50 * exHEIGHT + self.titleLabel.frame.size.height, self.alertView.frame.size.width, 30 * exHEIGHT);
    self.msgLabel.textAlignment = NSTextAlignmentCenter;
    
    self.msgLabel.font = [UIFont systemFontOfSize:15];
    self.msgLabel.numberOfLines = 0;
    self.msgLabel.textColor = [UIColor colorWithRed:251 / 255.0 green:114 / 255.0 blue:43 / 255.0 alpha:1.0];
    self.msgLabel.adjustsFontSizeToFitWidth = YES;
    
//    self.msgLabel.backgroundColor = [UIColor yellowColor];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end