//
//  HYGZCell.h
//  Yilicai
//
//  Created by 盐商 on 16/5/24.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface HYGZCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *describeLabel;

@property (nonatomic, strong) UIImageView *huiyuanImageView;

@property (nonatomic, strong) UIButton *hyzxButton;

@property (nonatomic, copy) NSString *str;

+ (CGFloat)heightOfLabel:(NSString *)text andWith:(CGFloat)width;

@end
