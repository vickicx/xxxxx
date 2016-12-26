//
//  PopView.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "PopView.h"

@implementation PopView
    
    
- (id)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            // Initialization code
            _innerView = [UIView new];
            _innerView.frame = frame;
            _innerView.backgroundColor = GetColor(@"#ffffff");
            [self addSubview:_innerView];
            [self createViews];
        }
        return self;
    }
    
    
+ (instancetype)defaultPopupView{
    return [[PopView alloc]initWithFrame:CGRectMake(0, 0, FitWidth - 47 * 2, 290)];
}
    
- (void)dismissAction:(id)sender{
    [_parentVC lew_dismissPopupView];
}
    
- (void)createViews{
    self.picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, FitWidth - 47 * 2, 290)];
    _picView.image = [UIImage imageNamed:@"shenhejilu"];
    [_innerView addSubview:_picView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
