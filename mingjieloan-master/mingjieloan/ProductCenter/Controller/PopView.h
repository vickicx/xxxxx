//
//  PopView.h
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"UIViewController+LewPopupViewController.h"
#import "LewPopupViewAnimationFade.h"
#import "LewPopupViewAnimationSlide.h"
@interface PopView : UIView

@property (nonatomic, strong)UIView *innerView;
@property (nonatomic, weak)UIViewController *parentVC;
@property (nonatomic, strong)UIImageView *picView;
+ (instancetype)defaultPopupView;
@end