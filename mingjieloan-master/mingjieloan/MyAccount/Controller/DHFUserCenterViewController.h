//
//  DHFUserCenterViewController.h
//  mingjieloan
//
//  Created by kang on 16/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "DHFUserCenterCell.h"
#import "DHFSetUserNameViewController.h"//设置用户名
#import "DHFChangPhoneViewController.h"//更改手机号
#import "DHFSetCardViewController.h"//设置身份证
#import "DHFcommonWebViewVC.h"//绑定银行卡
#import "DHFChangeLogPassWordVC.h"//修改登陆密码


#import "DHFGesturePassVC.h"
#import "DHFGestureCloseVC.h"

#import "ZZNoDataPromptVC.h"

#import "IPToolManager.h"//获取IP

@interface DHFUserCenterViewController : SubBaseViewController

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UISwitch *switchView;

@property (nonatomic, copy)NSString *passWord;

@end

