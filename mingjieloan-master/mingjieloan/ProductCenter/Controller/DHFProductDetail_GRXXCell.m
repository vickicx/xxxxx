//
//  DHFProductDetail_GRXXCell.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFProductDetail_GRXXCell.h"

@implementation DHFProductDetail_GRXXCell

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
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 35, 120, 20)];
    _nameLab.textColor = [XXColor grayAllColor];
    _nameLab.font = [UIFont systemFontOfSize:12];
    _nameLab.text = @"名    字：张三";
    [self.contentView addSubview:_nameLab];
    
    self.marryLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2, 35, 120, 20)];
    _marryLab.textColor = [XXColor grayAllColor];
    _marryLab.font = [UIFont systemFontOfSize:12];
    _marryLab.text = @"是否结婚：离异";
    [self.contentView addSubview:_marryLab];
    
    _sexLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, 120, 20)];
    _sexLab.textColor = [XXColor grayAllColor];
    _sexLab.font = [UIFont systemFontOfSize:12];
    _sexLab.text = @"性    别：张三";
    [self.contentView addSubview:_sexLab];
    
    _whereLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2, 60, 120, 20)];
    _whereLab.textColor = [XXColor grayAllColor];
    _whereLab.font = [UIFont systemFontOfSize:12];
    _whereLab.text = @"户籍城市：凤凰之神";
    [self.contentView addSubview:_whereLab];
    
    _ageLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 85, 120, 20)];
    _ageLab.textColor = [XXColor grayAllColor];
    _ageLab.font = [UIFont systemFontOfSize:12];
    _ageLab.text = @"年    龄：张三";
    [self.contentView addSubview:_ageLab];
    
    _collgeLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2, 85, 120, 20)];
    _collgeLab.textColor = [XXColor grayAllColor];
    _collgeLab.font = [UIFont systemFontOfSize:12];
    _collgeLab.text = @"学    历：家里蹲";
    [self.contentView addSubview:_collgeLab];
    
    //这个cell高度是105 
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
