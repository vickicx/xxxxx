//
//  ProductIntroductionTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/24.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductIntroductionTableViewCell.h"

@implementation ProductIntroductionTableViewCell

    
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
    _titleImg.image = [UIImage imageNamed:@"xiangmujiejian"];
    [self.contentView addSubview:_titleImg];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12, 100, 15)];
    _titleLab.font = [UIFont systemFontOfSize:14];
    _titleLab.text = @"项目简介";
    [self.contentView addSubview:_titleLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView];
    
    
    self.detailLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 47, kWIDTH - 24, 70)];
//    _detailLab.backgroundColor = [UIColor greenColor];
    _detailLab.font = [UIFont systemFontOfSize:13];
    _detailLab.textColor = GetColor(@"#555555");
    _detailLab.numberOfLines = 0;
    _detailLab.text = @"借款人经营一家汽车美容商行，有多年经营管理经验。车行有固定会员数百人。消费群体为中高档车主，群体稳定。商行经营状况良好，有员工数十人，收益稳定。本地有房产，具有良好的还款意愿和还款能力。\n该自然人在本平台借款余额未超过人民币20万元。";
    [self.contentView addSubview:_detailLab];
    CGFloat hight = [HeightWithString heightForTextLable:_detailLab.text width:kWIDTH - 24 fontSize:13];
    _detailLab.frame = CGRectMake(13, 47, kWIDTH - 26, hight);

    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 47+hight+30, kWIDTH, 10)];
    _bottomView.backgroundColor = GetColor(@"e8e8e8");
    [self.contentView addSubview:_bottomView];
}


- (void)setDetailPModel:(ProductDetailModel *)detailPModel{
    _detailPModel = detailPModel;
    
    _detailLab.text = _detailPModel.detailDescription;
    
    
    CGFloat hight = [HeightWithString heightForTextLable:_detailLab.text width:kWIDTH - 24 fontSize:13];
    _detailLab.frame = CGRectMake(13, 47, kWIDTH - 26, hight);
    
    self.bottomView.frame = CGRectMake(0, 47+hight+30, kWIDTH, 10);
    
    
    
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
