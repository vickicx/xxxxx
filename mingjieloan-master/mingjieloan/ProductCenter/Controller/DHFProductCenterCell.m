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
    
    [self.contentView addSubview:_annualizedGainLab];
    
    self.extraRate = [[UILabel alloc] initWithFrame:CGRectMake(80, 45, 50, 20)];
    _extraRate.textColor = [XXColor goldenColor];
    _extraRate.font = [UIFont systemFontOfSize:20];
    
    [self.contentView addSubview:_extraRate];
    
    self.repaymentMethodNameLab = [[UILabel alloc] initWithFrame:CGRectMake(130, 45, 100, 20)];
    _repaymentMethodNameLab.textColor = [UIColor grayColor];
    _repaymentMethodNameLab.font = [UIFont systemFontOfSize:14];
    _repaymentMethodNameLab.text = @"100元起投";
    [self.contentView addSubview:_repaymentMethodNameLab];
    
    
    self.purchaseBtn = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 75, 30, 60, 30)];
    _purchaseBtn.textAlignment = AHTextAlignmentCenter;
    _purchaseBtn.text = @"投资";
    _purchaseBtn.textColor = [UIColor whiteColor];
    _purchaseBtn.font = [UIFont systemFontOfSize:16];
    _purchaseBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    _purchaseBtn.layer.masksToBounds = YES;
    _purchaseBtn.layer.cornerRadius = 2;
    [self.contentView addSubview:_purchaseBtn];
    
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(15, 85, 322 * FitWidth, 20)];
    _progressView.transform = CGAffineTransformMakeScale(1.0f,1.5f);
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    _progressView.progress = 0.5;
    
    _progressView.progressTintColor = [XXColor goldenColor];
    _progressView.trackTintColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_progressView];
    
    self.percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 75, 82.5, 60, 15)];
    _percentLabel.font = [UIFont systemFontOfSize:13];
    _percentLabel.textAlignment = NSTextAlignmentRight;
    _percentLabel.textColor = [UIColor grayColor];
    _percentLabel.text = @"50%";
    [self.contentView addSubview:_percentLabel];
    
    self.qitou = [[UILabel alloc] initWithFrame:CGRectMake(15, 105, 200, 15)];
    _qitou.textColor = [UIColor grayColor];
    //    _qitou.text = @"到期还本付息";
    _qitou.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_qitou];
    
    self.rest = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 215, 105, 200, 15)];
    _rest.font = [UIFont systemFontOfSize:13];
    _rest.textAlignment = NSTextAlignmentRight;
    _rest.textColor = [UIColor grayColor];
    _rest.text = @"剩余可投30,000元";
    [self.contentView addSubview:_rest];
    
    
}

- (void)setProductModel:(ProductModel *)productModel{
    if (_productModel != productModel) {
        _productModel = productModel;
    }
    
    self.nameLab.text = productModel.name;
    
    _purchaseBtn.frame = CGRectMake(kWIDTH - 75, 30, 60, 30);
    
    switch (_productModel.newstatus) {
        case 1:
            _purchaseBtn.text = @"还款中";
            self.purchaseBtn.backgroundColor = [XXColor grayAllColor];
            break;
        case 2:
            _purchaseBtn.text = @"满标";
            self.purchaseBtn.backgroundColor = [XXColor grayAllColor];
            break;
            
        case 3:
            _purchaseBtn.frame = CGRectMake(kWIDTH - 135, 30, 120, 30);
            _purchaseBtn.text = @"12/29 14:00";
            _purchaseBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
            break;
        case 4:
            _purchaseBtn.text = @"已结束";
            self.purchaseBtn.backgroundColor = [XXColor grayAllColor];
            break;
        case 5:
            _purchaseBtn.text = @"投资";
            _purchaseBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
            break;
        case 6:
            _purchaseBtn.text = @"已还款";
            self.purchaseBtn.backgroundColor = [XXColor grayAllColor];
            break;
            
        default:
            break;
    }
    
    //年化收益
    NSMutableAttributedString *annualizedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.1f%%", _productModel.annualizedGain]];
    NSRange redRangeTwo = NSMakeRange([[annualizedStr string] rangeOfString:@"%"].location, [[annualizedStr string] rangeOfString:@"%"].length);
    [annualizedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:redRangeTwo];
    _annualizedGainLab.attributedText = annualizedStr;
    
    int dayNum = [[_productModel.investmentPeriodDesc objectAtIndex:0] intValue];
    NSString *dayStr = (NSString *)[_productModel.investmentPeriodDesc objectAtIndex:1];
    //    NSLog(@"%d  %@", dayNum, dayStr);
    NSMutableAttributedString *extraRateStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%d%@", dayNum, dayStr]];
    NSRange extraRangeTwo = NSMakeRange([[extraRateStr string] rangeOfString:dayStr].location, [[extraRateStr string] rangeOfString:dayStr].length);
    [extraRateStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:extraRangeTwo];
    _extraRate.attributedText = extraRateStr;
    
    CGFloat progressNum = _productModel.investmentProgress / 100.00;
    _progressView.progress = progressNum;
    _percentLabel.text = [NSString stringWithFormat:@"%ld%%", _productModel.investmentProgress];
    self.rest.text = [NSString stringWithFormat:@"剩余可投%@", productModel.remainingInvestmentAmount];
    
    _percentLabel.text = [NSString stringWithFormat:@"%ld%%", (long)_productModel.investmentProgress];
    self.qitou.text = _productModel.repaymentMethodName;
    
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
