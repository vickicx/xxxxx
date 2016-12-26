//
//  DHFNoticeTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFNoticeTableViewCell.h"

@implementation DHFNoticeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createViews];
    }
    return self;
}

- (void)createViews{
    self.titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 21.5, 7, 7)];
    _titleImage.image = [UIImage imageNamed:@"circle_icon"];
    [self.contentView addSubview:_titleImage];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 280 * FitWidth, 50)];
    _titleLab.font = [UIFont systemFontOfSize:15];
    _titleLab.text = @"【银行维护通知】关于近期中行、建行的事情大家怎么看";

    [self.contentView addSubview:_titleLab];
    
    self.dataLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 120, 0, 100, 50)];
    _dataLab.font = [UIFont systemFontOfSize:15];
    _dataLab.textAlignment = NSTextAlignmentRight;
    _dataLab.text = @"2016-11-09";
    [self.contentView addSubview:_dataLab];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(25, 49, kWIDTH - 25, 1)];
    _lineView.backgroundColor = GetColor(@"#d8d8d8");
    [self.contentView addSubview:_lineView];
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
