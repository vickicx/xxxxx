//
//  JFGZCell.h
//  Yilicai
//
//  Created by 盐商 on 16/4/8.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface JFGZCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *msgTitleLabel;

@property (nonatomic, strong) UIButton *jfscButton;

@property (nonatomic, copy) NSString *str;

+ (CGFloat)heightOfLabel:(NSString *)text andWith:(CGFloat)width;

@property (nonatomic, assign) BOOL close;

@end
