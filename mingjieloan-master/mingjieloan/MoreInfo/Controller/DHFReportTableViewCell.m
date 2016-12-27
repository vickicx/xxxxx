//
//  DHFReportTableViewCell.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFReportTableViewCell.h"
#define kWIDTH (self.contentView.bounds.size.width/375)
#define kHEIGHT ([UIScreen mainScreen].bounds.size.height/667)
@implementation DHFReportTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.picImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.picImageView];
        
        self.titleLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.titleLabel];
        
        self.dateLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.dateLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.picImageView.frame = CGRectMake(10 * kWIDTH, 12 * kHEIGHT, self.contentView.frame.size.height, self.contentView.frame.size.height / 160 * 125);
    
    self.titleLabel.frame = CGRectMake(15 * kWIDTH + self.picImageView.frame.size.width, 15 * kHEIGHT, self.contentView.frame.size.width - 15 * kWIDTH - 10 * kWIDTH - self.picImageView.frame.size.width, self.contentView.frame.size.height / 2);
    
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
    self.titleLabel.numberOfLines = 0;
    
    self.dateLabel.frame = CGRectMake(15 * kWIDTH + self.picImageView.frame.size.width, 15 * kHEIGHT + self.picImageView.frame.size.height - 20 * kHEIGHT, 200 * kWIDTH, 20 * kHEIGHT);
    
    self.dateLabel.font = [UIFont systemFontOfSize:10];
    
    self.dateLabel.textColor = [UIColor grayColor];
    
    
}

- (void)setModel:(MediaReportModel *)model {
    
//    NSLog(@"%@",model.img_path);
//    NSLog(@"sfsdfsdfsdfsdfsdf");
    _model = model;
    
    NSString *imageURLStr = [model.img_path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:imageURLStr] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@", model.publish_date];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
