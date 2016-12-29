//
//  HYGZCell.m
//  Yilicai
//
//  Created by 盐商 on 16/5/24.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYGZCell.h"
#import "XXColor.h"

@implementation HYGZCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.describeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.describeLabel];
        
        self.huiyuanImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.huiyuanImageView];
        
        self.hyzxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.hyzxButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat height =[[self class] heightOfLabel:self.str andWith:FitWidth * 375];
    
    if ([self.str containsString:@"1. 每月1日0点，铭捷贷根据会员上一月度日均总资产调整会员等级，并享受相应的特权；"]) {
        
        height = 250 * FitHeight;
    }
    
    if ([self.str containsString:@"在每一个自然月内，铭捷贷每日会统计用户账户里的总资产，取该"]) {
        
        height = 60 * FitHeight;
    }
    
    self.describeLabel.frame = CGRectMake(15 * FitWidth, 15 * FitHeight, kWIDTH - 30 * FitHeight, height);
    
    self.describeLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    
    self.describeLabel.numberOfLines = 0;
    
    self.describeLabel.textColor = [UIColor darkGrayColor];
    
    [self.hyzxButton setTitle:@"查看我的在投本金>>" forState:UIControlStateNormal];
    
    [self.hyzxButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
    
    self.hyzxButton.titleLabel.font = [UIFont systemFontOfSize:11];
    
    self.hyzxButton.titleLabel.textAlignment = NSTextAlignmentRight;
    
}

- (void)setStr:(NSString *)str {
    
    _str = str;
    
    self.describeLabel.text = str;
    
    if (str != nil) {
        
        //改变行间距
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:str];
        
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [str length])];
        
        [self.describeLabel setAttributedText:attributedString1];
        
        [self.describeLabel sizeToFit];
    }
}



/*
 * 根据要显示的内容计算:label的frame, 并且返回高度值
 */
+ (CGFloat)heightOfLabel:(NSString *)text andWith:(CGFloat)width {
    
    //第一步: 设置文本的最大显示范围
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    //第二步: 设置字体样式
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17] forKey:NSFontAttributeName];
    
    //
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    //NSLog(@"%f",frame.size.height);
    
    return frame.size.height;
}



@end
