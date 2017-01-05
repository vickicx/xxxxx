//
//  DHFZRProductCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFZRProductCell.h"

@implementation DHFZRProductCell

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
    
    _zhuangtaiLab = [[UIImageView alloc] initWithFrame:CGRectMake(220, 7.5, 19, 19)];
    _zhuangtaiLab.image = [UIImage imageNamed:@"big_zhuan"];
    [self.contentView addSubview:_zhuangtaiLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(10, 34, kWIDTH - 20, 1)];
    _lineView.backgroundColor = GetColor(@"#d8d8d8");
    [self.contentView addSubview:_lineView];
    
    
    self.touziLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 40, 60, 15)];
    _touziLabel.font = [UIFont systemFontOfSize:12];
    _touziLabel.textAlignment = NSTextAlignmentCenter;
    _touziLabel.text = @"转让金额";
    _touziLabel.textColor = textColor;
    [self.contentView addSubview:_touziLabel];
    
    self.touzishuziLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, 60, 15)];
    _touzishuziLab.font = [UIFont systemFontOfSize:14];
    _touzishuziLab.textColor = [XXColor goldenColor];
    NSMutableAttributedString *touziStr = [[NSMutableAttributedString alloc]initWithString:@"8万"];
    NSRange touziRangeTwo = NSMakeRange([[touziStr string] rangeOfString:@"万"].location, [[touziStr string] rangeOfString:@"万"].length);
    [touziStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:touziRangeTwo];
    _touzishuziLab.attributedText = touziStr;
    [self.contentView addSubview:_touzishuziLab];
    
    
    self.shouyiLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 65, 80, 15)];
    _shouyiLabel.font = [UIFont systemFontOfSize:12];
    _shouyiLabel.textAlignment = NSTextAlignmentCenter;
    _shouyiLabel.text = @"预期年化收益";
    _shouyiLabel.textColor = textColor;
    [self.contentView addSubview:_shouyiLabel];
    
    self.shouyibaifenLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 65, 80, 15)];
    _shouyibaifenLab.font = [UIFont systemFontOfSize:14];
    _shouyibaifenLab.textColor = [XXColor goldenColor];
    NSMutableAttributedString *shouyiStr = [[NSMutableAttributedString alloc]initWithString:@"4.8%"];
    NSRange shouyiTwo = NSMakeRange([[shouyiStr string] rangeOfString:@"%"].location, [[shouyiStr string] rangeOfString:@"%"].length);
    [shouyiStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:shouyiTwo];
    _shouyibaifenLab.attributedText = shouyiStr;
    [self.contentView addSubview:_shouyibaifenLab];

    
    self.xiangmuLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 90, 60, 15)];
    _xiangmuLabel.font = [UIFont systemFontOfSize:12];
    _xiangmuLabel.textAlignment = NSTextAlignmentCenter;
    _xiangmuLabel.text = @"项目期限";
    _xiangmuLabel.textColor = textColor;
    [self.contentView addSubview:_xiangmuLabel];
    
    
    self.xiangmutianshuLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 90, 60, 15)];
    _xiangmutianshuLab.font = [UIFont systemFontOfSize:14];
    _xiangmutianshuLab.textColor = [XXColor goldenColor];
    NSMutableAttributedString *xiangmuStr = [[NSMutableAttributedString alloc]initWithString:@"8天"];
    NSRange xiangmuTwo = NSMakeRange([[xiangmuStr string] rangeOfString:@"天"].location, [[xiangmuStr string] rangeOfString:@"天"].length);
    [xiangmuStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:xiangmuTwo];
    _xiangmutianshuLab.attributedText = xiangmuStr;
    [self.contentView addSubview:_xiangmutianshuLab];
    
    self.daoqiLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 115, 60, 15)];
    _daoqiLabel.font = [UIFont systemFontOfSize:12];
    _daoqiLabel.textAlignment = NSTextAlignmentCenter;
    _daoqiLabel.text = @"到期时间";
    _daoqiLabel.textColor = textColor;
    [self.contentView addSubview:_daoqiLabel];
    
    self.daoqiTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 115, 120, 15)];
    _daoqiTimeLab.text = @"2017-01-23";
    _daoqiTimeLab.font = [UIFont systemFontOfSize:14];
    _daoqiTimeLab.textColor = [XXColor goldenColor];
    [self.contentView addSubview:_daoqiTimeLab];

    
    
    self.baozhangPic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 150.5, 11.5, 14.5)];
    _baozhangPic.image = [UIImage imageNamed:@"product_detail_baozhang"];
    [self.contentView addSubview:_baozhangPic];
    
    self.baozhangLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 151.5, 100, 13.5)];
    _baozhangLab.font = [UIFont systemFontOfSize:12];
    _baozhangLab.text = @"第三方机构担保";
    _baozhangLab.textColor = textColor;
    [self.contentView addSubview:_baozhangLab];
    
    
    self.huankuanPic = [[UIImageView alloc] initWithFrame:CGRectMake(135, 152.5, 11, 10)];
    _huankuanPic.image = [UIImage imageNamed:@"product_time"];
    [self.contentView addSubview:_huankuanPic];
    
    self.huankuanLab = [[UILabel alloc] initWithFrame:CGRectMake(150, 151.5, 100, 13.5)];
    _huankuanLab.font = [UIFont systemFontOfSize:12];
    _huankuanLab.textColor = textColor;
    [self.contentView addSubview:_huankuanLab];
    
    self.timePic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 176.5, 12, 11.5)];
    _timePic.image = [UIImage imageNamed:@"product_detail_time"];
    [self.contentView addSubview:_timePic];
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 176, 200*FitWidth, 13)];
    _timeLab.font = [UIFont systemFontOfSize:12];
    _timeLab.text = @"剩余投资时间 0天11时35分";
    _timeLab.textColor = textColor;
    [self.contentView addSubview:_timeLab];
    
    self.jixiPic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 195, 13, 13)];
    _jixiPic.image = [UIImage imageNamed:@"mumanjixi"];
    [self.contentView addSubview:_jixiPic];
    
    self.jixiLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 195, 200 * FitWidth, 13)];
    _jixiLab.font = [UIFont systemFontOfSize:12];
    _jixiLab.text = @"募满后T+1日计息";
    _jixiLab.textColor = textColor;
    [self.contentView addSubview:_jixiLab];
    
    
    
    self.zhuanrangPic = [[UIImageView alloc] initWithFrame:CGRectMake(15, 213, 13.5, 13.5)];
    _zhuanrangPic.image = [UIImage imageNamed:@"small_zhuan"];
    [self.contentView addSubview:_zhuanrangPic];
    
    self.zhuanrangLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 213, 300 * FitWidth, 13)];
    _zhuanrangLab.font = [UIFont systemFontOfSize:12];
    _zhuanrangLab.text = @"持有该项目90天以上可以转让";
    _zhuanrangLab.textColor = textColor;
    [self.contentView addSubview:_zhuanrangLab];
    
    
    self.ketouLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 110, 180, 100, 14)];
    _ketouLabel.textColor = [XXColor goldenColor];
    _ketouLabel.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:_ketouLabel];
    NSMutableAttributedString *ketoustr = [[NSMutableAttributedString alloc] initWithString:@"可投  1000000元"];
    [ketoustr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0,2)];
    
    self.ketouLabel.attributedText = ketoustr;
    
    
    self.qitouLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 110, 210, 100, 14)];
    
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
    
    self.botView = [[UIView alloc] initWithFrame:CGRectMake(0, 230, kWIDTH, 10)];
    _botView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_botView];
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
