//
//  WDXXDetailTableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/3/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "WDXXDetailTableViewCell.h"

@implementation WDXXDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.msgTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.msgTitleLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.dateLabel];
        
        self.lineView = [[UIView alloc] init];
        [self.contentView addSubview:self.lineView];
        
        self.msgLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.msgLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat titleHeight =[[self class] heightOfLabel:self.msgTitleStr andWith:200 * kWIDTH];
    
    self.msgTitleLabel.frame = CGRectMake(15 * kWIDTH, 8 * kHEIGHT, 200 * kWIDTH, titleHeight);
    self.msgTitleLabel.font = [UIFont systemFontOfSize:14.5 * kWIDTH];
    self.msgTitleLabel.textColor = [XXColor goldenColor];
    self.msgTitleLabel.numberOfLines = 0;
    
    self.dateLabel.frame = CGRectMake(375 * kWIDTH - 15 * kWIDTH - 200 * kWIDTH, 8 * kHEIGHT, 200 * kWIDTH, 30 * kHEIGHT);
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    self.dateLabel.font = [UIFont systemFontOfSize:13.5 * kWIDTH];
    self.dateLabel.textColor = [XXColor goldenColor];
    
    self.lineView.frame = CGRectMake(15 * kWIDTH, 11 * kHEIGHT + self.msgTitleLabel.frame.size.height, 375 * kWIDTH - 30 * kWIDTH, 1.5 * kHEIGHT);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    CGFloat height =[[self class] heightOfLabel:self.msgStr andWith:375 * kWIDTH - 30 * kWIDTH];
    
    self.msgLabel.frame = CGRectMake(15 * kWIDTH, 25 * kHEIGHT + self.msgTitleLabel.frame.size.height + self.lineView.frame.size.height, 375 * kWIDTH - 30 * kWIDTH, height);
    self.msgLabel.textColor = [UIColor darkGrayColor];
    self.msgLabel.numberOfLines = 0;
    self.msgLabel.font = [UIFont systemFontOfSize:13.5 * kWIDTH];
    self.msgLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    //改变行间距
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:self.msgLabel.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:6];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [self.msgLabel.text length])];
    [self.msgLabel setAttributedText:attributedString1];
    [self.msgLabel sizeToFit];
    
    CGPoint pointXX1 = self.dateLabel.center;
    
    pointXX1.y = self.msgTitleLabel.center.y;
    
    self.dateLabel.center = pointXX1;
}

- (void)setMsgStr:(NSString *)msgStr {
    
    _msgStr = msgStr;
    
    self.msgLabel.text = msgStr;
    
}

- (void)setMsgTitleStr:(NSString *)msgTitleStr {
    
    _msgTitleStr = msgTitleStr;
    
    self.msgTitleLabel.text = msgTitleStr;
    
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
