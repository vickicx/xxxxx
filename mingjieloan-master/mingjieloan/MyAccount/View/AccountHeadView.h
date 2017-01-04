//
//  AccountHeadView.h
//  mingjieloan
//
//  Created by 谢丰泽 on 2016/12/26.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYJLViewController.h"


@protocol TrageRecordDelegate <NSObject>

- (void)tradeRecord;

@end

@protocol RechargeDelegate <NSObject>

- (void)Recharge;

@end

@interface AccountHeadView : UIView

@property(nonatomic, strong) BasicInfo *basicInfo;

@property(nonatomic, strong) UserInfo *userInfo;

//总资产
@property (nonatomic,strong) UILabel *zongzichanLab;

//预期收益
@property (nonatomic,strong) UILabel *yuqishouyiLab;

//累计收益
@property (nonatomic,strong) UILabel *leijishouyiLab;

//我的投资
@property (nonatomic,strong) UILabel *wodetouziLab;

//账户余额
@property (nonatomic,strong) UILabel *zhanghuyueLab;

//冻结资金
@property (nonatomic,strong) UILabel *dongjiezijin;
//存钱罐
@property (nonatomic, strong) UILabel *boxlabel;

@property (weak, nonatomic) id<TrageRecordDelegate>delegate;
@property (weak, nonatomic) id<RechargeDelegate> recharge;
- (instancetype)initWithFrame:(CGRect)frame;


@end
