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
    
    CGFloat titleHeight =[[self class] heightOfLabel:self.msgTitleStr andWith:200 * FitWidth];
    
    self.msgTitleLabel.frame = CGRectMake(15 * FitWidth, 8 * kHEIGHT, 200 * FitWidth, titleHeight);
    self.msgTitleLabel.font = [UIFont systemFontOfSize:14.5 * FitWidth];
    self.msgTitleLabel.textColor = [XXColor goldenColor];
    self.msgTitleLabel.numberOfLines = 0;
    
    self.dateLabel.frame = CGRectMake(kWIDTH - 15 * FitWidth - 200 * FitWidth, 8 * FitHeight, 200 * FitWidth, 30 * FitHeight);
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    self.dateLabel.font = [UIFont systemFontOfSize:13.5 * FitWidth];
    self.dateLabel.textColor = [XXColor goldenColor];
    
    self.lineView.frame = CGRectMake(15 * FitWidth, 11 * FitHeight + self.msgTitleLabel.frame.size.height,  kWIDTH - 30 * FitWidth, 1.5 * FitHeight);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    CGFloat height =[[self class] heightOfLabel:self.msgStr andWith: kWIDTH - 30 * FitWidth];
    
    self.msgLabel.frame = CGRectMake(15 * FitWidth, 25 * FitHeight + self.msgTitleLabel.frame.size.height + self.lineView.frame.size.height, kWIDTH - 30 * FitWidth, height);
    self.msgLabel.textColor = [UIColor darkGrayColor];
    self.msgLabel.numberOfLines = 0;
    self.msgLabel.font = [UIFont systemFontOfSize:13.5 * FitWidth];
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
