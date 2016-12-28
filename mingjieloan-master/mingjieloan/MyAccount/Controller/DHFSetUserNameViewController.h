//
//  DHFSetUserNameViewController.h
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "DHFUserCenterCell.h"

@interface DHFSetUserNameViewController : SubBaseViewController

@property (nonatomic, strong)UITextField *nameField;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UILabel *warning;
@property (nonatomic, strong)UILabel *warningLab;
@property (nonatomic, strong)UIButton *YesBtn;

@end
