//
//  DHFGesOpenVC.h
//  mingjieloan
//
//  Created by kang on 16/12/28.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "KKGestureLockView.h"
#import "DHFForgerhandVC.h"
@interface DHFGesOpenVC : SubBaseViewController

@property (nonatomic, strong)UILabel *tipLab;
@property (nonatomic, strong)KKGestureLockView *lockView;
@property (nonatomic, assign)BOOL isShutDownGesturePassword;
@property (nonatomic, strong)UIButton *forgetBtn;
@property (nonatomic, strong)UIButton *otherBtn;
@property (nonatomic, strong)UILabel *welcomeLabel;


@end
