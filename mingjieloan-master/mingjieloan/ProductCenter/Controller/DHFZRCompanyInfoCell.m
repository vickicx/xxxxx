//
//  DHFZRCompanyInfoCell.m
//  mingjieloan
//
//  Created by kang on 17/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFZRCompanyInfoCell.h"

@implementation DHFZRCompanyInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
        [self createViews];
    }
    return self;
}

- (void)createViews{
    self.titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 13, 15)];
    _titleImg.image = [UIImage imageNamed:@"product_detail_name"];
    [self.contentView addSubview:_titleImg];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12, 100, 15)];
    _titleLab.font = [UIFont systemFontOfSize:14];
    _titleLab.text = @"个人信息";
    [self.contentView addSubview:_titleLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView];
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 35, kWIDTH - 30, 20)];
    _nameLab.textColor = [XXColor grayAllColor];
    _nameLab.font = [UIFont systemFontOfSize:12];
    _nameLab.text = @"企业名称：为了部落";
    [self.contentView addSubview:_nameLab];
    
    _daiBiaoLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, kWIDTH - 30, 20)];
    _daiBiaoLab.textColor = [XXColor grayAllColor];
    _daiBiaoLab.font = [UIFont systemFontOfSize:12];
    _daiBiaoLab.text = @"法人代表：张三";
    [self.contentView addSubview:_daiBiaoLab];
    
    _zichanLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 85, kWIDTH - 30, 20)];
    _zichanLab.textColor = [XXColor grayAllColor];
    _zichanLab.font = [UIFont systemFontOfSize:12];
    _zichanLab.text = @"注册资金：6000万美金";
    [self.contentView addSubview:_zichanLab];
    
    _hangyeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 110, kWIDTH - 30, 20)];
    _hangyeLab.textColor = [XXColor grayAllColor];
    _hangyeLab.font = [UIFont systemFontOfSize:12];
    _hangyeLab.text = @"所属行业：互联网";
    [self.contentView addSubview:_hangyeLab];
    
    self.lineView1 = [[UIView alloc] initWithFrame:CGRectMake(12, 130, kWIDTH - 24, 1)];
    _lineView1.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView1];
    
    self.lookBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 130, kWIDTH, 40)];
    [_lookBtn setTitle:@"查看原始项目信息>>" forState:UIControlStateNormal];
    _lookBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_lookBtn setTitleColor:[XXColor labGoldenColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_lookBtn];
    
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 170, kWIDTH, 10)];
    _bottomView.backgroundColor = GetColor(@"e8e8e8");
    [self.contentView addSubview:_bottomView];
    
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
