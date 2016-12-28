//
//  UserInfo.h
//  mingjieloan
//
//  Created by 王好帅 on 2016/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

// 个人信息类

// 初始化
+ (UserInfo *)sharedInstance;

// 个人信息

// 支付开户 1.已开启 2.无效
@property (strong, nonatomic) NSNumber * available;
// 冻结的金额
@property (strong, nonatomic) NSNumber * frozeAmount;
// 投资的金额
@property (strong, nonatomic) NSNumber * investAmount;
// 是否签到
@property (strong, nonatomic) NSNumber * is_sign;
// 会员的等级
@property (strong, nonatomic) NSNumber * member;
// 未读消息
@property (strong, nonatomic) NSNumber * noreadmessage;
// 存钱罐的数据
@property (strong, nonatomic) NSNumber * piggybankamount;
// 签到天数
@property (strong, nonatomic) NSNumber * signday;
// 身份证有效标识 2.有效 0.审核中 1.未绑定身份证
@property (strong, nonatomic) NSNumber * status;
// 时间戳
@property (strong, nonatomic) NSNumber * timestamp;
// 累计收益
@property (strong, nonatomic) NSNumber * totalInterest;
// 未获收益
@property (strong, nonatomic) NSNumber * unrepaidInterest;
// 每日提现的金额
@property (strong, nonatomic) NSNumber * userAccountWithdrawSum;
// userDayRechargeTotal
@property (strong, nonatomic) NSNumber * userDayRechargeTotal;
// 可提现金额
@property (strong, nonatomic) NSNumber * withdrawCash;














@end
