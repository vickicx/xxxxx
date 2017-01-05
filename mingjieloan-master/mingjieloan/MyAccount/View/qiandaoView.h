//
//  qiandaoView.h
//  mingjieloan
//
//  Created by vicki on 2017/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol qiandaoDelegate <NSObject>

- (void)qiandao;

@end

@interface qiandaoView : UIView
@property (weak, nonatomic) id<qiandaoDelegate> qiandao;
@end
