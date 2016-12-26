//
//  ProductShenheTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductShenheTableViewCell.h"

@implementation ProductShenheTableViewCell

    - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            //        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
            [self createViews];
        }
        return self;
    }
    
- (void)createViews{
    
    self.titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 6, 13, 13)];
    _titleImg.image = [UIImage imageNamed:@"shenhejilu_right"];
    [self.contentView addSubview:_titleImg];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 100, 25)];
    _titleLab.font = [UIFont systemFontOfSize:13];
    _titleLab.text = @"机动车登记证";
    [self.contentView addSubview:_titleLab];
    
    
    
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
