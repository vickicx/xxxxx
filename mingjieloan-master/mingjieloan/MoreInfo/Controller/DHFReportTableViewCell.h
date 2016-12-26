//
//  DHFReportTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaReportModel.h"
@interface DHFReportTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) MediaReportModel *model;

@end
