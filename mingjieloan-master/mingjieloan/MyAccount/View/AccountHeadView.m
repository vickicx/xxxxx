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
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT * 0.18)];
        view.backgroundColor = [XXColor imagasAsetsSum];
        
        //总资产
        UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kWIDTH, kHEIGHT * 0.1)];
        subLabel.font = [UIFont systemFontOfSize:28];
        subLabel.textColor = [UIColor whiteColor];
        subLabel.text = @"总资产(元) 0.00";
        [view addSubview:subLabel];
        
        //预期代收收益
        UILabel *earningsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, kHEIGHT *   0.1, kWIDTH * 0.5, 30)];
        earningsLabel.text = @"预期待收收益(元) 0.00";
        earningsLabel.textColor = [UIColor whiteColor];
        [view addSubview:earningsLabel];
        
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
        
        UILabel *myLabelYuan =  [[UILabel alloc] initWithFrame:CGRectMake(15, kHEIGHT * 0.23, 100, 30)];
        myLabelYuan.font = [UIFont systemFontOfSize:14];
        myLabelYuan.text = @"0.00";
        [self addSubview:myLabelYuan];
        
        //累计收益(元)
        UILabel *subbLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH /2 + 10, kHEIGHT * 0.2, 100, 30)];
        subbLabel.font = [UIFont systemFontOfSize:14];
        subbLabel.textColor = [UIColor grayColor];
        subbLabel.text = @"累计收益 (元)";
        [self addSubview:subbLabel];
        
        UILabel *subbLabelYuan =  [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH /2 + 10, kHEIGHT * 0.23, 100, 30)];
        subbLabelYuan.font = [UIFont systemFontOfSize:14];
        subbLabelYuan.text = @"0.00";
        [self addSubview:subbLabelYuan];

        //冻结资金(元)
        UILabel *coldLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, kHEIGHT * 0.315, 100, 30)];
        coldLabel.font = [UIFont systemFontOfSize:14];
        coldLabel.textColor = [UIColor grayColor];
        coldLabel.text = @"冻结资金 (元)";
        [self addSubview:coldLabel];
        
        UILabel *coldLabelYuan =  [[UILabel alloc] initWithFrame:CGRectMake(15, kHEIGHT * 0.33 + 10, 100, 30)];
        coldLabelYuan.font = [UIFont systemFontOfSize:14];
        coldLabelYuan.text = @"0.00";
        [self addSubview:coldLabelYuan];
        
        //可用余额(元)
        UILabel *remainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH * 0.5 + 10, kHEIGHT * 0.315, 100, 30)];
        remainingLabel.font = [UIFont systemFontOfSize:14];
        remainingLabel.textColor = [UIColor grayColor];
        remainingLabel.text = @"冻结资金 (元)";
        [self addSubview:remainingLabel];
        
        UILabel *remainingLabelYuan =  [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH * 0.5    + 10, kHEIGHT * 0.33 + 10, 100, 30)];
        remainingLabelYuan.font = [UIFont systemFontOfSize:14];
        remainingLabelYuan.text = @"0.00";
        [self addSubview:remainingLabelYuan];
        
        //存钱罐收益(元)0.00
        UILabel *boxlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, kHEIGHT * 0.44, kWIDTH, 30)];
        boxlabel.textColor = [UIColor grayColor];
        boxlabel.text = @"存钱罐收益(元)0.00";
        [self addSubview:boxlabel];
        
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
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, kHEIGHT * 0.57, kWIDTH, 14)];
        backView.backgroundColor = [UIColor blueColor];
        [self addSubview:backView];

        


        
        

        
    }
    return self;
}
//交易记录点击事件
- (void)recordsbutton:(UIButton *)yy{
    
    NSLog(@"%d",11);
    
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
