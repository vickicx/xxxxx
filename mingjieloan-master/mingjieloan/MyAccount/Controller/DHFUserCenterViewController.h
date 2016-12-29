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


@property (nonatomic, assign)NSInteger nameValidated;//呢称标示，1.有效 0.无效
@property (nonatomic, assign)NSInteger cardStatus;//银行卡的状态
@property (nonatomic, assign)NSInteger accountStatus;// 身份证有效标识 2：有效：0审核中 1：未绑身份证


@end

