//
//  JFGZCell.m
//  Yilicai
//
//  Created by 盐商 on 16/4/8.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "JFGZCell.h"
#import "XXColor.h"

@implementation JFGZCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.msgTitleLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.msgTitleLabel];
        
        self.jfscButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.contentView addSubview:self.jfscButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat height =[[self class] heightOfLabel:self.str andWith:kWIDTH * 375];
    
    if ([self.str containsString:@"1. 新手注册送"]) {
        
        height = 220 * kHEIGHT;
        
    }
    
    
    if ([self.str containsString:@"1. 积分可兑换铭捷贷现金券及实物商品等；"]) {
        
        height = 190 * kHEIGHT;
        
    }
    
    self.msgTitleLabel.frame = CGRectMake(15 * kWIDTH, 5 * kHEIGHT, 375 * kWIDTH - 20, height);
    
    self.msgTitleLabel.numberOfLines = 0;
    
    self.msgTitleLabel.font = [UIFont systemFontOfSize:12];
    
    self.msgTitleLabel.textColor = [UIColor grayColor];
    
    [self.jfscButton setTitle:@"进入积分商城>>" forState:UIControlStateNormal];
    
    [self.jfscButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
    
    self.jfscButton.titleLabel.font = [UIFont systemFontOfSize:11];
    
    self.jfscButton.titleLabel.textAlignment = NSTextAlignmentCenter;

}


- (void)setStr:(NSString *)str {
    
    _str = str;
    
    self.msgTitleLabel.text = str;
    
    if (str != nil) {
        
        //改变行间距
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:str];
        
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        
        [paragraphStyle1 setLineSpacing:5];
        
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [str length])];
        
        [self.msgTitleLabel setAttributedText:attributedString1];
        
        [self.msgTitleLabel sizeToFit];
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
    
    return frame.size.height;
}



@end
