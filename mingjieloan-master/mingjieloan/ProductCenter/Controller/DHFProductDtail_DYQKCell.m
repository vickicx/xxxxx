//
//  DHFProductDtail_DYQKCell.m
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFProductDtail_DYQKCell.h"

@implementation DHFProductDtail_DYQKCell


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
    _titleLab.text = @"抵押情况";
    [self.contentView addSubview:_titleLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 32, kWIDTH - 24, 1)];
    _lineView.backgroundColor = GetColor(@"#e8e8e8");
    [self.contentView addSubview:_lineView];
    
    
    self.textLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 35, kWIDTH - 30, 20)];
    _textLab.textColor = [XXColor grayAllColor];
    _textLab.font = [UIFont systemFontOfSize:12];
    _textLab.text = @"除了自己全都抵押了除了自己全都抵押了除了自己全都抵押了除了自己全都抵押了除了自己全都抵押了除了自己全都抵押了";
    [self.contentView addSubview:_textLab];
    
    
    //这个cell高度是40 + texlab的自适应高度 +5;
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
