//
//  WDJFCollectionViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/3/28.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "WDJFCollectionViewCell.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"

#define cWIDTH self.contentView.frame.size.width
#define cHEIGHT self.contentView.frame.size.height

@implementation WDJFCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.picImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.picImageView];
        
        self.titleLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.titleLabel];
        
        self.descriptionLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.descriptionLabel];
        
        self.exchangeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.contentView addSubview:self.exchangeBtn];
        
        self.restLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.restLabel];
    }
    
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.picImageView.frame = CGRectMake(cWIDTH / 3, 10 * FitHeight, cWIDTH / 3, cHEIGHT / 90 * 41);
    
    self.titleLabel.frame = CGRectMake(0, 15 * FitHeight + self.picImageView.frame.size.height, cWIDTH, 25 * FitHeight);
    
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.titleLabel.textColor = [UIColor darkGrayColor];
    
    self.descriptionLabel.frame = CGRectMake(cWIDTH / 11, 10 * FitHeight + self.picImageView.frame.size.height + self.titleLabel.frame.size.height, cWIDTH / 11 * 9, 37 * FitHeight);
    
    self.descriptionLabel.font = [UIFont systemFontOfSize:9];
    
    self.descriptionLabel.textColor = [UIColor darkGrayColor];
    
    self.descriptionLabel.numberOfLines = 2;
    
    self.exchangeBtn.frame = CGRectMake(cWIDTH / 6, 10 * FitHeight + self.picImageView.frame.size.height + self.titleLabel.frame.size.height + self.descriptionLabel.frame.size.height, cWIDTH / 3 * 2, 30 * FitHeight);
    
    [self.exchangeBtn setTitle:@"我要兑换" forState:UIControlStateNormal];
    
    self.exchangeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    self.exchangeBtn.layer.cornerRadius = 3;
    
    self.exchangeBtn.layer.masksToBounds = YES;
    
    [self.exchangeBtn.layer setBorderWidth:1.0];
    
    
    self.restLabel.frame = CGRectMake(0, 10 * FitHeight + self.picImageView.frame.size.height + self.titleLabel.frame.size.height + self.descriptionLabel.frame.size.height + self.exchangeBtn.frame.size.height, self.contentView.frame.size.width, 15 * FitHeight);
    
    self.restLabel.font = [UIFont systemFontOfSize:10];
    
    self.restLabel.textAlignment = NSTextAlignmentCenter;
    
    self.restLabel.textColor = [UIColor darkGrayColor];

    
}

- (void)setModel:(JFSCModel *)model {
    
    _model = model;
    
    NSString *picUrl = [NSString stringWithFormat:@"%@", model.img_path];
    
     NSString *imageURLStr = [picUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:imageURLStr] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    
    self.titleLabel.text = [NSString stringWithFormat:@"会员价: %@积分", model.cost_point];
    
    self.descriptionLabel.text = [NSString stringWithFormat:@"(%@)", model.description];
    
    self.restLabel.text = [NSString stringWithFormat:@"库存%@个", model.stock];
    
    
}

@end
