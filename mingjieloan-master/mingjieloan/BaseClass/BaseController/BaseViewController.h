//
//  BaseViewController.h
//  mingjieloan
//
//  Created by vicki on 2016/12/20.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"
#import "BasicInfo.h"

@interface BaseViewController : UIViewController

@property (strong, nonatomic) UserInfo * userInfo;

@property (strong, nonatomic) BasicInfo * basicInfo;

@end
