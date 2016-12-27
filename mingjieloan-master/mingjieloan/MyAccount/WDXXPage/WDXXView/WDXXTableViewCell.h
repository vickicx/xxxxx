//
//  WDXXTableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/3/28.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "WDXXModel.h"

@interface WDXXTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *msgTitleLabel;

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *msgLabel;

@property (nonatomic, strong) UIImageView *enterImageView;

@property (nonatomic, strong) WDXXModel *model;

@property (nonatomic, copy) NSString *msgTitleStr;

+ (CGFloat)heightOfLabel:(NSString *)text andWith:(CGFloat)width;

@end
