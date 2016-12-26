//
//  DHFMoreTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFMoreTableViewCell.h"

@implementation DHFMoreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self createViews];
    }
    return self;
}

- (void)createViews{
    self.titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(25, 16, 18.5, 18.5)];
    [self.contentView addSubview:_titleImg];
    
    self.titlLab = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 100, 50)];
    _titlLab.font = [UIFont systemFontOfSize:15];
    _titlLab.textColor = GetColor(@"#808080");
    [self.contentView addSubview:_titlLab];
    
    self.rightImg = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH - 35, 17, 16, 16)];
    _rightImg.image = [UIImage imageNamed:@"enter_1"];
    [self.contentView addSubview:_rightImg];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, kWIDTH, 1)];
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
