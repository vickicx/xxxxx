//
//  SQZR3TableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/3/2.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "SQZR3TableViewCell.h"
#import "XXColor.h"

@implementation SQZR3TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.zhuanRangBJLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangBJLabel];
        
        self.zhuanRangbenjinLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangbenjinLabel];
        
        self.zhuanRangBJTextField = [[UITextField alloc] init];
        [self.contentView addSubview:self.zhuanRangBJTextField];
        
        self.yuQiSDLXLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuQiSDLXLabel];
        
        self.yuQiSDRateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuQiSDRateLabel];
        
        self.zheRangLXJELabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zheRangLXJELabel];
        
        self.zheRangLXJETextField = [[UITextField alloc] init];
        [self.contentView addSubview:self.zheRangLXJETextField];
        
        self.zhuanRangSXFLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangSXFLabel];
        
        self.zhuanRangSXFeeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangSXFeeLabel];
        
        self.zhuanRangJGLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangJGLabel];
        
        self.zhuanRangPriceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.zhuanRangPriceLabel];
        
        self.shengYuQX2Label = [[UILabel alloc] init];
        [self.contentView addSubview:self.shengYuQX2Label];
        
        self.shengYuDay2Label = [[UILabel alloc] init];
        [self.contentView addSubview:self.shengYuDay2Label];
        
        self.guaPaiSYLLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.guaPaiSYLLabel];
        
        self.guaPaiRateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.guaPaiRateLabel];
        
        self.chouKuanQXLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.chouKuanQXLabel];
        
        self.chouKuanDeadLineLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.chouKuanDeadLineLabel];
        
        self.yuJiXJSJLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuJiXJSJLabel];
        
        self.yuJiXJTimeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.yuJiXJTimeLabel];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i < 8; i ++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15 * kWIDTH, 5 * kHEIGHT + 44 * kHEIGHT * (i + 1), 375 * kWIDTH - 30 * kWIDTH, 1.3 * kHEIGHT)];
        [self.contentView addSubview:lineView];
        lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }
    
    self.zhuanRangBJLabel.frame = CGRectMake(15 * kWIDTH, 10 * kHEIGHT, 100 * kWIDTH, kHEIGHT * 30);
    self.zhuanRangBJLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zhuanRangBJLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.zhuanRangBJLabel.backgroundColor = [UIColor cyanColor];
    
    
    self.zhuanRangbenjinLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 150 * kWIDTH, 10 * kWIDTH, 150 * kWIDTH, 30 * kHEIGHT);
    self.zhuanRangbenjinLabel.textColor = [XXColor goldenColor];
    self.zhuanRangbenjinLabel.font = [UIFont systemFontOfSize:13 * kWIDTH];
    self.zhuanRangbenjinLabel.textAlignment = NSTextAlignmentRight;
    
    /*
    self.zhuanRangBJTextField.frame = CGRectMake(160 * kWIDTH, 10 * kHEIGHT, 180 * kWIDTH, 30 * kHEIGHT);
    self.zhuanRangBJTextField.tag = 80000;
    self.zhuanRangBJTextField.returnKeyType = UIReturnKeyDone;
    self.zhuanRangBJTextField.placeholder = @"  请输入金额";
    self.zhuanRangBJTextField.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:241 / 255.0 alpha:1.0];
    
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置富文本对象的颜色
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:13 * kWIDTH];
    // 设置UITextField的占位文字
    self.zhuanRangBJTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  请输入金额" attributes:attributes];
     */
     
     
    
//    UILabel *yuan1Label = [[UILabel alloc] initWithFrame:CGRectMake(375 * kWIDTH - 15 * kWIDTH - 30 * kWIDTH, 10 * kWIDTH, 30 * kWIDTH, 30 * kHEIGHT)];
//    [self.contentView addSubview:yuan1Label];
//    yuan1Label.font = [UIFont systemFontOfSize: 14 * kWIDTH];
//    yuan1Label.textAlignment = NSTextAlignmentRight;
//    yuan1Label.text = @"元";
    
    self.yuQiSDLXLabel.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 46.5 * kHEIGHT, 100 * kWIDTH, kHEIGHT * 30);
    self.yuQiSDLXLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.yuQiSDLXLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.yuQiSDLXLabel.backgroundColor = [UIColor cyanColor];
    
    self.yuQiSDRateLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 80 * kWIDTH, 10 * kWIDTH + 46.5 * kHEIGHT, 80 * kWIDTH, 30 * kHEIGHT);
    self.yuQiSDRateLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.yuQiSDRateLabel.textColor = [XXColor goldenColor];
    self.yuQiSDRateLabel.textAlignment = NSTextAlignmentRight;
