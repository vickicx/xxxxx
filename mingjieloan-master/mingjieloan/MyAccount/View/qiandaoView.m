//
//  qiandaoView.m
//  mingjieloan
//
//  Created by vicki on 2017/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "qiandaoView.h"

@implementation qiandaoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createView];
    }
    return self;
}
-(void)createView {
    UIView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    background.backgroundColor = [UIColor grayColor];
    background.alpha = 0.8;
    [self addSubview: background];
    UIImageView *images = [[UIImageView alloc] initWithFrame:CGRectMake(29 *FitWidth, 159 * FitHeight, kWIDTH - 60 *FitWidth, kHEIGHT - 300 * FitHeight)];
    images.image = [UIImage imageNamed:@"sign-10"];
    UIButton *knowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    knowBtn.frame = CGRectMake(100 * FitWidth, images.height - 80 * FitHeight, 160 * FitWidth, 60 * FitHeight);
    [knowBtn addTarget:self action:@selector(knowBtnDidSelected:) forControlEvents:UIControlEventTouchUpInside];
    [images addSubview:knowBtn];
    
    [self addSubview:images];
    
}

-(void)knowBtnDidSelected:(UIButton *)button {
    [self.qiandao qiandao];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
