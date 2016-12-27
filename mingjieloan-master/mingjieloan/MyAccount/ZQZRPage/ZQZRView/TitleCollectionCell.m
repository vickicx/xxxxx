//
//  TitleCollectionCell.m
//  Yilicai
//
//  Created by 盐商 on 16/6/22.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "TitleCollectionCell.h"

@implementation TitleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
    }
    
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = self.contentView.frame;
    
    self.titleLabel.font = [UIFont systemFontOfSize:17];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
