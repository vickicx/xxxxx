//
//  JYJLViewXX.m
//  Mingjie
//
//  Created by zjj on 16/8/8.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "JYJLViewXX.h"

@implementation JYJLViewXX

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    if ([self.delegate respondsToSelector:@selector(touchesBegan:)]) {
        
        [self.delegate touchesBegan:self];

    }
    
}

@end
