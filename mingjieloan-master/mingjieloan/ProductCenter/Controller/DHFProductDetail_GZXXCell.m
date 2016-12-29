//
//  DHFProductDetail_GZXXCell.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFProductDetail_GZXXCell.h"

@implementation DHFProductDetail_GZXXCell

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
    _titleLab.text = @"工作信息";
    [self.contentView addSubview:_titleLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView];
    
    
    self.cityLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 35, kWIDTH - 30, 20)];
    _cityLab.textColor = [XXColor grayAllColor];
    _cityLab.font = [UIFont systemFontOfSize:12];
    _cityLab.text = @"工作城市：上海";
    [self.contentView addSubview:_cityLab];
    
    _zhiyeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, kWIDTH - 30, 20)];
    _zhiyeLab.textColor = [XXColor grayAllColor];
    _zhiyeLab.font = [UIFont systemFontOfSize:12];
    _zhiyeLab.text = @"职    业：前台";
    [self.contentView addSubview:_zhiyeLab];
    
    _guimoLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 85, kWIDTH - 30, 20)];
    _guimoLab.textColor = [XXColor grayAllColor];
    _guimoLab.font = [UIFont systemFontOfSize:12];
    _guimoLab.text = @"单位规模：100-1000人";
    [self.contentView addSubview:_guimoLab];
    
    _hangyeLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 110, kWIDTH - 30, 20)];
    _hangyeLab.textColor = [XXColor grayAllColor];
    _hangyeLab.font = [UIFont systemFontOfSize:12];
    _hangyeLab.text = @"公司行业行业：互联网";
    [self.contentView addSubview:_hangyeLab];
    
    _zhiwuLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 135, kWIDTH - 30, 20)];
    _zhiwuLab.textColor = [XXColor grayAllColor];
    _zhiwuLab.font = [UIFont systemFontOfSize:12];
    _zhiwuLab.text = @"企业介绍：职务";
    [self.contentView addSubview:_zhiwuLab];
    
    //这个cell高度是155
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
