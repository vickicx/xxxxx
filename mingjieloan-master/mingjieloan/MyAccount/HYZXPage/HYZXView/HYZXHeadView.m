//
//  HYZXHeadView.m
//  Yilicai
//
//  Created by 盐商 on 16/5/20.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYZXHeadView.h"

#define KWIDTH ([UIScreen mainScreen].bounds.size.width/375)
#define KHEIGHT ([UIScreen mainScreen].bounds.size.height/667)

@implementation HYZXHeadView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backImageView = [[UIImageView alloc] init];
        [self addSubview:self.backImageView];
        
        self.backScrollView = [[UIScrollView alloc] init];
        [self addSubview:self.backScrollView];
        
        self.headLineView = [[UIView alloc] init];
        [self.backScrollView addSubview:self.headLineView];
        
        self.headImageView = [[UIImageView alloc] init];
        [self.backScrollView addSubview:self.headImageView];
        
        self.head2ImageView = [[UIImageView alloc] init];
        [self.backScrollView addSubview:self.head2ImageView];
        
        self.head3ImageView = [[UIImageView alloc] init];
        [self.backScrollView addSubview:self.head3ImageView];
        
        self.head4ImageView = [[UIImageView alloc] init];
        [self.backScrollView addSubview:self.head4ImageView];
        
        self.nameLabel = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.nameLabel];
        
        self.jifen2Label = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.jifen2Label];
        
        self.jifen3Label = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.jifen3Label];
        
        self.jifen4Label = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.jifen4Label];
        
        self.diaphanous1View = [[UIView alloc] init];
        [self.backScrollView addSubview:self.diaphanous1View];
        
        self.diaphanous2View = [[UIView alloc] init];
        [self.backScrollView addSubview:self.diaphanous2View];
        
        self.diaphanous3View = [[UIView alloc] init];
        [self.backScrollView addSubview:self.diaphanous3View];
        
        self.zongzichanTitleLabel = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.zongzichanTitleLabel];
        
        self.kaquanTitleLabel = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.kaquanTitleLabel];
        
        self.wodejifenTitleLabel = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.wodejifenTitleLabel];
        
        self.zongzichanLabel = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.zongzichanLabel];
        
        self.kaquanLabel = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.kaquanLabel];
        
        self.wodejifenLabel = [[UILabel alloc] init];
        [self.backScrollView addSubview:self.wodejifenLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backImageView.frame = self.frame;
    self.backImageView.backgroundColor = [UIColor cyanColor];
    
    self.backScrollView.frame = self.frame;
    
    self.headLineView.frame = CGRectMake(100 * KWIDTH, 53* KHEIGHT, 375 * KWIDTH - 100 * KWIDTH, 5 * KHEIGHT);
    self.headLineView.backgroundColor = [UIColor blackColor];
    
    self.headImageView.frame = CGRectMake(50 * KWIDTH, 30 * KHEIGHT, 80 * KWIDTH, 80 * KHEIGHT);
    self.headImageView.backgroundColor = [UIColor orangeColor];
    
    self.head2ImageView.frame = CGRectMake(180 * KWIDTH, 80 * KHEIGHT, 50 * KWIDTH, 50 * KHEIGHT);
    self.head2ImageView.backgroundColor = [UIColor redColor];
    
    self.head3ImageView.frame = CGRectMake(270 * KWIDTH, 80 * KHEIGHT, 50 * KWIDTH, 50 * KHEIGHT);
    self.head3ImageView.backgroundColor = [UIColor redColor];
    
    self.head4ImageView.frame = CGRectMake(300 * KWIDTH, 80 * KHEIGHT, 50 * KWIDTH, 50 * KHEIGHT);
    self.head4ImageView.backgroundColor = [UIColor redColor];
    
    self.nameLabel.frame = CGRectMake(50 * KWIDTH, 30 * KHEIGHT + self.headImageView.frame.size.height, 100 * KWIDTH, 25 * KHEIGHT);
    self.nameLabel.backgroundColor = [UIColor yellowColor];
    
    self.jifen2Label.frame = CGRectMake(180 * KWIDTH, 80 * KHEIGHT + self.jifen2Label.frame.size.height, 50 * KWIDTH, 20 * KHEIGHT);
    self.jifen2Label.backgroundColor = [UIColor yellowColor];
    
    self.jifen3Label.frame = CGRectMake(270 * KWIDTH, 80 * KHEIGHT + self.jifen3Label.frame.size.height, 50 * KWIDTH, 20 * KHEIGHT);
    self.jifen3Label.backgroundColor = [UIColor yellowColor];
    
    self.jifen4Label.frame = CGRectMake(300 * KWIDTH, 80 * KHEIGHT + self.jifen4Label.frame.size.height, 50 * KWIDTH, 20 * KHEIGHT);
    self.jifen4Label.backgroundColor = [UIColor yellowColor];
    
}




/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
