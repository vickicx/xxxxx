//
//  DHFProductCenterCell.m
//  mingjieloan
//
//  Created by kang on 16/12/22.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFProductCenterCell.h"

@implementation DHFProductCenterCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
        [self createViews];
    }
    return self;
}

- (void)createViews{
    
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, kWIDTH - 10, 130)];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_backView];
    
    self.product_type_name = [[UILabel alloc] initWithFrame:CGRectMake(15, 14, 60, 16)];
    _product_type_name.layer.masksToBounds = YES;
    _product_type_name.layer.cornerRadius = 3;
    _product_type_name.backgroundColor = [XXColor goldenColor];
    _product_type_name.textColor = [UIColor whiteColor];
    _product_type_name.font = [UIFont systemFontOfSize:14];
    _product_type_name.textAlignment = NSTextAlignmentCenter;
    _product_type_name.text = @"活动专享";
    [self.contentView addSubview:_product_type_name];
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 14, 200, 16)];
    self.nameLab.font = [UIFont systemFontOfSize:16];
    self.nameLab.text = @"资金周转-车辆抵押-0";
    [self.contentView addSubview:_nameLab];
    
    self.annualizedGainLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 45, 60, 20)];
    _annualizedGainLab.textColor = [XXColor goldenColor];
    _annualizedGainLab.font = [UIFont systemFontOfSize:20];
    NSMutableAttributedString *annualizedStr = [[NSMutableAttributedString alloc]initWithString:@"4.8%"];
    NSRange redRangeTwo = NSMakeRange([[annualizedStr string] rangeOfString:@"%"].location, [[annualizedStr string] rangeOfString:@"%"].length);
    [annualizedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:redRangeTwo];
    _annualizedGainLab.attributedText = annualizedStr;
    [self.contentView addSubview:_annualizedGainLab];
    
    self.extraRate = [[UILabel alloc] initWithFrame:CGRectMake(80, 45, 50, 20)];
    _extraRate.textColor = [XXColor goldenColor];
    _extraRate.font = [UIFont systemFontOfSize:20];
    NSMutableAttributedString *extraRateStr = [[NSMutableAttributedString alloc]initWithString:@"8天"];
    NSRange extraRangeTwo = NSMakeRange([[extraRateStr string] rangeOfString:@"天"].location, [[extraRateStr string] rangeOfString:@"天"].length);
    [extraRateStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:extraRangeTwo];
    _extraRate.attributedText = extraRateStr;
    [self.contentView addSubview:_extraRate];
    
    self.repaymentMethodNameLab = [[UILabel alloc] initWithFrame:CGRectMake(130, 45, 100, 20)];
    _repaymentMethodNameLab.textColor = [UIColor grayColor];
    _repaymentMethodNameLab.font = [UIFont systemFontOfSize:14];
    _repaymentMethodNameLab.text = @"100元起投";
    [self.contentView addSubview:_repaymentMethodNameLab];
    
    
    self.purchaseBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWIDTH - 75, 30, 60, 30)];
    [_purchaseBtn addTarget:self action:@selector(purchaseBtnAction) forControlEvents:UIControlEventTouchUpInside];
    _purchaseBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_purchaseBtn setTitle:@"投资" forState:UIControlStateNormal];
    _purchaseBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    [_purchaseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _purchaseBtn.layer.masksToBounds = YES;
    _purchaseBtn.layer.cornerRadius = 2;
    [self.contentView addSubview:_purchaseBtn];
    
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(15, 85, 322 * FitWidth, 4)];
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    _progressView.progress = 0.5;
    
    _progressView.progressTintColor = [XXColor goldenColor];
    _progressView.trackTintColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_progressView];
    
    self.percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 45, 82.5, 30, 15)];
    _percentLabel.font = [UIFont systemFontOfSize:13];
    _percentLabel.textAlignment = NSTextAlignmentRight;
    _percentLabel.textColor = [UIColor grayColor];
    _percentLabel.text = @"50%";
    [self.contentView addSubview:_percentLabel];
    
    self.qitou = [[UILabel alloc] initWithFrame:CGRectMake(15, 105, 200, 15)];
    _qitou.textColor = [UIColor grayColor];
    _qitou.text = @"到期还本付息";
    _qitou.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_qitou];
    
    self.rest = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 215, 105, 200, 15)];
    _rest.font = [UIFont systemFontOfSize:13];
    _rest.textAlignment = NSTextAlignmentRight;
    _rest.textColor = [UIColor grayColor];
    _rest.text = @"剩余可投30,000元";
    [self.contentView addSubview:_rest];
    
}

- (void)purchaseBtnAction{
    
}


- (void)setProductModel:(ProductModel *)productModel{
    _productModel = productModel;
    self.nameLab.text = _productModel.name;
    
    
    
    
    
    self.rest.text = [NSString stringWithFormat:@"剩余可投%@", _productModel.remainingInvestmentAmount];
    
    
    
    
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
