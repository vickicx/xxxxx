//
//  LoginUser.h
//  mingjieloan
//
//  Created by vicki on 2016/12/21.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

@interface LoginUser : NSObject

-(BOOL)saveLoginUser:(LoginModel *)loginModel;
-(LoginModel *)readLoginUser;
-(void)removeLoginUser;
@end
