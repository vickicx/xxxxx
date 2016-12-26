//
//  TBTableViewCell.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBTableViewCell : UITableViewCell

@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UILabel *useMoneyLab;
@property (nonatomic, strong)UIButton *chongZhiBtn;
@property (nonatomic, strong)UITextField *inPutField;

@property (nonatomic, strong)UIView *botView;
@end
