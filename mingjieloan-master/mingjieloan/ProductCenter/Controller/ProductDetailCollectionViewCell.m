//
//  ProductDetailCollectionViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "ProductDetailCollectionViewCell.h"

@implementation ProductDetailCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }
    return self;
}

- (void)createViews{
    self.titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 60, 60)];
    [self.contentView addSubview:_titleImg];
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 90, 20)];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titleLab];
}

@end
