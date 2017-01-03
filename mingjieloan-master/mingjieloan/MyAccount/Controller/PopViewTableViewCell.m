//
//  PopViewTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/30.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "PopViewTableViewCell.h"

@implementation PopViewTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        self.contentView.backgroundColor = GetColor(@"#f8f8f8");
        [self createView];
    }
    return self;
}

- (void)createView{
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH - 47 * 2, 400)];
    [self.contentView addSubview:_imgView];
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
