//
//  AccountRechargeTableViewController.h
//  mingjieloan
//
//  Created by vicki on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountRechargeTableViewController : UITableViewController

@property (nonatomic, strong) UILabel * accountLab;

@property (nonatomic, strong) UIButton *czBtn;

@property (nonatomic, strong) UITextField * money;

@property (nonatomic,assign) BOOL hasError;

@property (nonatomic, copy) NSString * sid;

@property (nonatomic, copy) NSString * HTMLStr;

@property (nonatomic, copy) NSString * sign;

@property (nonatomic, copy) NSString * uri;

@property (nonatomic, copy) NSString * zhanghuyue;

@property (nonatomic, copy) NSString * ip_Str;





@end
