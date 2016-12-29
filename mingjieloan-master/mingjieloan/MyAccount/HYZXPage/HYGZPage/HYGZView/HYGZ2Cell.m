//
//  HYGZ2Cell.m
//  Yilicai
//
//  Created by 盐商 on 16/6/1.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYGZ2Cell.h"

@implementation HYGZ2Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.boxImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.boxImageView];
        
        self.boxTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.boxTitleLabel];
        
        self.boxLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.boxLabel];
        
        self.cakeImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.cakeImageView];
        
        self.cakeTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.cakeTitleLabel];
        
        self.cakeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.cakeLabel];
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    self.boxImageView.frame = CGRectMake(20 * kWIDTH, 30 * kHEIGHT, 40 * kWIDTH, 40 * kHEIGHT);
    
    CGFloat boxTitleHeight =[[self class] heightOfLabel:self.boxTitleStr andWith:FitWidth * 200];
    
    self.boxTitleLabel.frame = CGRectMake(110 * FitWidth, 20 * FitHeight, 200 * FitWidth, boxTitleHeight);
    self.boxTitleLabel.font = [UIFont systemFontOfSize:13];
    
//    self.boxTitleLabel.backgroundColor = [UIColor redColor];
    
    
    CGFloat boxHeight =[[self class] heightOfLabel:self.boxStr andWith:FitWidth * 250];
    
    if ([self.boxStr containsString:@"V3，V4，V5，V6， V7和V8会员在每月1-10号，"]) {
        boxHeight = 70 * FitHeight;
    }
    
    self.boxLabel.frame = CGRectMake(110 * FitWidth, 20 * FitHeight + self.boxTitleLabel.frame.size.height, 250 * FitWidth, boxHeight);
    self.boxLabel.font = [UIFont systemFontOfSize:11];
    self.boxLabel.numberOfLines = 0;
    
//    self.boxLabel.backgroundColor = [UIColor yellowColor];
    
    CGFloat cakeTitleHeight =[[self class] heightOfLabel:self.cakeTitleStr andWith:FitWidth * 200];
    
    self.cakeTitleLabel.frame = CGRectMake(110 * FitWidth, 30 * FitHeight + self.boxTitleLabel.frame.size.height + self.boxLabel.frame.size.height, 200 * FitWidth, cakeTitleHeight);
    self.cakeTitleLabel.font = [UIFont systemFontOfSize:13];
    
//    self.cakeTitleLabel.backgroundColor = [UIColor cyanColor];
    
    
    CGFloat cakeHeight =[[self class] heightOfLabel:self.cakeStr andWith:FitWidth * 250];
    
    if ([self.cakeStr containsString:@"V3，V4，V5，V6， V7和V8会员在生日当月，"]) {
        cakeHeight = 50 * FitHeight;
    }
    
    self.cakeLabel.frame = CGRectMake(110 * FitWidth, 30 * FitHeight + self.boxTitleLabel.frame.size.height + self.boxLabel.frame.size.height + self.cakeTitleLabel.frame.size.height, 250 * FitWidth, cakeHeight);
    self.cakeLabel.font = [UIFont systemFontOfSize:11];
    self.cakeLabel.numberOfLines = 0;
    
//    self.cakeLabel.backgroundColor = [UIColor purpleColor];
}


- (void)setBoxTitleStr:(NSString *)boxTitleStr
{
    
    _boxTitleStr = boxTitleStr;
    
    self.boxTitleLabel.text = boxTitleStr;
    
    if (boxTitleStr != nil) {
        //改变行间距
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:boxTitleStr];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [boxTitleStr length])];
        [self.boxTitleLabel setAttributedText:attributedString1];
        [self.boxTitleLabel sizeToFit];
    }
}

- (void)setBoxStr:(NSString *)boxStr
{
    
    _boxStr = boxStr;
    
    self.boxLabel.text = boxStr;
    
    if (boxStr != nil) {
        //改变行间距
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:boxStr];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [boxStr length])];
        [self.boxLabel setAttributedText:attributedString1];
        [self.boxLabel sizeToFit];
    }
}


- (void)setCakeTitleStr:(NSString *)cakeTitleStr
{
    
    _cakeTitleStr = cakeTitleStr;
    
    self.cakeTitleLabel.text = cakeTitleStr;
    
    if (cakeTitleStr != nil) {
        //改变行间距
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:cakeTitleStr];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [cakeTitleStr length])];
        [self.cakeTitleLabel setAttributedText:attributedString1];
        [self.cakeTitleLabel sizeToFit];
    }
}


- (void)setCakeStr:(NSString *)cakeStr
{
    
    _cakeStr = cakeStr;
    
    self.cakeLabel.text = cakeStr;
    
    if (cakeStr != nil) {
        //改变行间距
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:cakeStr];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [cakeStr length])];
        [self.cakeLabel setAttributedText:attributedString1];
        [self.cakeLabel sizeToFit];
    }
}


/*
 * 根据要显示的内容计算:label的frame, 并且返回高度值
 */
+ (CGFloat)heightOfLabel:(NSString *)text andWith:(CGFloat)width
{
    //第一步: 设置文本的最大显示范围
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    //第二步: 设置字体样式
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17] forKey:NSFontAttributeName];
    
    //
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return frame.size.height;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
