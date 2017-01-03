//
//  DHFGestureCloseVC.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "KKGestureLockView.h"
#import "DHFForgerhandVC.h"

@interface DHFGestureCloseVC : SubBaseViewController

@property (nonatomic, strong)UILabel *tipLab;
@property (nonatomic, strong)KKGestureLockView *lockView;
@property (nonatomic, assign)BOOL isShutDownGesturePassword;
@property (nonatomic, strong)UIButton *forgetBtn;
@property (nonatomic, strong)UIButton *otherBtn;
@property (nonatomic, strong)UILabel *welcomeLabel;

@end
