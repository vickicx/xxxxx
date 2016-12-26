//
//  ProductUserInforTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/24.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductUserInforTableViewCell.h"

@implementation ProductUserInforTableViewCell

    
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
    _nameLab.text = @"姓名：郭**";
    [self.contentView addSubview:_nameLab];
    
    self.sexLab = [[UILabel alloc] initWithFrame:CGRectMake(115, 37, 60, 15)];
    _sexLab.font = [UIFont systemFontOfSize:13];
    _sexLab.textColor = GetColor(@"#555555");
    _sexLab.text = @"性别：男";
    [self.contentView addSubview:_sexLab];
    
    self.ageLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 55, 100, 15)];
    _ageLab.font = [UIFont systemFontOfSize:13];
    _ageLab.textColor = GetColor(@"#555555");
    _ageLab.text = @"年龄：41";
    [self.contentView addSubview:_ageLab];
    
    self.yongtuLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 80, kWIDTH - 24, 70)];
    //    _detailLab.backgroundColor = [UIColor greenColor];
    _yongtuLab.font = [UIFont systemFontOfSize:13];
    _yongtuLab.textColor = GetColor(@"#555555");
    _yongtuLab.numberOfLines = 0;
    _yongtuLab.text = @"资金用途：资金周转";
    [self.contentView addSubview:_yongtuLab];
    CGFloat hight = [HeightWithString heightForTextLable:_yongtuLab.text width:kWIDTH - 24 fontSize:13];
    _yongtuLab.frame = CGRectMake(13, 80, kWIDTH - 26, hight);
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 80+hight+20, kWIDTH, 10)];
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
