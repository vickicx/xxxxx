//
//  JYJLViewXX.h
//  Mingjie
//
//  Created by zjj on 16/8/8.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYJLViewXX;

@protocol JYJLViewXXDelegate<NSObject>

//必须实现
- (void)touchesBegan:(JYJLViewXX*)viewXX;

@end


@interface JYJLViewXX : UIView

@property (nonatomic, assign) id <JYJLViewXXDelegate> delegate;


@end
