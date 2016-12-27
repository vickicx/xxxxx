//
//  HYGZ2Cell.h
//  Yilicai
//
//  Created by 盐商 on 16/6/1.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface HYGZ2Cell : BaseTableViewCell

@property (nonatomic, strong) UIImageView *boxImageView;

@property (nonatomic, strong) UILabel *boxTitleLabel;

@property (nonatomic, strong) UILabel *boxLabel;

@property (nonatomic, strong) UIImageView *cakeImageView;

@property (nonatomic, strong) UILabel *cakeTitleLabel;

@property (nonatomic, strong) UILabel *cakeLabel;

@property (nonatomic, copy) NSString *boxTitleStr;

@property (nonatomic, copy) NSString *boxStr;

@property (nonatomic, copy) NSString *cakeTitleStr;

@property (nonatomic, copy) NSString *cakeStr;

+ (CGFloat)heightOfLabel:(NSString *)text andWith:(CGFloat)width;

@end
