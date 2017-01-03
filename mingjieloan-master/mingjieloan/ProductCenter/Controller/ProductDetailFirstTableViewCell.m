//
//  ProductDetailFirstTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/24.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductDetailFirstTableViewCell.h"

@implementation ProductDetailFirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
        [self createViews];
    }
    return self;
}

- (void)createViews{
    
        UIColor *textColor = GetColor(@"#555555");
    self.titlePic = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 15, 15)];
    _titlePic.image = [UIImage imageNamed:@"product_title"];
    [self.contentView addSubview:_titlePic];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 190, 15)];
    _titleLab.font = [UIFont systemFontOfSize:14];
    _titleLab.text = @"资金周转-车辆抵押-0007";
    [self.contentView addSubview:_titleLab];
    
    _zhuangtaiLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 65, 10, 50, 15)];
    _zhuangtaiLab.font = [UIFont systemFontOfSize:12];
    _zhuangtaiLab.textAlignment = NSTextAlignmentRight;
    _zhuangtaiLab.text = @"还款中";
    [self.contentView addSubview:_zhuangtaiLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 34, kWIDTH - 20, 1)];
    _lineView.backgroundColor = GetColor(@"#d8d8d8");
    [self.contentView addSubview:_lineView];
    
    
    self.touziLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 40, 60, 15)];
    _touziLabel.font = [UIFont systemFontOfSize:12];
    _touziLabel.textAlignment = NSTextAlignmentCenter;
    _touziLabel.text = @"投资总额";
    _touziLabel.textColor = textColor;
    [self.contentView addSubview:_touziLabel];
    
    self.touzishuziLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 60, 60, 15)];
    _touzishuziLab.font = [UIFont systemFontOfSize:14];
    _touzishuziLab.textAlignment = NSTextAlignmentCenter;
    _touzishuziLab.textColor = [XXColor goldenColor];
    NSMutableAttributedString *touziStr = [[NSMutableAttributedString alloc]initWithString:@"8万"];
    NSRange touziRangeTwo = NSMakeRange([[touziStr string] rangeOfString:@"万"].location, [[touziStr string] rangeOfString:@"万"].length);
    [touziStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:touziRangeTwo];
    _touzishuziLab.attributedText = touziStr;
    [self.contentView addSubview:_touzishuziLab];
    
    
    self.xiangmuLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 60, 15)];
    _xiangmuLabel.font = [UIFont systemFontOfSize:12];
    _xiangmuLabel.textAlignment = NSTextAlignmentCenter;
    _xiangmuLabel.text = @"项目期限";
    _xiangmuLabel.textColor = textColor;
    [self.contentView addSubview:_xiangmuLabel];
    
    
    self.xiangmutianshuLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, 60, 15)];
    _xiangmutianshuLab.font = [UIFont systemFontOfSize:14];
    _xiangmutianshuLab.textAlignment = NSTextAlignmentCenter;
    _xiangmutianshuLab.textColor = [XXColor goldenColor];
    NSMutableAttributedString *xiangmuStr = [[NSMutableAttributedString alloc]initWithString:@"8天"];
    NSRange xiangmuTwo = NSMakeRange([[xiangmuStr string] rangeOfString:@"天"].location, [[xiangmuStr string] rangeOfString:@"天"].length);
    [xiangmuStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:xiangmuTwo];
    _xiangmutianshuLab.attributedText = xiangmuStr;
    [self.contentView addSubview:_xiangmutianshuLab];
    
    self.shouyiLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 40, 80, 15)];
    _shouyiLabel.font = [UIFont systemFontOfSize:12];
    _shouyiLabel.textAlignment = NSTextAlignmentCenter;
    _shouyiLabel.text = @"预期年化收益";
    _shouyiLabel.textColor = textColor;
    [self.contentView addSubview:_shouyiLabel];
    
    self.shouyibaifenLab = [[UILabel alloc] initWithFrame:CGRectMake(170, 60, 80, 15)];
    _shouyibaifenLab.font = [UIFont systemFontOfSize:14];
    _shouyibaifenLab.textAlignment = NSTextAlignmentCenter;
    _shouyibaifenLab.textColor = [XXColor goldenColor];
    NSMutableAttributedString *shouyiStr = [[NSMutableAttributedString alloc]initWithString:@"4.8%"];
    NSRange shouyiTwo = NSMakeRange([[shouyiStr string] rangeOfString:@"%"].location, [[shouyiStr string] rangeOfString:@"%"].length);
    [shouyiStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:shouyiTwo];
    _shouyibaifenLab.attributedText = shouyiStr;
    [self.contentView addSubview:_shouyibaifenLab];
    
    
    
    self.baozhangPic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 80.5, 11.5, 14.5)];
    _baozhangPic.image = [UIImage imageNamed:@"product_detail_baozhang"];
    [self.contentView addSubview:_baozhangPic];
    
    self.baozhangLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 81.5, 100, 13.5)];
    _baozhangLab.font = [UIFont systemFontOfSize:12];
    _baozhangLab.text = @"第三方机构担保";
    _baozhangLab.textColor = textColor;
    [self.contentView addSubview:_baozhangLab];
    
    
    self.huankuanPic = [[UIImageView alloc] initWithFrame:CGRectMake(135, 82.5, 11, 10)];
    _huankuanPic.image = [UIImage imageNamed:@"product_time"];
    [self.contentView addSubview:_huankuanPic];
    
    self.huankuanLab = [[UILabel alloc] initWithFrame:CGRectMake(150, 81.5, 100, 13.5)];
    _huankuanLab.font = [UIFont systemFontOfSize:12];
    _huankuanLab.textColor = textColor;
    [self.contentView addSubview:_huankuanLab];
    self.timePic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 106.5, 12, 11.5)];
    _timePic.image = [UIImage imageNamed:@"product_detail_time"];
    [self.contentView addSubview:_timePic];
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 106, 200*FitWidth, 13)];
    _timeLab.font = [UIFont systemFontOfSize:12];
    _timeLab.text = @"剩余投资时间 0天11时35分";
    _timeLab.textColor = textColor;
    [self.contentView addSubview:_timeLab];
    
    self.jixiPic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 125, 13, 13)];
    _jixiPic.image = [UIImage imageNamed:@"mumanjixi"];
    [self.contentView addSubview:_jixiPic];
    
    self.jixiLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 125, 200 * FitWidth, 13)];
    _jixiLab.font = [UIFont systemFontOfSize:12];
    _jixiLab.text = @"募满后T+1日计息";
    _jixiLab.textColor = textColor;
    [self.contentView addSubview:_jixiLab];
    
    
    
    self.zhuanrangPic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 143, 13.5, 13.5)];
    _zhuanrangPic.image = [UIImage imageNamed:@"small_zhuan"];
    [self.contentView addSubview:_zhuanrangPic];
    
    self.zhuanrangLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 143, 300 * FitWidth, 13)];
    _zhuanrangLab.font = [UIFont systemFontOfSize:12];
    _zhuanrangLab.text = @"持有该项目90天以上可以转让";
    _zhuanrangLab.textColor = textColor;
    [self.contentView addSubview:_zhuanrangLab];
    
    
    self.ketouLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 110, 110, 100, 14)];
    _ketouLabel.textColor = [XXColor goldenColor];
    _ketouLabel.font = [UIFont systemFontOfSize:13];

    [self.contentView addSubview:_ketouLabel];
    NSMutableAttributedString *ketoustr = [[NSMutableAttributedString alloc] initWithString:@"可投  1000000元"];
    [ketoustr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0,2)];
    
    self.ketouLabel.attributedText = ketoustr;
    
    
    self.qitouLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 110, 130, 100, 14)];
    
    _qitouLabel.textColor = [XXColor goldenColor];
    _qitouLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_qitouLabel];
    NSMutableAttributedString *qitoustr = [[NSMutableAttributedString alloc] initWithString:@"起投  100元"];
    [qitoustr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0,2)];
    
    self.qitouLabel.attributedText = qitoustr;

    
    self.manBiaoPic = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 76.5, 40, 66.5, 67.5)];
    _manBiaoPic.image = [UIImage imageNamed:@"full"];
    [self.contentView addSubview:_manBiaoPic];
    
    self.progressView = [[PICircularProgressView alloc] initWithFrame:CGRectMake(kWIDTH - 76.5, 40, 66.5, 67.5)];
    _progressView.progress = 0.89;
    _progressView.showText = 0;
    _progressView.roundedHead = 0;
    _progressView.showShadow = 1;
    _progressView.progressFillColor = [XXColor goldenColor];
    [self.contentView addSubview:_progressView];
    
    self.baifenbiLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 76.5, 65, 66.5, 20)];
    _baifenbiLabel.font = [UIFont systemFontOfSize:16];
    _baifenbiLabel.textAlignment = NSTextAlignmentCenter;
    _baifenbiLabel.text = @"89%";
    [self.contentView addSubview:_baifenbiLabel];
    
    self.botView = [[UIView alloc] initWithFrame:CGRectMake(0, 160, kWIDTH, 10)];
    _botView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_botView];
}

