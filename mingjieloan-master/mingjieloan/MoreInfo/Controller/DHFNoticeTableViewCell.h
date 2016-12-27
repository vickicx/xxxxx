//
//  DHFNoticeTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticeModel.h"
@interface DHFNoticeTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *titleImage;

@property (nonatomic, strong)UILabel *titleLab;

@property (nonatomic, strong)UILabel *dataLab;

@property (nonatomic, strong)UIView *lineView;

@property (nonatomic, strong)NoticeModel *noticeModel;
@end
