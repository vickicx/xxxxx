//
//  WDXXDetailViewController.h
//  Yilicai
//
//  Created by 盐商 on 16/3/29.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "BaseViewController.h"

@interface WDXXDetailViewController : SubBaseViewController

@property (nonatomic, copy) NSString *msgTitle;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *msg;

- (void)adjustPosition;

@end