- (void)setDetailPModel:(ProductDetailModel *)detailPModel{
    _detailPModel = detailPModel;
    
    _titleLab.text = _detailPModel.name;
   
    switch (_detailPModel.status) {
        case 1:
            _zhuangtaiLab.text = @"还款中";
            break;
        case 2:
            _zhuangtaiLab.text = @"满标";
            break;
            
        case 3:
            _zhuangtaiLab.text = @"预约";
            break;
        case 4:
            _zhuangtaiLab.text = @"已结束";
            break;
        case 5:
            _zhuangtaiLab.text = @"正在售卖";
            break;
        case 6:
            _zhuangtaiLab.text = @"已还款";
            break;
         
        case 7:
            _zhuangtaiLab.text = @"审核中";
            break;
        case 8:
            _zhuangtaiLab.text = @"转让成功";
            break;
        default:
            break;
    }
    
    //年化收益
    NSMutableAttributedString *annualizedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%%", _detailPModel.annualizedGain]];
    NSRange redRangeTwo = NSMakeRange([[annualizedStr string] rangeOfString:@"%"].location, [[annualizedStr string] rangeOfString:@"%"].length);
    [annualizedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:redRangeTwo];
    _shouyibaifenLab.attributedText = annualizedStr;
    
    
    //项目期限
    if(_detailPModel.investmentPeriodDesc.count > 0){
    int dayNum = [[_detailPModel.investmentPeriodDesc objectAtIndex:0] intValue];
    NSString *dayStr = (NSString *)[_detailPModel.investmentPeriodDesc objectAtIndex:1];
    NSMutableAttributedString *extraRateStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%d%@", dayNum, dayStr]];
    NSRange extraRangeTwo = NSMakeRange([[extraRateStr string] rangeOfString:dayStr].location, [[extraRateStr string] rangeOfString:dayStr].length);
    [extraRateStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:extraRangeTwo];
    _xiangmutianshuLab.attributedText = extraRateStr;
    
    }
    //投资总额
    float money = _detailPModel.totalInvestment / 100 / 10000.0;
    //显示 万
    if (money > 0) {
        NSMutableAttributedString *touziStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.0f万", money]];
        NSRange touziRangeTwo = NSMakeRange([[touziStr string] rangeOfString:@"万"].location, [[touziStr string] rangeOfString:@"万"].length);
        [touziStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:touziRangeTwo];
        _touzishuziLab.attributedText = touziStr;
        [self.contentView addSubview:_touzishuziLab];
    }
    //显示元
    else
    {
        NSMutableAttributedString *touziStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.0f元", money * 10000]];
        NSRange touziRangeTwo = NSMakeRange([[touziStr string] rangeOfString:@"元"].location, [[touziStr string] rangeOfString:@"元"].length);
        [touziStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:touziRangeTwo];
        _touzishuziLab.attributedText = touziStr;
        [self.contentView addSubview:_touzishuziLab];
    }
    
    //时间
    if (_detailPModel.status == 1) {
        
        _timeLab.text = [NSString stringWithFormat:@"计息开始时间%@", _detailPModel.expirationDate];
        
    }else if (_detailPModel.status == 4){
        
        _timeLab.text = [NSString stringWithFormat:@"计息开始时间%@", _detailPModel.expirationDate];
        
    }else if (_detailPModel.status == 6){
        
        _timeLab.text = [NSString stringWithFormat:@"计息开始时间%@", _detailPModel.expirationDate];
        
    }
    else {
        
        _timeLab.text = [NSString stringWithFormat:@"剩余投资时间%@", _detailPModel.expirationDate];
        
    }
    
    _baozhangLab.text = _detailPModel.guaranteeModeName;
    _huankuanLab.text = _detailPModel.repaymentMethodName;
    if (_detailPModel.transfer_froze_time.length > 0) {
        
        _zhuanrangLab.hidden = NO;
        _zhuanrangLab.text = _detailPModel.transfer_froze_time;
        
    }else{
        
        _zhuanrangLab.hidden = true;
        
        _zhuanrangPic.hidden = true;
    }
    
    UIColor *textColor = GetColor(@"#555555");
    
    NSMutableAttributedString *ketoustr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"可投  %.0f元", _detailPModel.remainingInvestmentAmount /100.0]];
    [ketoustr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0,2)];
    
    self.ketouLabel.attributedText = ketoustr;
    
    
    _qitouLabel.textColor = [XXColor goldenColor];
    _qitouLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_qitouLabel];
    NSMutableAttributedString *qitoustr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"起投  %.0f元", _detailPModel.singlePurchaseLowerLimit /100.0]];
    [qitoustr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0,2)];
    
    self.qitouLabel.attributedText = qitoustr;
    
    if (_detailPModel.investmentProgress == 100) {
        
        self.manBiaoPic.hidden = NO;
        
        self.progressView.hidden = YES;
        
        self.baifenbiLabel.hidden = YES;
        
    }else{
        
        self.manBiaoPic.hidden = YES;
        
        self.progressView.hidden = NO;
        
        self.baifenbiLabel.hidden = NO;
        
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%ld%%", (long)_detailPModel.investmentProgress]];
        
//        text.setAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)], range: NSMakeRange(text.length-1, 1));
        
        NSRange touziRangeTwo = NSMakeRange([[text string] rangeOfString:@"%%"].location, [[text string] rangeOfString:@"%%"].length);
        [text addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:touziRangeTwo];
        
        self.baifenbiLabel.attributedText = text;
        
        self.progressView.progress = (double)(_detailPModel.investmentProgress) / 100.0;
    }
    
    
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
