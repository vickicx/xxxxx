//
//  AccountHeadView.m
//  mingjieloan
//
//  Created by 谢丰泽 on 2016/12/26.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "AccountHeadView.h"

@implementation AccountHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT * 0.18)];
        view.backgroundColor = [XXColor imagasAsetsSum];
        
        
        //总资产
        self.zongzichanLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kWIDTH, kHEIGHT * 0.1)];
        self.zongzichanLab.font = [UIFont systemFontOfSize:28];
        self.zongzichanLab.textColor = [UIColor whiteColor];
        self.zongzichanLab.text = @"总资产(元) 0.00";
        [view addSubview:self.zongzichanLab];
        
        
        
        //预期代收收益
        self.yuqishouyiLab = [[UILabel alloc] initWithFrame:CGRectMake(10, kHEIGHT *   0.1, kWIDTH * 0.5, 30)];
        self.yuqishouyiLab.text = @"预期待收收益(元) 0.00";
        self.yuqishouyiLab.textColor = [UIColor whiteColor];
        [view addSubview:self.yuqishouyiLab];
        
        //交易记录
        UIButton *recordsbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        recordsbutton.frame = CGRectMake(kWIDTH - kWIDTH * 0.4, kHEIGHT * 0.1, kWIDTH * 0.5, 30);
        recordsbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [recordsbutton setTitle:@"交易记录>>" forState:0];
        [recordsbutton addTarget:self action:@selector(recordsbutton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:recordsbutton];
        [self addSubview:view];
        
        //分割线
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(5, kHEIGHT * 0.3, kWIDTH-10, 1)];
        view1.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view1];
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(5, kHEIGHT * 0.42, kWIDTH-10, 1)];
        view2.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view2];
        
        UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(kWIDTH / 2,kHEIGHT * 0.18 + 5, 1, kWIDTH * 0.2 - 4)];
        view3.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view3];
        
        UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(kWIDTH / 2, kHEIGHT * 0.3 + 5, 1, kWIDTH * 0.2 - 4)];
        view4.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view4];
        
        UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(5, kHEIGHT * 0.5, kWIDTH-10, 1)];
        view5.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view5];
        
        //我的投资
        UILabel *mylabel = [[UILabel alloc] initWithFrame:CGRectMake(15, kHEIGHT * 0.2, 100, 30)];
        mylabel.font = [UIFont systemFontOfSize:14];
        mylabel.textColor = [UIColor grayColor];
        mylabel.text = @"我的投资 (元)";
        [self addSubview:mylabel];
        
        self.wodetouziLab =  [[UILabel alloc] initWithFrame:CGRectMake(15, kHEIGHT * 0.23, 100, 30)];
        self.wodetouziLab.font = [UIFont systemFontOfSize:14];
        self.wodetouziLab.text =  @"0.00";
        [self addSubview:self.wodetouziLab];
        
        //累计收益(元)
        UILabel *subbLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH /2 + 10, kHEIGHT * 0.2, 100, 30)];
        subbLabel.font = [UIFont systemFontOfSize:14];
        subbLabel.textColor = [UIColor grayColor];
        subbLabel.text = @"累计收益 (元)";
        [self addSubview:subbLabel];
        
       self.leijishouyiLab =  [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH /2 + 10, kHEIGHT * 0.23, 100, 30)];
        self.leijishouyiLab.font = [UIFont systemFontOfSize:14];
        self.leijishouyiLab.text = @"0.00";
        [self addSubview:self.leijishouyiLab];

        //冻结资金(元)
        UILabel *coldLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, kHEIGHT * 0.315, 100, 30)];
        coldLabel.font = [UIFont systemFontOfSize:14];
        coldLabel.textColor = [UIColor grayColor];
        coldLabel.text = @"冻结资金 (元)";
        [self addSubview:coldLabel];
        
        self.dongjiezijin =  [[UILabel alloc] initWithFrame:CGRectMake(15, kHEIGHT * 0.33 + 10, 100, 30)];
         self.dongjiezijin.font = [UIFont systemFontOfSize:14];
         self.dongjiezijin.text = @"0.00";
        [self addSubview: self.dongjiezijin];
        
        //可用余额(元)
        UILabel *remainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH * 0.5 + 10, kHEIGHT * 0.315, 100, 30)];
        remainingLabel.font = [UIFont systemFontOfSize:14];
        remainingLabel.textColor = [UIColor grayColor];
        remainingLabel.text = @"可用余额 (元)";
        [self addSubview:remainingLabel];
        
        self.zhanghuyueLab =  [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH * 0.5    + 10, kHEIGHT * 0.33 + 10, 100, 30)];
        self.zhanghuyueLab.font = [UIFont systemFontOfSize:14];
        self.zhanghuyueLab.text = @"0.00";
        [self addSubview:self.zhanghuyueLab];
        
        //存钱罐收益(元)0.00
        self.boxlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, kHEIGHT * 0.44, kWIDTH, 30)];
         self.boxlabel.textColor = [UIColor grayColor];
         self.boxlabel.text = @"存钱罐收益(元)0.00";
        [self addSubview: self.boxlabel];
        
        //充值按钮
        UIButton *topUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        topUpButton.frame = CGRectMake(10, kHEIGHT * 0.5 + 8, kWIDTH / 2 - 10, 30);
        topUpButton.backgroundColor = [XXColor btnGoldenColor];
        [topUpButton setTitle:@"充值" forState:UIControlStateNormal];
        [topUpButton addTarget:self action:@selector(topUpButton:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:topUpButton];
        
        //提现按钮
        UIButton *takeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        takeButton.frame = CGRectMake(kWIDTH / 2 + 10, kHEIGHT * 0.5 + 8, kWIDTH / 2 - 20, 30);
        takeButton.backgroundColor = [XXColor chongzhiColor];
        [takeButton setTitle:@"提现" forState:UIControlStateNormal];
        [takeButton addTarget:self action:@selector(takeButton:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:takeButton];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, kHEIGHT * 0.57, kWIDTH, 10)];
        backView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:backView];

        
        
    }
    return self;
}


