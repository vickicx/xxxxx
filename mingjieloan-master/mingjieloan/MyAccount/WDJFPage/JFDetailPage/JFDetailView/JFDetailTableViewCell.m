//
//  JFDetailTableViewCell.m
//  Yilicai
//
//  Created by 盐商 on 16/4/11.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "JFDetailTableViewCell.h"

@implementation JFDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.dateLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.dateLabel];
        
        self.priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.priceLabel];
        
        self.descriptionLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.descriptionLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.dateLabel.frame = CGRectMake(15 * kWIDTH, 10 * kHEIGHT, 200 * kWIDTH, 30 * kHEIGHT);
    self.dateLabel.font = [UIFont systemFontOfSize:13];
    self.dateLabel.textColor = [UIColor grayColor];
//    self.dateLabel.backgroundColor = [UIColor cyanColor];
    
    self.descriptionLabel.frame = CGRectMake(375 * kWIDTH - 250 * kWIDTH - 15 * kWIDTH, 10 * kHEIGHT + self.dateLabel.frame.size.height, 250 * kWIDTH, 30 * kHEIGHT);
    self.descriptionLabel.font = [UIFont systemFontOfSize:14];
    self.descriptionLabel.textColor = [UIColor darkGrayColor];
    self.descriptionLabel.textAlignment = NSTextAlignmentRight;
//    self.descriptionLabel.backgroundColor = [UIColor redColor];
    
    self.priceLabel.frame = CGRectMake(15 * kWIDTH, 10 * kHEIGHT + self.dateLabel.frame.size.height, 200 * kWIDTH, 30 * kHEIGHT);
    self.priceLabel.font = [UIFont systemFontOfSize:14];
//    self.priceLabel.backgroundColor = [UIColor yellowColor];

}

- (void)setModel:(JFDetailModel *)model
{
    _model = model;
    
    if (model.ins_date != nil) {
        
        self.dateLabel.text = [NSString stringWithFormat:@"%@", model.ins_date];
        
        self.descriptionLabel.text = [NSString stringWithFormat:@"%@", model.point_description];
        
//        NSString *price = [[self class] countNumAndChangeformat:model.point];
        
        self.priceLabel.text = [NSString stringWithFormat:@"%@", model.point];
    }else{
        
        self.dateLabel.text = [NSString stringWithFormat:@"%@", model.batch_run_time];
        
        self.descriptionLabel.text = @"已过期";
        
        self.priceLabel.text = [NSString stringWithFormat:@"%@", model.befor_point];
    }
    
    
}

+(NSString *)countNumAndChangeformat:(NSString *)num
{
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)
    {
        count++;
        a /= 10;
    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
