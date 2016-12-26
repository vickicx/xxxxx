//
//  TBTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "TBTableViewCell.h"

@implementation TBTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
        [self createViews];
    }
    return self;
}

- (void)createViews{
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 20)];
    _topView.backgroundColor = GetColor(@"#F1F1F1");
    [self.contentView addSubview:_topView];
    self.useMoneyLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 150, 15)];
    _useMoneyLab.font = [UIFont systemFontOfSize:13];
    _useMoneyLab.textColor = [XXColor labGoldenColor];
    [self.contentView addSubview:_useMoneyLab];
    NSMutableAttributedString *ketoustr = [[NSMutableAttributedString alloc] initWithString:@"可用金额: 1000000元"];
    [ketoustr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,4)];
    self.useMoneyLab.attributedText = ketoustr;
    
    
    
    self.chongZhiBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWIDTH - 90, 35, 70, 30)];
    _chongZhiBtn.backgroundColor = [XXColor purchaseBtnBgrdColor];
    [_chongZhiBtn setTitle:@"充值" forState:UIControlStateNormal];
    _chongZhiBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_chongZhiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_chongZhiBtn];
    
    self.inPutField = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, kWIDTH - 40, 40)];
    _inPutField.backgroundColor = GetColor(@"#EFEEF3");
    _inPutField.placeholder = @"输入金额为100元的整数倍";
    _inPutField.keyboardType = UIKeyboardTypeNumberPad;
    _inPutField.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_inPutField];
    
    self.botView = [[UIView alloc] initWithFrame:CGRectMake(0, 140, kWIDTH, 20)];
    _botView.backgroundColor = GetColor(@"F1F1F1");
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
