//
//  DHFProductDetail_GRZZXXCell.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFProductDetail_GRZZXXCell.h"

@implementation DHFProductDetail_GRZZXXCell




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
    _titleLab.text = @"个人资产及征信信息";
    [self.contentView addSubview:_titleLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView];
    
    
    self.fangchanLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 35, 120, 20)];
    _fangchanLab.textColor = [XXColor grayAllColor];
    _fangchanLab.font = [UIFont systemFontOfSize:12];
    _fangchanLab.text = @"房    产：无";
    [self.contentView addSubview:_fangchanLab];
    
    

    
    self.chechanLab= [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2, 35, 120, 20)];
    _chechanLab.textColor = [XXColor grayAllColor];
    _chechanLab.font = [UIFont systemFontOfSize:12];
    _chechanLab.text = @"车    产：无";
    [self.contentView addSubview:_chechanLab];
    
    _fangdaiLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 60, 120, 20)];
    _fangdaiLab.textColor = [XXColor grayAllColor];
    _fangdaiLab.font = [UIFont systemFontOfSize:12];
    _fangdaiLab.text = @"房    贷：没房子哪来的房贷";
    [self.contentView addSubview:_fangdaiLab];
    
    _chedaiLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH / 2, 60, 120, 20)];
    _chedaiLab.textColor = [XXColor grayAllColor];
    _chedaiLab.font = [UIFont systemFontOfSize:12];
    _chedaiLab.text = @"车贷：没车哪来的车贷";
    [self.contentView addSubview:_chedaiLab];
    
    _shouruLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 85, kWIDTH - 30, 20)];
    _shouruLab.textColor = [XXColor grayAllColor];
    _shouruLab.font = [UIFont systemFontOfSize:12];
    _shouruLab.text = @"年收入水平：月入百万";
    [self.contentView addSubview:_shouruLab];
    
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
