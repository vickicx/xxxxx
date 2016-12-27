//
//  ExchangeView.h
//  Yilicai
//
//  Created by 盐商 on 16/4/5.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import <UIKit/UIKit.h>

#define eWIDTH ([UIScreen mainScreen].bounds.size.width/375)
#define eHEIGHT ([UIScreen mainScreen].bounds.size.height/667)

@interface ExchangeView : UIView

@property (nonatomic, strong) UIView *exchangeBackView;

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, strong) UILabel *exchangeTitleLabel;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) UIButton *okButton;

@end
