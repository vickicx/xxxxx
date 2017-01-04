//
//  WDXXTableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/3/28.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "WDXXTableViewCell.h"
#import "XXColor.h"
#import "UIView+Extension.h"

@implementation WDXXTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
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
        
        self.enterImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.enterImageView];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat height =[[self class] heightOfLabel:self.msgTitleStr andWith:kWIDTH - 170];

    self.msgTitleLabel.frame = CGRectMake(15 * FitWidth, 8 * FitHeight, kWIDTH - 170 * FitWidth, height);
    self.msgTitleLabel.font = [UIFont systemFontOfSize:14.5 * FitWidth];
    self.msgTitleLabel.numberOfLines = 0;
    
    self.dateLabel.frame = CGRectMake(kWIDTH - 15 * FitWidth - 150 * FitWidth, 8 * FitHeight, 150 * FitWidth, 30 * FitHeight);
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    self.dateLabel.font = [UIFont systemFontOfSize:13.5 * FitWidth];
    
    self.lineView.frame = CGRectMake(0, 11 * FitWidth + self.msgTitleLabel.frame.size.height,  kWIDTH, 1.5 * FitHeight);
    self.lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.msgLabel.frame = CGRectMake(15 * FitWidth, 25 * FitHeight + self.msgTitleLabel.frame.size.height + self.lineView.frame.size.height,  kWIDTH - 50 * FitWidth, 60 * FitHeight);
    self.msgLabel.textColor = [UIColor grayColor];
    self.msgLabel.numberOfLines = 2;
    self.msgLabel.font = [UIFont systemFontOfSize:13.5 * FitWidth];
    self.msgLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.enterImageView.frame = CGRectMake(kWIDTH - 5 * FitWidth - 30 * FitWidth, height, 20 * FitWidth, 20 * FitHeight);
    self.enterImageView.image = [UIImage imageNamed:@"enter_1"];
    
    CGPoint pointXX = self.enterImageView.center;
    
    pointXX.x = pointXX.x + 5;
    
    pointXX.y = self.msgLabel.center.y;
    
    self.enterImageView.center = pointXX;
    
    CGPoint pointXX1 = self.dateLabel.center;
    
    pointXX1.y = self.msgTitleLabel.center.y;
    
    self.dateLabel.center = pointXX1;
}

- (void)setModel:(WDXXModel *)model {
    
    _model = model;
    
    self.msgTitleStr = [NSString stringWithFormat:@"%@", model.subject];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@", model.ins_date];
    
    self.msgLabel.text = [NSString stringWithFormat:@"%@", model.contents];
    
    //改变行间距
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:self.msgLabel.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle1 setLineSpacing:6];
    
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [self.msgLabel.text length])];
    
    [self.msgLabel setAttributedText:attributedString1];
    
    [self.msgLabel sizeToFit];
    
    if (model.open_flg.integerValue == 0) {
        
        self.msgTitleLabel.textColor = [XXColor goldenColor];
        
        self.dateLabel.textColor = [XXColor goldenColor];

    }else{
        
        self.msgTitleLabel.textColor = [UIColor grayColor];
        
        self.dateLabel.textColor = [UIColor grayColor];
    }
    
    CGPoint pointXX = self.enterImageView.center;
    
    pointXX.y = self.msgLabel.center.y;
    
    self.enterImageView.center = pointXX;
    
}

- (void)setMsgTitleStr:(NSString *)msgTitleStr {
    
    _msgTitleStr = msgTitleStr;
    
    self.msgTitleLabel.text = msgTitleStr;
    
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



@end
