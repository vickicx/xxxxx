//
//  MoreInfoViewController.h
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import "BaseViewController.h"
#import "DHFMoreTableViewCell.h"
#import "DHFAboutMJViewController.h"//关于MJD
#import "DHFReportViewController.h"
#import "DHFHelpCenterViewController.h"//帮助中心
#import "AHAlertView.h"
#import "DHFNoticeViewController.h"//平台公告
#import "DHFInviteFriendViewController.h"//邀请好友
@interface MoreInfoViewController : BaseViewController

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *bottomView;
@property (nonatomic, strong)UIButton *logOutBtn;

@end
