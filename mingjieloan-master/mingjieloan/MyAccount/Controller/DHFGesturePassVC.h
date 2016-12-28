//
//  DHFGesturePassVC.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "SubBaseViewController.h"
#import "KKGestureLockView.h"


typedef NS_ENUM(NSUInteger, GestureMoudle) {

    newPassword = 1,

    changePassword = 2,

};

@interface DHFGesturePassVC : SubBaseViewController

@property (nonatomic, strong)UILabel *tipLab;
@property (nonatomic, strong)KKGestureLockView *lockView;
@property (nonatomic, assign)GestureMoudle gestureMoudle;
@property (nonatomic, copy)NSString *passwordPre;

@property (nonatomic, assign)BOOL isVerifying;


@end
