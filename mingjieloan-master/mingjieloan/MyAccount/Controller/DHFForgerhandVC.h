//
//  DHFForgerhandVC.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2017/1/1.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"

@interface DHFForgerhandVC : SubBaseViewController

@property (nonatomic, strong)UITextField *phoneField;
@property (nonatomic, strong)UIView *lineView1;
@property (nonatomic, strong)UITextField *passWordField;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UILabel *warning;
@property (nonatomic, strong)UIButton *YesBtn;


@property (strong, nonatomic) UIImageView * codeImageView;
@property (strong, nonatomic) UITextField * codeField;
@property (strong, nonatomic) UIView * codeLine;
@property (strong, nonatomic) UIImageView * yzmImage;

@end
