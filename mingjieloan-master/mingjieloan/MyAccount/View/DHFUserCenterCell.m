//
//  DHFUserCenterCell.m
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFUserCenterCell.h"

@implementation DHFUserCenterCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createViews];
    }
    return self;
}

- (void)createViews{
    self.titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 16, 18.5, 18.5)];
    [self.contentView addSubview:_titleImg];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 150, 50)];
    _titleLab.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_titleLab];
    
    self.textLab = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 216, 0, 200, 50)];
    _textLab.font  = [UIFont systemFontOfSize:14];
    _textLab.textAlignment = NSTextAlignmentRight;
    _textLab.textColor = GetColor(@"#808080");
    [self.contentView addSubview:_textLab];
    
    
    self.rightImg = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 35, 17, 16, 16)];
    _rightImg.image = [UIImage imageNamed:@"enter_1"];
    [self.contentView addSubview:_rightImg];
    
    self.switchView = [[UISwitch alloc] initWithFrame:CGRectMake(kWIDTH - 70, 10, 40, 40)];
    [self.contentView addSubview:_switchView];
    
    
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(25, 49, kWIDTH - 25, 1)];
    _bottomView.backgroundColor = GetColor(@"#E6E3EE");
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
