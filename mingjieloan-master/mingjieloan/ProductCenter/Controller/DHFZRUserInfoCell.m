//
//  DHFZRUserInfoCell.m
//  mingjieloan
//
//  Created by kang on 17/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFZRUserInfoCell.h"

@implementation DHFZRUserInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
        [self createViews];
    }
    return self;
}

- (void)createViews{
    
    self.titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 11, 14.5)];
    _titleImg.image = [UIImage imageNamed:@"document"];
    [self.contentView addSubview:_titleImg];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12, 100, 15)];
    _titleLab.font = [UIFont systemFontOfSize:14];
    _titleLab.text = @"借款人信息";
    [self.contentView addSubview:_titleLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView];
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 37, 100, 15)];
    _nameLab.font = [UIFont systemFontOfSize:13];
    _nameLab.textColor = GetColor(@"#555555");
    _nameLab.text = @"姓名：";
    [self.contentView addSubview:_nameLab];
    
    self.sexLab = [[UILabel alloc] initWithFrame:CGRectMake(115, 37, 60, 15)];
    _sexLab.font = [UIFont systemFontOfSize:13];
    _sexLab.textColor = GetColor(@"#555555");
    _sexLab.text = @"性别：";
    [self.contentView addSubview:_sexLab];
    
    self.ageLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 55, 100, 15)];
    _ageLab.font = [UIFont systemFontOfSize:13];
    _ageLab.textColor = GetColor(@"#555555");
    _ageLab.text = @"年龄：";
    [self.contentView addSubview:_ageLab];
    
    self.yongtuLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 80, kWIDTH - 26, 70)];
    //    _detailLab.backgroundColor = [UIColor greenColor];
    _yongtuLab.font = [UIFont systemFontOfSize:13];
    _yongtuLab.text = @"资金用途:买房子买媳妇买车买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买买";
    _yongtuLab.textColor = GetColor(@"#555555");
    _yongtuLab.numberOfLines = 0;
    [self.contentView addSubview:_yongtuLab];
    CGFloat hight = [HeightWithString heightForTextLable:_yongtuLab.text width:kWIDTH - 24 fontSize:13];
    _yongtuLab.frame = CGRectMake(13, 80, kWIDTH - 26, hight);
    
    
    self.lineView1 = [[UIView alloc] initWithFrame:CGRectMake(12, 80+hight+19, kWIDTH - 24, 1)];
    _lineView1.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView1];
    
    self.lookBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 80+hight+19, kWIDTH, 40)];
    [_lookBtn setTitle:@"查看原始项目信息>>" forState:UIControlStateNormal];
    _lookBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_lookBtn setTitleColor:[XXColor labGoldenColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_lookBtn];
    
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 80+hight+60, kWIDTH, 10)];
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
