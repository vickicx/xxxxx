//
//  WDXXDetailTableViewCell.h
//  Yilicai
//
//  Created by 盐商 on 16/3/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface WDXXDetailTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *msgTitleLabel;

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *msgLabel;

@property (nonatomic, copy) NSString *msgTitleStr;

@property (nonatomic, copy) NSString *msgStr;

+ (CGFloat)heightOfLabel:(NSString *)text andWith:(CGFloat)width;

@end
