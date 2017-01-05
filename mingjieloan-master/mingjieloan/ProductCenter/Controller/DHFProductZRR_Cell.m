//
//  DHFProductZRR_Cell.m
//  mingjieloan
//
//  Created by kang on 17/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "DHFProductZRR_Cell.h"

@implementation DHFProductZRR_Cell

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
    _titleImg.image = [UIImage imageNamed:@"zhuanrangren"];
    [self.contentView addSubview:_titleImg];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 12, 100, 15)];
    _titleLab.font = [UIFont systemFontOfSize:14];
    _titleLab.text = @"转让人信息";
    [self.contentView addSubview:_titleLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView];
    
    ;
    self.sexLab;
    ;
    ;
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 35, 120, 20)];
    _nameLab.textColor = [XXColor grayAllColor];
    _nameLab.font = [UIFont systemFontOfSize:12];
    _nameLab.text = @"昵称：呵呵哒";
    [self.contentView addSubview:_nameLab];
    
    
    
    
    self.sexLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2, 35, 120, 20)];
    _sexLab.textColor = [XXColor grayAllColor];
    _sexLab.font = [UIFont systemFontOfSize:12];
    _sexLab.text = @"性别：不详";
    [self.contentView addSubview:_sexLab];
    
    self.phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, 120, 20)];
    _phoneLab.textColor = [XXColor grayAllColor];
    _phoneLab.font = [UIFont systemFontOfSize:12];
    _phoneLab.text = @"手机号：123456789";
    [self.contentView addSubview:_phoneLab];
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2, 60, kWIDTH / 2, 20)];
    _timeLab.textColor = [XXColor grayAllColor];
    _timeLab.font = [UIFont systemFontOfSize:12];
    _timeLab.text = @"注册时间 ：2017-1-23";
    [self.contentView addSubview:_timeLab];
    
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