//    self.yuQiSDRateLabel.backgroundColor = [UIColor yellowColor];
    
    self.zheRangLXJELabel.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 45.5 * kHEIGHT * 2, 100 * kWIDTH, kHEIGHT * 30);
    self.zheRangLXJELabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zheRangLXJELabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.zheRangLXJELabel.backgroundColor = [UIColor purpleColor];
    
    
    /*
    self.zheRangLXJETextField.frame = CGRectMake(160 * kWIDTH, 10 * kWIDTH + 45.5 * kHEIGHT * 2, 180 * kWIDTH, 30 * kHEIGHT);
    self.zheRangLXJETextField.tag = 90000;
    self.zheRangLXJETextField.returnKeyType = UIReturnKeyDone;
    self.zheRangLXJETextField.placeholder = @"  请输入金额";
    self.zheRangLXJETextField.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:241 / 255.0 alpha:1.0];
    // 设置UITextField的占位文字
    self.zheRangLXJETextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"  请输入金额" attributes:attributes];
  */  
    
    
    UILabel *yuan2Label = [[UILabel alloc] initWithFrame:CGRectMake(375 * kWIDTH - 15 * kWIDTH - 30 * kWIDTH, 10 * kWIDTH + 45.5 * kHEIGHT * 2, 30 * kWIDTH, 30 * kHEIGHT)];
    [self.contentView addSubview:yuan2Label];
    yuan2Label.font = [UIFont systemFontOfSize: 14 * kWIDTH];
    yuan2Label.textAlignment = NSTextAlignmentRight;
    yuan2Label.text = @"元";
//    yuan2Label.textColor = [XXColor goldenColor];
    
    self.zhuanRangSXFLabel.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 45 * kHEIGHT * 3, 100 * kWIDTH, kHEIGHT * 30);
    self.zhuanRangSXFLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zhuanRangSXFLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.zhuanRangSXFLabel.backgroundColor = [UIColor cyanColor];
    
    self.zhuanRangSXFeeLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 80 * kWIDTH, 10 * kWIDTH + 45 * kHEIGHT * 3, 80 * kWIDTH, 30 * kHEIGHT);
    self.zhuanRangSXFeeLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zhuanRangSXFeeLabel.textColor = [XXColor goldenColor];
    self.zhuanRangSXFeeLabel.textAlignment = NSTextAlignmentRight;
//    self.zhuanRangSXFeeLabel.backgroundColor = [UIColor yellowColor];
    
    self.zhuanRangJGLabel.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 4, 100 * kWIDTH, kHEIGHT * 30);
    self.zhuanRangJGLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zhuanRangJGLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.zhuanRangJGLabel.backgroundColor = [UIColor cyanColor];
    
    self.zhuanRangPriceLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 150 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 4, 150 * kWIDTH, 30 * kHEIGHT);
    self.zhuanRangPriceLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.zhuanRangPriceLabel.textColor = [XXColor goldenColor];
    self.zhuanRangPriceLabel.textAlignment = NSTextAlignmentRight;
//    self.zhuanRangPriceLabel.backgroundColor = [UIColor yellowColor];
    
    self.shengYuQX2Label.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 5, 100 * kWIDTH, kHEIGHT * 30);
    self.shengYuQX2Label.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.shengYuQX2Label.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.shengYuQX2Label.backgroundColor = [UIColor cyanColor];
    
    self.shengYuDay2Label.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 80 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 5, 80 * kWIDTH, 30 * kHEIGHT);
    self.shengYuDay2Label.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.shengYuDay2Label.textColor = [XXColor goldenColor];
    self.shengYuDay2Label.textAlignment = NSTextAlignmentRight;
//    self.shengYuDay2Label.backgroundColor = [UIColor yellowColor];
    
    self.guaPaiSYLLabel.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 6, 100 * kWIDTH, kHEIGHT * 30);
    self.guaPaiSYLLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.guaPaiSYLLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.guaPaiSYLLabel.backgroundColor = [UIColor cyanColor];
    
    self.guaPaiRateLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 80 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 6, 80 * kWIDTH, 30 * kHEIGHT);
    self.guaPaiRateLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.guaPaiRateLabel.textColor = [XXColor goldenColor];
    self.guaPaiRateLabel.textAlignment = NSTextAlignmentRight;
//    self.guaPaiRateLabel.backgroundColor = [UIColor yellowColor];
    
    self.chouKuanQXLabel.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 7, 100 * kWIDTH, kHEIGHT * 30);
    self.chouKuanQXLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.chouKuanQXLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.chouKuanQXLabel.backgroundColor = [UIColor cyanColor];
    
    self.chouKuanDeadLineLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 80 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 7, 80 * kWIDTH, 30 * kHEIGHT);
    self.chouKuanDeadLineLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.chouKuanDeadLineLabel.textColor = [XXColor goldenColor];
    self.chouKuanDeadLineLabel.textAlignment = NSTextAlignmentRight;
//    self.chouKuanDeadLineLabel.backgroundColor = [UIColor yellowColor];
    
    self.yuJiXJSJLabel.frame = CGRectMake(15 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 8, 100 * kWIDTH, kHEIGHT * 30);
    self.yuJiXJSJLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.yuJiXJSJLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
//    self.yuJiXJSJLabel.backgroundColor = [UIColor cyanColor];
    
    self.yuJiXJTimeLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 200 * kWIDTH, 10 * kWIDTH + 44.5 * kHEIGHT * 8, 200 * kWIDTH, 30 * kHEIGHT);
    self.yuJiXJTimeLabel.font = [UIFont systemFontOfSize:14 * kWIDTH];
    self.yuJiXJTimeLabel.textColor = [XXColor goldenColor];
    self.yuJiXJTimeLabel.textAlignment = NSTextAlignmentRight;
//    self.yuJiXJTimeLabel.backgroundColor = [UIColor yellowColor];
    
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
