//
//  HDFInviteFriendOtherViewController.h
//  mingjieloan
//
//  Created by kang on 16/12/29.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "DHFInviteHistoryViewController.h"


@interface HDFInviteFriendOtherViewController : SubBaseViewController


@property (nonatomic, strong)UIImageView *headBackView;
@property (nonatomic, strong)UILabel *invitePeoLab;
@property (nonatomic, strong)UILabel *inviteNum;

@property (nonatomic, strong)UILabel *backMoneyLab;
@property (nonatomic, strong)UILabel *backMoneyNum;
@property (nonatomic, strong)UILabel *waitBackLab;
@property (nonatomic, strong)UILabel *waitBackNum;

@property (nonatomic, strong)UILabel *backJifenLab;
@property (nonatomic, strong)UILabel *jifenNum;

@property (nonatomic, strong)UILabel *yaoQingMalab;
@property (nonatomic, strong)UILabel *yaoQingMatext;

@property (nonatomic, strong)UILabel *yongJinlab;
@property (nonatomic, strong)UILabel *yongJintext;

@property (nonatomic, strong)UIButton *InviteHisBtn;
@property (nonatomic, strong)UILabel *InviteLabel;
@property (nonatomic, strong)UILabel *lookLabel;
@property (nonatomic, strong)UIImageView *rightImg;

@property (nonatomic, strong)UIButton *inviteFriendBtn;
@property (nonatomic, strong)UIImageView *codeImg;


@property (nonatomic, copy)NSString *recommendationUrl;
@property (nonatomic, assign)NSInteger cashReturned;//邀请人数
@property (nonatomic, assign)NSInteger cashToReturn;//已返现金
@property (nonatomic, assign)NSInteger couponCashSum;//待返现金
@property (nonatomic, assign)NSInteger incentive_commission;//获得现金券
@property (nonatomic, assign)NSInteger invitationCount;//已返积分
@property (nonatomic, assign)NSInteger yongjinshouyi;
@property (nonatomic, copy)NSString *refCode;

@end
