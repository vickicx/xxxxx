//
//  BasicInfo.h
//  mingjieloan
//
//  Created by 王好帅 on 2016/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicInfo : NSObject

+ (BasicInfo *)sharedInstance;

// 账户信息
//@property (strong, nonatomic) NSDictionary * account;
// 账户状态
@property (strong, nonatomic) NSNumber     * accountStatus;
//
@property (strong, nonatomic) NSNumber     * asset;
// 自动还款
@property (strong, nonatomic) NSNumber     * autoRepay;
// 自动转移
@property (strong, nonatomic) NSNumber     * autoTransfer;
// 账户余额
@property (strong, nonatomic) NSNumber     * available;
// 银行账户
@property (strong, nonatomic) NSNumber     * bankAccount;
// 开户行名
@property (strong, nonatomic) NSString     * bankName;
// 银行卡状态
@property (strong, nonatomic) NSNumber     * cardStatus;
// 现金金额
@property (strong, nonatomic) NSNumber     * cashPrice;
// 冻结金额
@property (strong, nonatomic) NSNumber     * frozen;
// 身份证号
@property (strong, nonatomic) NSString     * idCard;
// 真实姓名
@property (strong, nonatomic) NSString     * realName;
// 用户id
@property (strong, nonatomic) NSNumber     * uid;

// 会员等级
@property (strong, nonatomic) NSNumber     * member_level;
// 返回信息
@property (strong, nonatomic) NSString     * msg;
// 未读信息
@property (strong, nonatomic) NSNumber     * noreadmessage;
// 账户状态
@property (strong, nonatomic) NSNumber     * status;

// 个人信息
// @property (strong, nonatomic) NSDictionary * user;
// 创建时间
@property (strong, nonatomic) NSNumber     * createTime;
// 个人邮箱
@property (strong, nonatomic) NSString     * email;
// 邮箱可用
@property (strong, nonatomic) NSNumber     * emailValidated;
// id可用
@property (strong, nonatomic) NSNumber     * idValidated;
// 上次mod时间
@property (strong, nonatomic) NSNumber     * lastModTime;
// 昵称
@property (strong, nonatomic) NSString     * name;
// 昵称是否可用
@property (strong, nonatomic) NSString     * nameValidated;
// 密码
@property (strong, nonatomic) NSString     * password;
// 电话
@property (strong, nonatomic) NSString     * phone;
// refer
@property (strong, nonatomic) NSString     * refer;
// 盐？
@property (strong, nonatomic) NSString     * salt;
// source
@property (strong, nonatomic) NSString     * source;


@end
