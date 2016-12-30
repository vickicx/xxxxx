//
//  ProductUserInforTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/24.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PApplicationModel.h"//借款 人信息Model

@interface ProductUserInforTableViewCell : UITableViewCell
    
@property (nonatomic, strong)UIImageView *titleImg;
@property (nonatomic, strong)UILabel *titleLab;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UILabel *nameLab;
@property (nonatomic, strong)UILabel *sexLab;
@property (nonatomic, strong)UILabel *ageLab;
@property (nonatomic, strong)UILabel *yongtuLab;
@property (nonatomic, strong)UIView *bottomView;
@property (nonatomic, strong)PApplicationModel *pApplocationModel;

@end
