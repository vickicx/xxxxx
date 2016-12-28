//
//  AccountHeadView.h
//  mingjieloan
//
//  Created by 谢丰泽 on 2016/12/26.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYJLViewController.h"
typedef void (^tiaozhuan)(void);

@protocol TrageRecordDelegate <NSObject>

- (void)tradeRecord;

@end

@interface AccountHeadView : UIView

@property (nonatomic, copy)tiaozhuan tiao;

@property (weak, nonatomic) id<TrageRecordDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame;


@end