-(void)setBasicInfo:(BasicInfo *)basicInfo{
    if (_basicInfo != basicInfo) {
        _basicInfo = basicInfo;
    }
    

    
}

-(void)setUserInfo:(UserInfo *)userInfo {
    if (_userInfo != userInfo) {
        _userInfo = userInfo;
    }
   self.zongzichanLab.text = [NSString stringWithFormat:@"总资产(元) %.2f", userInfo.available.floatValue/100 + userInfo.frozeAmount.floatValue/100 + userInfo.investAmount.floatValue/100];
    self.yuqishouyiLab.text = [NSString stringWithFormat:@"预期待收收益(元) %.2f", userInfo.unrepaidInterest.floatValue/100];
    self.leijishouyiLab.text = [NSString stringWithFormat:@"%.2f", userInfo.totalInterest.floatValue/100];
    self.wodetouziLab.text = [NSString stringWithFormat:@"%.2f", userInfo.investAmount.floatValue/100];
    self.zhanghuyueLab.text = [NSString stringWithFormat:@"%.2f", userInfo.available.floatValue/100];
    self.dongjiezijin.text = [NSString stringWithFormat:@"%.2f", userInfo.frozeAmount.floatValue/100];
    self.boxlabel.text = [NSString stringWithFormat:@"存钱罐收益(元) %.2f", userInfo.piggybankamount.floatValue/100];

}


//交易记录点击事件
- (void)recordsbutton:(UIButton *)yy{
//    JYJLViewController * jyjlVc = [[JYJLViewController alloc] init];
//    UINavigationController *nav =  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    [nav pushViewController:jyjlVc animated:YES];
    [self.delegate tradeRecord];
    
    
}

//充值按钮点击事件
- (void)topUpButton:(UIButton *)yy{
    NSLog(@"%d",11);
}

//提现按钮点击事件
- (void)takeButton:(UIButton *)yy{
    NSLog(@"%d",11);
}




@end
